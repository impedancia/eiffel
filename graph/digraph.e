note
	description: "Summary description for {DIGRAPH}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DIGRAPH[node_type -> HASHABLE]
inherit
	HASH_TABLE[detachable ARRAYED_SET[node_type], node_type]
		rename
			make as init
		end

create
	init
feature
	addNode(newNode : node_type)
	require
		not has (newNode)
	local
		newSet : ARRAYED_SET[node_type]
	do
--		if not has (newNode) then
			create newSet.make (0)
			put(newSet, newNode)
--		end
	ensure
		at (newNode) /=Void
	end
	addEdge(node1, node2 :node_type)
	require
		has (node1) and has (node2)
	local
		node : ARRAYED_SET[node_type]
	do
		node := at (node1)
		if node /= Void then node.put (node2) end
	end

	isThereEdge(node1, node2 : node_type) : BOOLEAN
	require
		has (node1) and at (node1) /= Void
	local
		edges : ARRAYED_SET[node_type]
	do
		--if nodes /= Void and has (node1) then
			edges := at (node1)
			if edges /= Void then
				if edges.has (node2) then Result := true
				else Result := false
				end
			end
	--	else Result := false
	--	end
	end

	union(g1, g2:like Current) : like Current
	require
		g1 /= Void and g2 /= Void
	local
		retval : like Current
		edges : ARRAYED_SET[node_type]
		edges2 : ARRAYED_SET[node_type]
	do
		create retval.init (g1.capacity+g2.capacity)
		retval.copy (g1)
		across
			g2.keys as k2
		loop
			if retval.has (k2.item) then
				edges := retval.at (k2.item)
				edges2 := g2.at (k2.item)
				if edges /= Void and edges2 /= Void then
					edges.merge (edges2.linear_representation)
				end
			else
				retval.put (edges2, k2.item)
			end
		end

		Result := retval
	end

	bejaras(agens : DFSAGENT[node_type])
	require
			agens /= Void
	local
		solution : ARRAYED_QUEUE[node_type]
		c_key :node_type
		c_node : ARRAYED_LIST[node_type]
		cnt : INTEGER
	do
		create solution.make(current.keys.count)
		print("mélységi bejárás%N")
		agens.put (current.keys.at (0))
		from
		invariant
			agens.count + solution.count <= keys.count *2
		until
			solution.count = keys.count
		loop
			c_key := agens.item
			agens.remove

			solution.put (c_key)
			c_node := at (c_key)

			if c_node /= void then
				across
					c_node.new_cursor.reversed as i
				from
					cnt := 0
				invariant
					agens.count <= keys.count
				loop
					c_key := i.item
					if not solution.has (c_key) then
						agens.put (c_key)
					else
						cnt := cnt + 1
					end

				variant
					keys.count - agens.count -cnt
				end
			end
		variant
			keys.count - solution.count
		end
		print("bejárás:%N")
		across 0 |..| (solution.count-1) as s
		loop


			print(solution.item)
			print(":")
			print(solution.count)
			solution.remove
			--if solution.count > 0 then

			--end

			print("%N")
		end

	end
end

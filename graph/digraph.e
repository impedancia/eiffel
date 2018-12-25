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
end

note
	description: "Summary description for {DIGRAPH}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DIGRAPH[node_type -> HASHABLE]
inherit
	HASH_TABLE[ARRAYED_SET[node_type], node_type]
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
end

note
	description: "Summary description for {GRAPH}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GRAPH[node_type -> HASHABLE]
inherit
	DIGRAPH[node_type]
		redefine
			addedge
	END
create
	init
feature
	addEdge(node1, node2 :node_type)
	local
		node : ARRAYED_SET[node_type]
	do
		node := at (node2)
		if node /= Void then node.put (node1) end
		precursor {DIGRAPH}(node1,node2)
	end
end

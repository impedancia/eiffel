note
	description: "Summary description for {DFSAGENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DFSAGENT[node_type -> HASHABLE]
inherit
	--ARRAYED_STACK[TUPLE[HASHABLE,ARRAYED_SET[node_type]]]
	ARRAYED_STACK[node_type]
		rename
			make as init
			--,item as stack_item
		--redefine
		--	item
		end
create
	make, init

feature {NONE}
	--make(n:INTEGER st : TUPLE[HASHABLE,ARRAYED_SET[node_type]])
	make(n:INTEGER st : node_type)
	do
		init(n)
		put (st)
	end
feature
	--item : TUPLE[HASHABLE,ARRAYED_SET[node_type]]
--	item : node_type
--	do
		--across stack_item.at(1) as n all  end
--		Result := precursor
--	end
end

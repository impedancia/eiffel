note
	description: "Summary description for {SORTED_SEQ}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SORTED_SEQ[T -> COMPARABLE]
	inherit LINKED
	rename
		link as next,
		set as set_next,
		valid as valid_next
	end
	create
		make

	feature {NONE}
		make(val: T)
		do
			value := val
		end

	feature
		value : T
		valid_next(other: detachable like current):BOOLEAN
		do
			Result := false
			if other = Void then Result := TRUE
			else
				if other.value >= value then
					Result := true
				end
			end
		end
		insert(val : T)
		require
			val >= value
		local
			oldnext : like current
			newnext : like current
		do
			if next = Void then
				create newnext.make (val)
				set_next(newnext)
			else
				if attached next as next_a then
					if next_a.value > val then
						create newnext.make (val)
						oldnext := next
						set_next(newnext)
						newnext.set_next (oldnext)

					else
						next_a.insert (val)
					end
				end
			end
		ensure
			contains(val)
		end
		contains(val :T):BOOLEAN
		do
			Result := false
			if value = val then Result := true
			else
				if attached next as next_a then
					Result := next_a.contains(val)
				end
		end
		end
	feature {SORTED_SEQ}
		find_position(val : T) : detachable like current
		do
			if val < value then Result := Void
			else

				if attached next as next_a then
					if next_a.value > val then
						Result := current
					else
						Result := next_a.find_position(val)
					end
				else
					Result := Current
				end
			end
		end
--ez a rekurzív megvalósítás
		find_position_attached(val : T) : like current
		require
			val >= value
		do
			if attached next as next_a then
				if next_a.value > val then
					Result := current
				else
					Result := next_a.find_position_attached(val)
				end
			else
				Result := current
			end
		end
		find_position_attached_loop(val : T) : like current
		require
			val >= value
		local
			node : like current
			prev_node : like current
			exit : BOOLEAN
		do
			node := current
			prev_node := current
			from
				exit := false
				prev_node := current
				if attached next as next_a then
					node := next_a
				else
					exit := true
				end
--			invariant
--				node.next = void or node.value <= val
			until
				exit
			loop
				if node.value > val then exit := true
				else
					prev_node := node
					if attached node.next as next_a then
						node := next_a
					else
						exit := true
					end
				end
			end
		Result := prev_node
		end
end

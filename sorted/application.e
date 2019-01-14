note
	description: "sorted application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
	local
        s1, s2, s3: SORTED_SEQ[INTEGER]
        a, b, c: detachable LINKED
        s4 : SORTED_SEQ[INTEGER]
    do
        create s1.make(10)
        create s2.make(20)
        -- s2.set_next(s1) -- raises Precondition violation
        s1.set_next(s2)
        -- s2.insert(15) -- raises Precondition violation
        s1.insert(15)
        print( s1.contains(10).out )  -- True
        print( s1.contains(15).out )  -- True
        print( s1.contains(20).out )  -- True
        print( s2.contains(20).out )  -- True
        print( s2.contains(10).out )  -- False
        print( s1.contains(-7).out )  -- False
        print( s1.contains(12).out )  -- False
        print( s1.contains(17).out )  -- False
        print( s1.contains(30).out )  -- False
        print("%N")
        a := s1
        b := s2
        b.set(c)

--         print( s1.find_position_attached(19).value.out) --15
  --       print( s1.find_position_attached(16).value.out) --15
    --     print( s1.find_position_attached(15).value.out) --15
      --   print( s1.find_position_attached(14).value.out) --10
      	-- print( s1.find_position_attached(9).value.out) --contract violation
	--	print( s1.find_position_attached_loop(19).value.out) --15
  	--	print( s1.find_position_attached_loop(16).value.out) --15
  	--	print( s1.find_position_attached_loop(15).value.out) --15
  	--	print( s1.find_position_attached_loop(14).value.out) --10
  		--print( s1.find_position_attached_loop(9).value.out) --cv
  	--	print( s1.find_position_attached_loop(21).value.out) --20
    --     print( s1.find_position_attached(15).value.out) --15
      --   print( s1.find_position_attached(14).value.out) --10
      	-- print( s1.find_position_attached(9).value.out) --contract violation
--		s4 := s1.find_position (9)
--		print((s4 = Void).out) -- True
--		s4 := s1.find_position (14)
--		print((s4 = Void).out) -- False
--		if attached s4 as s4_a then
--			print(s4_a.value.out)
--		end
        b.link := c                   -- Extra: same as above
        --b.set(a) -- raises Precondition violation
        if {s: SORTED_SEQ[INTEGER]} a then   -- this is called "Object Test"
            s.set_next(s2)
            print("Yes!%N")
        end
        create s3.make(10)
        s3.insert(20)
        print( (s1.is_equal(s3)).out )  -- Extra: True
        print("%N")
		end

end

note
	description: "racionalis application root class"
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
		local
			f1 : FRACTION
			f2 : FRACTION
			f3 : FRACTION
			f4 : FRACTION
			f5 : FRACTION
			res : FRACTION
		do
			create f1.from_integer (4)
			create f2.from_integer (2)
			create f3.make (6,4)
			res := f1.divided_by (f2).times (f3)
		--	res := (create{FRACTION}.from_integer(4)).divided_by((create{FRACTION}.from_integer(2)).times(create{FRACTION}.make(6,4)))
			print("res: " + res.out  + "%N")
			res := res.simplify
			print("simplified: " + res.out + "%N")
			create f4.make (8,-2)
			print("f4: " + f4.out + "%N")
			f4 := f4.simplify
			print("simplified: " + f4.out + "%N")
			create f5.make (0,-123)
			f5 := f5.simplify
			print("simplified: " + f5.out + "%N")
		end


end
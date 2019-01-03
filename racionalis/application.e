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
			f6 : FRACTION
			res : FRACTION
			r1 : RATIONAL
		do
			create f6.make (6, 4)
			f6 := f6.simplify
			create f1.from_integer (4)
			create f2.from_integer (2)
			create f3.make (6,4)
		--	res := f1.divided_by (f2).times (f3)
			res := (create{FRACTION}.from_integer(4)).divided_by((create{FRACTION}.from_integer(2)).times(create{FRACTION}.make(6,4)))
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
			print("f3: " + f3.out + "%N")
			print("f4: " + f4.out + "%N")
			res := f3 * f4
			print("times (*) f4 * f3: " + res.out + "%N")
			print((4 / (2 * create{FRACTION}.make(6,4))).out + "%N")
			create r1.from_fraction (f3)
			print("f3: " + f3.out + "%N")
			print("r1: " + r1.out + "%N")
			print("r1 TIMES 6/4: " +r1.times (create{RATIONAL}.make(6,4)).out + "%N")
			print("r1 divided_by 6/4: " +r1.divided_by (create{RATIONAL}.make(6,4)).out + "%N")
		end


end

note
	description: "Summary description for {RATIONAL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RATIONAL
inherit
	ANY
	undefine
		default_create,
		out
end
inherit {NONE}
	FRACTION
	undefine
		is_equal
	redefine
		make
end
create
	from_fraction,make
convert
	from_fraction({FRACTION})
feature {NONE}
	from_fraction(f : FRACTION)
	require f.getdenominator /= 0
	local
		s : like current
	do
		make(f.getnumerator, f.getdenominator)
	end
	make(num : INTEGER denom :INTEGER)
	local
		s : like current
		do
			numerator := num
			denominator := denom
		if not is_simplified then
			s := simplify_current
		end

		end
feature {RATIONAL}
	simplify_current : like current
	local
		s : like current
	do
		s := simplify
		numerator := s.getnumerator
		denominator := s.getdenominator
		Result := s
	end
invariant
	gcd(numerator,denominator) = 1
end

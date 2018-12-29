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
		numerator,
		denominator
end
create
	from_fraction,make
convert
	from_fraction({FRACTION})
feature {NONE}
	from_fraction(f : FRACTION)
	require f.getdenominator /= 0
	do
		numerator := f.getnumerator
		denominator := f.getdenominator
	end
feature {RATIONAL}
	numerator : INTEGER assign setnumerator
	attribute
		Result := precursor
	end
	denominator :INTEGER assign setdenominator
	attribute
		Result := precursor
	end

setnumerator(i: INTEGER)
local
	s : like current
do
	numerator := i
	s := simplify()
	numerator := s.getnumerator
	denominator := s.getdenominator
end

setdenominator(i: INTEGER)
local
	s : like current
do
	denominator := i
	s := simplify()
	numerator := s.getnumerator
	denominator := s.getdenominator
end

invariant
	gcd(numerator,denominator) = 1
end

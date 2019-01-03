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
--		divided_by,
--		times,
		make
end
create
	from_fraction,make
convert
	from_fraction({FRACTION})
--	,to_fraction:{FRACTION}
feature {NONE}
--	to_fraction: FRACTION
--	local
--		f:FRACTION
--	do
--		create f.make (getnumerator, getdenominator)
--		Result := f
--	end
	from_fraction(f : FRACTION)
	require f.getdenominator /= 0
	local
		s : like current
	do
		make(f.getnumerator, f.getdenominator)
	--	numerator := f.getnumerator
	--	denominator := f.getdenominator
	--	if not is_simplified then
	--		s := simplify_current
	--	end
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
--feature
--	divided_by alias "/"(other : like current) : like current
--	local
--		s : like current
--	do
--		s := precursor(other)
--		Result := simplify_current
--	end
--	times alias "*"(other : like current) : like current
--	local
--		s : like current
--	do
--		s := precursor(other)
--		Result := simplify_current
--	end
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

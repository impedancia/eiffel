note
	description: "Summary description for {FRACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	FRACTION
inherit
	COMPARABLE
	redefine
		is_equal,
		out,
		is_less,
		default_create
	end
create
	make, from_integer, default_create
convert
	from_integer({INTEGER})
feature {NONE} -- Initialization
	from_integer(int : INTEGER)
	do
		make(int, 1)
	end
	make(num : INTEGER denom :INTEGER)
		require
			denom /= 0
		do
			numerator := num
			denominator := denom

		end
	default_create
	do
		numerator := 0
		denominator := 1
	end
feature
	divided_by alias "/"(other : like current) : like current
	require
		other.getnumerator /= 0
	local
		ret : like current
	do
		create ret.make (numerator * other.getdenominator, denominator *other.getnumerator)
		Result := ret
	end
	times alias "*"(other : like current) : like current
	local
		ret : like current
	do
		create ret.make (numerator * other.getnumerator, denominator *other.getdenominator)
		Result := ret
	end

	simplify : like current
	local
		lnko : INTEGER
		ret : like current
		newnum : INTEGER
		newdenom : INTEGER
	do
		lnko := gcd(numerator, denominator)
		newnum := numerator // lnko
		newdenom := denominator // lnko
		if newdenom < 0 then
			newdenom := newdenom * -1
			newnum := newnum * -1
		end
		if newnum = 0 then
			newdenom := 1

		end
		create ret.make(newnum, newdenom)
		Result := ret
	ensure
		Result.getdenominator > 0
		and (Result.getnumerator = 0 implies Result.getdenominator = 1)
		and gcd (Result.getnumerator, Result.getdenominator ) = 1
	end
feature {FRACTION}
	gcd(a:INTEGER b : INTEGER) : INTEGER
	local
		rem : INTEGER
		a_ : INTEGER
		b_ : INTEGER
	do
		a_ := a
		b_ := b
		from
			rem := b
		invariant
			rem > 0 implies (a \\ rem = 0 and b \\ rem = 0)
		until
			rem = 0
		loop
			rem := a_ \\ b_
			a_ := b_
			b_ := rem
		variant
			rem.abs
		end
		Result := a_;
	ensure
		a \\ Result = 0 and b \\ Result = 0
	end
feature
	getNumerator : INTEGER
	do
		Result := numerator
	end
	getDenominator : INTEGER
	do
		Result := denominator
	end
feature
	is_less alias "<"(other : like current) : BOOLEAN
	require else
		other /= Void
	do
		Result := FALSE
		if numerator < other.getnumerator or denominator > other.getdenominator then
			Result := TRUE
		end

	end
	is_equal(other : like current) : BOOLEAN
	require else
		other /= Void
	local
		s1 : FRACTION
		s2 : FRACTION
	do
		Result := TRUE
		s1 := current.simplify
		s2 := other.simplify
		if s1.getnumerator /= s2.getnumerator then Result := FALSE end
		if s1.getdenominator /= s2.getdenominator then Result := FALSE end
	end
	out : STRING_8
	do
		Result := numerator.out + "/" + denominator.out

	end
feature {NONE}
	numerator : INTEGER
		attribute
			Result := 0
		end
	denominator : INTEGER
		attribute
			Result := 1
		end
invariant
	denominator /= 0
end

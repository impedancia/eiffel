note
	description: "Summary description for {FRACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FRACTION
inherit
	COMPARABLE
	redefine
		is_equal,
		out,
		is_less

	end
create
	make, from_integer

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
feature
	divided_by(other : like current) : like current
	require
		other.getnumerator /= 0
	do
		numerator := numerator * other.getdenominator
		denominator := denominator *other.getnumerator
		Result := current
	end
	times(other : like current) : like current
	do
		numerator := numerator * other.getnumerator
		denominator := denominator *other.getdenominator
		Result := current
	end

	simplify : like current
	local
		lnko : INTEGER
	do
		lnko := gcd(numerator, denominator)
		numerator := numerator // lnko
		denominator := denominator // lnko
		if denominator < 0 then
			denominator := denominator * -1
			numerator := numerator * -1
		end
		if numerator = 0 then
			denominator := 1

		end
		Result := Current
	ensure
		denominator > 0
		and (numerator = 0 implies denominator = 1)
		and gcd (numerator, denominator ) = 1
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
		until
			rem = 0
		loop
			rem := a_ \\ b_
			a_ := b_
			b_ := rem
		end
		Result := a_;
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
	do
		Result := TRUE
		if numerator /= other.getnumerator then Result := FALSE end
		if denominator /= other.getdenominator then Result := FALSE end
	end
	out : STRING_8
	do
		Result := numerator.out + "/" + denominator.out

	end
feature {NONE}
	numerator : INTEGER
	denominator : INTEGER
invariant
	invariant_clause: denominator /= 0

end

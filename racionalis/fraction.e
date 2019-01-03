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
		create ret.make (numerator * other.getdenominator, denominator * other.getnumerator)
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
		if numerator = 0 then
			create ret.make(0,1)
			Result := ret
		else
			lnko := gcd(numerator, denominator)
			newnum := numerator // lnko
			newdenom := denominator // lnko
			if newdenom < 0 then
				newdenom := newdenom * -1
				newnum := newnum * -1
			end
			create ret.make(newnum, newdenom)
			Result := ret
		end
	ensure
		Result.getdenominator > 0
		and (Result.getnumerator = 0 implies Result.getdenominator = 1)
		and gcd (Result.getnumerator, Result.getdenominator ) = 1
	end
feature {FRACTION}
	is_simplified : BOOLEAN
	do
		Result :=  gcd(numerator,denominator) = 1
	end
	gcd(a:INTEGER b : INTEGER) : INTEGER
	local
		rem : INTEGER
		a_ : INTEGER
		b_ : INTEGER
	do
		if a = 0 then
			Result := b
		else
			if b = 0 then
				Result := a

		else
			a_ := a.abs
			b_ := b.abs
			--from
			--	rem := b
			from
			invariant
				gcd(a,b) = gcd(a_,b_)
			until
				a_ = b_
			loop
				if a_ > b_ then
					a_ :=  a_ - b_
				else
					b_ := b_ -a_
				end
			variant
				a_ + b_
			end
			Result := a_;
		end
		end
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
		if current.is_simplified then
			s1 := current
		else
			s1 := current.simplify
		end
		if other.is_simplified then
			s2 := other
		else
			s2 := other.simplify
		end


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

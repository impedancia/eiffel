note
	description: "Summary description for {LINKED}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	LINKED
feature
	link : detachable like current assign set
	attribute
		Result := Void
	end
	set(other : detachable like current)
	require
		valid(other)
	do
		link := other
	ensure
		link = other
	end

	valid(other : detachable like current) : BOOLEAN
	deferred
	end

end

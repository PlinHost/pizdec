/atom
	var/flags = 0

/atom/proc/CheckPass(atom/O as mob|obj|turf|area)

	return (!( O.density ) || !( src.density ))

/atom/proc/CheckExit()

	return 1

/obj/move/CheckPass(O as mob|obj)
	return !( src.density )

/obj/structure/window
	flags = 512

/turf/Enter(atom/movable/O as mob|obj, atom/forget as mob|obj|turf|area)
	if (!( isturf(O.loc) ))
		return 1
	for(var/atom/A as mob|obj|turf|area in O.loc)
		if ((!( A.CheckExit(O, src) ) && O != A && A != forget))
			if (O)
				O.Bump(A, 1)
			return 0
		//Foreach goto(34)
	for(var/atom/A as mob|obj|turf|area in src)
		if ((A.flags == 512 && get_dir(A, O) & A.dir))
			if ((!( A.CheckPass(O, src) ) && A != src && A != forget))
				if (O)
					O.Bump(A, 1)
				return 0
		//Foreach goto(127)
	for(var/atom/A as mob|obj|turf|area in src)
		if ((!( A.CheckPass(O, src) ) && A != forget))
			if (O)
				O.Bump(A, 1)
			return 0
		//Foreach goto(244)
	if (src != forget)
		if (!( src.CheckPass(O, src) ))
			if (O)
				O.Bump(src, 1)
			return 0
	return 1
	return

/obj/structure/window/CheckPass(atom/movable/O, target as turf)
	/* Does SOUTHWEST do something hacky for windows, like defines a full 1 square window? --Stephen001 */
	if (src.dir == SOUTHWEST)
		return 0
	else if (get_dir(target, O.loc) == src.dir)
		return 0
	return 1

/obj/structure/window/CheckExit(atom/movable/O, target as turf)
	if (istype(O, /obj/beam))
		return 1
	if (get_dir(O.loc, target) == src.dir)
		return 0
	return 1
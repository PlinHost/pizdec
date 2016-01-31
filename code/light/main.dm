/atom
	var
		light/light

/light
	parent_type = /atom/movable
	layer = 20
	icon = 'lum.dmi'
	icon_state = "6"
	luminosity = 0
	var
		marker = 0

/light/act()
	var/turf/simulated/floor/D = src.loc
	D.act()


/turf/simulated/floor/proc/fuck_light()
	light = new(src)

/mob/proc/see_in_night()
	var/turf/simulated/floor/Q = get_step(src, NORTH)
	var/turf/simulated/floor/W = get_step(src, SOUTH)
	var/turf/simulated/floor/E = get_step(src, WEST)
	var/turf/simulated/floor/R = get_step(src, EAST)
	var/turf/simulated/floor/T = src.loc
	var/turf/simulated/floor/Y = get_step(src, SOUTHEAST)
	var/turf/simulated/floor/A = get_step(src, SOUTHWEST)
	var/turf/simulated/floor/S = get_step(src, NORTHWEST)
	var/turf/simulated/floor/D = get_step(src, NORTHEAST)


	for(var/light/L in range(2,src))
		if(L.loc == Q || L.loc == W || L.loc == E || L.loc == R || L.loc == T || L.loc == Y || L.loc == A || L.loc == S || L.loc == D )
			L.layer = 2
		else
			L.layer = 20

/atom/proc/dark()
	sleep(1)
	for(var/light/L in range(6,src))
		//sleep(1)
		for(var/obj/O in L.loc)
			O.luminosity = 0
		L.icon_state = "6"

	//for(var/obj/machinery/light/LG in range(5,src))
		//sleep(1)
		//if(LG.on == 1)
		//	LG.lumina()

/atom/proc/lumina()
	var/turf/simulated/floor/Q = get_step(src, NORTH)
	var/turf/simulated/floor/W = get_step(src, SOUTH)
	var/turf/simulated/floor/E = get_step(src, WEST)
	var/turf/simulated/floor/R = get_step(src, EAST)
	var/turf/simulated/floor/T = src.loc

	for(var/light/L in Q)
		L.icon_state = "1"
		for(var/light/LI in range(1,Q))
			if(LI.icon_state != "1")
				LI.icon_state = "2"
				var/turf/A = LI.loc
				for(var/light/LIGHT in range(1,A))
					if(LIGHT.icon_state != "1" && LIGHT.icon_state != "2")
						LIGHT.icon_state = "3"
						var/turf/B = LIGHT.loc
						for(var/light/LIGHT2 in range(1,B))
							if(LIGHT2.icon_state != "1" && LIGHT2.icon_state != "2" && LIGHT2.icon_state != "3")
								LIGHT2.icon_state = "4"
								var/turf/C = LIGHT2.loc
								for(var/light/LIGHT3 in range(1,C))
									if(LIGHT3.icon_state != "1" && LIGHT3.icon_state != "2" && LIGHT3.icon_state != "3" && LIGHT3.icon_state != "4")
										LIGHT3.icon_state = "5"
										var/turf/D = LIGHT3.loc
										for(var/light/LIGHT4 in range(1,D))
											if(LIGHT4.icon_state != "1" && LIGHT4.icon_state != "2" && LIGHT4.icon_state != "3" && LIGHT4.icon_state != "4" && LIGHT4.icon_state != "5")
												LIGHT4.icon_state = "6"


	for(var/light/L in W)
		L.icon_state = "1"
		for(var/light/LI in range(1,W))
			if(LI.icon_state != "1")
				LI.icon_state = "2"
				var/turf/A = LI.loc
				for(var/light/LIGHT in range(1,A))
					if(LIGHT.icon_state != "1" && LIGHT.icon_state != "2")
						LIGHT.icon_state = "3"
						var/turf/B = LIGHT.loc
						for(var/light/LIGHT2 in range(1,B))
							if(LIGHT2.icon_state != "1" && LIGHT2.icon_state != "2" && LIGHT2.icon_state != "3")
								LIGHT2.icon_state = "4"
								var/turf/C = LIGHT2.loc
								for(var/light/LIGHT3 in range(1,C))
									if(LIGHT3.icon_state != "1" && LIGHT3.icon_state != "2" && LIGHT3.icon_state != "3" && LIGHT3.icon_state != "4")
										LIGHT3.icon_state = "5"
										var/turf/D = LIGHT3.loc
										for(var/light/LIGHT4 in range(1,D))
											if(LIGHT4.icon_state != "1" && LIGHT4.icon_state != "2" && LIGHT4.icon_state != "3" && LIGHT4.icon_state != "4" && LIGHT4.icon_state != "5")
												LIGHT4.icon_state = "6"
	for(var/light/L in E)
		L.icon_state = "1"
		for(var/light/LI in range(1,E))
			if(LI.icon_state != "1")
				LI.icon_state = "2"
				var/turf/A = LI.loc
				for(var/light/LIGHT in range(1,A))
					if(LIGHT.icon_state != "1" && LIGHT.icon_state != "2")
						LIGHT.icon_state = "3"
						var/turf/B = LIGHT.loc
						for(var/light/LIGHT2 in range(1,B))
							if(LIGHT2.icon_state != "1" && LIGHT2.icon_state != "2" && LIGHT2.icon_state != "3")
								LIGHT2.icon_state = "4"
								var/turf/C = LIGHT2.loc
								for(var/light/LIGHT3 in range(1,C))
									if(LIGHT3.icon_state != "1" && LIGHT3.icon_state != "2" && LIGHT3.icon_state != "3" && LIGHT3.icon_state != "4")
										LIGHT3.icon_state = "5"
										var/turf/D = LIGHT3.loc
										for(var/light/LIGHT4 in range(1,D))
											if(LIGHT4.icon_state != "1" && LIGHT4.icon_state != "2" && LIGHT4.icon_state != "3" && LIGHT4.icon_state != "4" && LIGHT4.icon_state != "5")
												LIGHT4.icon_state = "6"
	for(var/light/L in R)
		L.icon_state = "1"
		for(var/light/LI in range(1,R))
			if(LI.icon_state != "1")
				LI.icon_state = "2"
				var/turf/A = LI.loc
				for(var/light/LIGHT in range(1,A))
					if(LIGHT.icon_state != "1" && LIGHT.icon_state != "2")
						LIGHT.icon_state = "3"
						var/turf/B = LIGHT.loc
						for(var/light/LIGHT2 in range(1,B))
							if(LIGHT2.icon_state != "1" && LIGHT2.icon_state != "2" && LIGHT2.icon_state != "3")
								LIGHT2.icon_state = "4"
								var/turf/C = LIGHT2.loc
								for(var/light/LIGHT3 in range(1,C))
									if(LIGHT3.icon_state != "1" && LIGHT3.icon_state != "2" && LIGHT3.icon_state != "3" && LIGHT3.icon_state != "4")
										LIGHT3.icon_state = "5"
										var/turf/D = LIGHT3.loc
										for(var/light/LIGHT4 in range(1,D))
											if(LIGHT4.icon_state != "1" && LIGHT4.icon_state != "2" && LIGHT4.icon_state != "3" && LIGHT4.icon_state != "4" && LIGHT4.icon_state != "5")
												LIGHT4.icon_state = "6"
	for(var/light/L in T)
		L.icon_state = "1"
		for(var/light/LI in range(1,T))
			if(LI.icon_state != "1")
				LI.icon_state = "2"
				var/turf/A = LI.loc
				for(var/light/LIGHT in range(1,A))
					if(LIGHT.icon_state != "1" && LIGHT.icon_state != "2")
						LIGHT.icon_state = "3"
						var/turf/B = LIGHT.loc
						for(var/light/LIGHT2 in range(1,B))
							if(LIGHT2.icon_state != "1" && LIGHT2.icon_state != "2" && LIGHT2.icon_state != "3")
								LIGHT2.icon_state = "4"
								var/turf/C = LIGHT2.loc
								for(var/light/LIGHT3 in range(1,C))
									if(LIGHT3.icon_state != "1" && LIGHT3.icon_state != "2" && LIGHT3.icon_state != "3" && LIGHT3.icon_state != "4")
										LIGHT3.icon_state = "5"
										var/turf/D = LIGHT3.loc
										for(var/light/LIGHT4 in range(1,D))
											if(LIGHT4.icon_state != "1" && LIGHT4.icon_state != "2" && LIGHT4.icon_state != "3" && LIGHT4.icon_state != "4" && LIGHT4.icon_state != "5")
												LIGHT4.icon_state = "6"
	for(var/light/L in T)
		L.icon_state = "1"
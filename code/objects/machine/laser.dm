/obj/machinery/laser
	icon = 'icons/shaitan_machine.dmi'
	icon_state = "laser"

	act()
		if(dir == 1)
			var/turf/T = locate(x, y+1, z)
			var/obj/beam/B = new(T)
			B.dir = 1
			B.fly()

		if(dir == 2)
			var/turf/T = locate(x, y-1, z)
			var/obj/beam/B = new(T)
			B.dir = 2
			B.fly()

		if(dir == 4)
			var/turf/T = locate(x+1, y, z)
			var/obj/beam/B = new(T)
			B.dir = 4
			B.fly()

		if(dir == 8)
			var/turf/T = locate(x-1, y, z)
			var/obj/beam/B = new(T)
			B.dir = 8
			B.fly()

/obj/beam
	icon = 'icons/shaitan_machine.dmi'
	icon_state = "beam"

	proc/fly()
		var/hit = 0
		while(hit != 1)
			if(istype(loc, /turf/simulated/wall))
				hit = 1
				loc.hit()

			for(var/atom/A in loc)
				if(A.density == 1 && A.pass != 1)
					hit = 1
					A.hit()

			sleep(1)
			if(dir == 2)
				y -= 1

			if(dir == 4)
				x += 1

			if(dir == 8)
				x -= 1

			if(dir == 1)
				y += 1

		if(hit == 1)
			del(src)
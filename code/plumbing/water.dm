/obj/water/water1
	name = "water"
	icon = 'icons/water.dmi'
	icon_state = "water1"
	layer = 2.5

/obj/water
	name = "water"
	icon = 'icons/water.dmi'
	icon_state = "water"
	layer = 5
	var/limit = 0


	New()
		overlays += /obj/water/water1
		process()

	process()

		var/turf/T = src.loc
		T.limit += 1
		spawn while(1)
			sleep(1)
			if(istype(T, /turf/space))
				del(src)

			for(var/obj/items/IT in T)
				if(T.water > 10)
					IT.alpha = 128
				else
					IT.alpha = 255

			if(T.water < 10)
				T.limit = 0
				del(src)

			if(T.temperature > 299) //никаких трактористов
				T.water -= 1
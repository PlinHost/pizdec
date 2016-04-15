/turf
	name = "space"
	icon = 'icons/turf/turfs.dmi'
	icon_state = "space"
	var/oxygen = 0
	var/nitrogen = 0
	var/plasma = 0
	var/CO2 = 0
	var/water = 0
	var/list/datum/reagents/chemical = list()
	pass_gas = 0
	///REAGENTS


/turf/simulated
	name = "simulated"
	oxygen = 500 //500 газоединиц
	nitrogen = 35

	//act_by_item(var/obj/item/I)
		//if(istype(I, /obj/item/unlimited_reagent))
		//	var/obj/item/unlimited_reagent/R = I
		//	R.spawn_me(src)


/turf/simulated/wall
	name = "wall"
	icon_state = "wall"
	density = 1
	opacity = 1
	pass_gas = 0
	temperature = 21
	var/ISSCRDRI = 0
	var/ISWRN = 0


	act_by_item(var/obj/item/tools/I)
		if(istype(I, /obj/item/tools/screwdriver))
			if(ISSCRDRI == 0)
				ISSCRDRI = 1
				usr << "Вы открутили внешние креплени&#255; от стены"
				return

			if(ISSCRDRI == 1)
				ISSCRDRI = 0
				usr << "Вы прикрутили внешние креплени&#255;"
				return

		if(istype(I, /obj/item/tools/wrench))
			if(ISSCRDRI == 1 && ISWRN == 0)
				ISWRN = 1
				usr << "Вы открутили все болты и разобрали стену"
				src = new /turf/simulated/floor/plating(src)
				return

/turf/simulated/floor/whore
	icon_state = "belck"
	oxygen = 500 //500 газоединиц
	nitrogen = 35

/turf/simulated/floor
	name = "floor"
	icon_state = "floor"

/turf/simulated/floor/upbitch
	name = "floor"
	icon_state = "up"

/turf/simulated/floor/downbitch
	name = "floor"
	icon_state = "down"

/turf/simulated/floor/upbitch/Enter(atom/movable/O)
	O.z += 1

/turf/simulated/floor/downbitch/Enter(atom/movable/O)
	O.z -= 1

/turf/simulated/floor/whore/Enter(atom/movable/O)
	O << "\red Ты падаешь в &#255;му!"
	O.z -= 1

/turf/simulated/floor/plating
	name = "plating"
	icon_state = "plating"

/turf/simulated/floor/bar
	name = "bar"
	icon_state = "bar"

/turf/simulated/floor/cafe
	name = "bar"
	icon_state = "cafe"

/turf/simulated/floor/wood
	name = "wood"
	icon_state = "wood"

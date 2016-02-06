/turf
	name = "space"
	icon = 'icons/turfs.dmi'
	icon_state = "space"
	var/oxygen = 0
	var/nitrogen = 0
	var/plasma = 0
	var/CO2 = 0
	var/water = 0
	var/list/datum/reagents/chemical = list()
	pass_gas = 0
	///REAGENTS
	var

		blood = 0
		Fe = 0
		Ag = 0
		Cu = 0
		Au = 0
		H = 0
		K = 0
		Rb = 0
		Po = 0
		O = 0
		Pb = 0
		N = 0
		S = 0
		Cl = 0



/turf/simulated
	name = "simulated"
	oxygen = 500 //500 газоединиц
	nitrogen = 35

/turf/simulated/wall
	name = "wall"
	icon_state = "wall"
	density = 1
	opacity = 1
	luminosity = 0
	pass_gas = 0
	temperature = 21
	var/ISSCRDRI = 0
	var/ISWRN = 0


	act_by_item(var/obj/items/tools/I)
		if(istype(I, /obj/items/tools/screwdriver))
			if(ISSCRDRI == 0)
				ISSCRDRI = 1
				usr << "Вы открутили внешние креплени&#255; от стены"
				return

			if(ISSCRDRI == 1)
				ISSCRDRI = 0
				usr << "Вы прикрутили внешние креплени&#255; от стены"
				return

		if(istype(I, /obj/items/tools/wrench))
			if(ISSCRDRI == 1 && ISWRN == 0)
				ISWRN = 1
				usr << "Вы открутили все болты и разобрали стену"
				src = new /turf/simulated/floor/plating(src)
				return

/turf/simulated/floor/whore
	icon = 'icons/turfs.dmi'
	icon_state = "belck"
	oxygen = 500 //500 газоединиц
	nitrogen = 35

/turf/simulated/floor
	name = "floor"
	icon_state = "floor"
	luminosity = 0

/turf/simulated/floor/upbitch
	name = "floor"
	icon_state = "up"
	luminosity = 0

/turf/simulated/floor/downbitch
	name = "floor"
	icon_state = "down"
	luminosity = 0

/*
/mob/human/proc/my_chem()
	var/turf/T = src.loc
	my_val()
	var/fuck = 0
	if(cur_val < reagents_max)
		if(chemical.len < 1)
			for(var/i = 1, i <= T.chemical.len, i++)
				chemical += T.chemical[i]
				world << "FU"
				return

		for(var/i = 1, i <= chemical.len, i++)
			var/datum/reagents/RG = chemical[i]

			for(var/g = 1, g <= T.chemical.len, g++)
				var/datum/reagents/REAG = T.chemical[g]


				if(RG.name == REAG.name)
					RG.amount += REAG.amount
					REAG.amount -= REAG.amount
					fuck = 1
					//world << "[RG.name]"


		if(fuck == 0)
			for(var/i = 1, i <= T.chemical.len, i++)
				var/datum/reagents/REAG = T.chemical[i]
				chemical += REAG
				world << "YU"
*/

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
	luminosity = 0

/turf/simulated/floor/bar
	name = "bar"
	icon_state = "bar"
	luminosity = 0

/turf/simulated/floor/cafe
	name = "bar"
	icon_state = "cafe"
	luminosity = 0

/turf/simulated/floor/wood
	name = "wood"
	icon_state = "wood"
	luminosity = 0



/atom
	var/brute_resist = 0
	var/temperature_resist = 0
	var/shock_resist = 0

/obj/items
	icon = 'icons/main_items.dmi'
	layer = 26
	weight = 2
	var/brute_damage = 0
	var/burn_damage = 0
	var/shock_damage = 0

/obj/items/tools/screwdriver
	icon = 'icons/tools.dmi'
	icon_state = "screwdriver"
	brute_damage = 5

/obj/items/tools/power/welding_tool
	icon = 'icons/tools.dmi'
	icon_state = "welder"
	brute_damage = 1
	burn_damage = 5
	weight = 10

/obj/items/New()
	personal_id += 1
	my_id = personal_id

/obj/items/tools/wrench
	icon = 'icons/tools.dmi'
	icon_state = "wrench"
	brute_damage = 15

/obj/items/tools/radiotest
	icon = 'icons/tools.dmi'
	icon_state = "radiotest"
	brute_damage = 1

	act_self()
		for(var/wave/R in usr.loc)
			usr << "\blue Бип-бип! Обнаружено излучение:"
			usr << "\blue Сила сигнала [R.force]"
			usr << "\blue Частота [R.frequency]"
			usr << "\blue Длина волны [R.length]"



/*	act()
		if(usr.client.hand == 1)
			var/obj/items/M = src
			M.layer = 25
			usr.client.R.overlays += M
			usr << "Ты берешь [src.name] в правую руку!"
			//usr.contents += M
			//usr.client.my_rhand_contents = M.type

			//del(src)
		if(usr.client.hand == 0)
			var/obj/items/M = src
			M.layer = 25
			usr.client.L.overlays += M
			usr << "Ты берешь [src.name] в левую руку!"
			//usr.contents += M
			//usr.client.my_lhand_contents = M.type
			//del(src)
*/
/*
/mob
	act()
		if(!(istype(src, /mob/human)))
			if(usr.client.act == "grab")
				usr << "\red Ты хватаешь [src]"
				if(usr.client.hand == 1)
					var/mob/M = src
					M.layer = 25
					usr.client.R.overlays += M
					usr << "Ты берешь [src.name] в правую руку!"
					usr.client.my_rhand_contents = M.type
					del(src)
				if(usr.client.hand == 0)
					var/mob/M = src
					M.layer = 25
					usr.client.L.overlays += M
					usr << "Ты берешь [src.name] в левую руку!"
					usr.client.my_lhand_contents = M.type
					del(src)

		else
			usr << "\blue Ты ничего не делаешь с [src] и это замечательно."
*/
/obj/items/fire_ballon
	name = "BALLON"
	icon = 'icons/main_items.dmi'
	icon_state = "OLOLO_BALLON"

/obj/items/drink/beer
	name = "BEERBOOM"
	icon = 'icons/main_items.dmi'
	icon_state = "alcohol"

/obj/items/gun/carp
	name = "carpgun"
	icon = 'icons/main_items.dmi'
	icon_state = "carpgun"
	//bullet = /mob/carp

/obj/items/ore

	uranium
		icon = 'icons/main_items.dmi'
		icon_state = "uranium"

		process()
			spawn while(1)
				sleep(1)
				//world << "HUI"
				rad_wave(27, 3)
		New()
			process()
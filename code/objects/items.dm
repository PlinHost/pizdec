/atom
	var/brute_resist = 0
	var/temperature_resist = 0
	var/shock_resist = 0
	var/pass = 0

/obj/item
	icon = 'icons/obj/item/main_items.dmi'
	layer = 26
	weight = 2
	var/brute_damage = 0
	var/burn_damage = 0
	var/shock_damage = 0

/obj/item/tools
	icon = 'icons/obj/item/tools.dmi'

/obj/item/tools/screwdriver
	icon_state = "screwdriver"
	brute_damage = 5

/obj/item/tools/power/welding_tool
	icon_state = "welder"
	brute_damage = 1
	burn_damage = 5
	weight = 10

/obj/item/New()
	personal_id += 1
	my_id = personal_id

/obj/item/tools/wrench
	name = "wrench"
	icon_state = "wrench"
	brute_damage = 15

/obj/item/tools/radiotest
	icon_state = "radiotest"
	brute_damage = 1

	act_self()
		for(var/wave/R in usr.loc)
			usr << "\blue ���-���! ���������� ���������:"
			usr << "\blue ���� ������� [R.force]"
			usr << "\blue ������� [R.frequency]"
			usr << "\blue ����� ����� [R.length]"

/obj/item/fire_ballon
	name = "BOLON"
	icon_state = "OLOLO_BALLON"

/obj/item/other/drink/beer
	name = "BEERBOOM"
	icon_state = "alcohol"

/obj/item/gun/carp
	name = "carpgun"
	icon_state = "carpgun"
	//bullet = /mob/carp

/obj/item/other/bomb
	icon_state = "bomb"
	icon = 'icons/obj/item/main_items.dmi'
	var
		plasmaINSIDE = 30

	act_self()
		var/turf/T = usr.loc
		T.plasma += plasmaINSIDE
		var/EXP
		EXP = T.plasma/10
		EXP = round(EXP)

		if(T.oxygen > 100 && T.plasma > 10)
			usr << "���-���!"
			new /obj/effect/explode(usr.loc)

		for(src in usr.contents)
			if(usr.client.my_hand_active == "left")
				if(istype(src, usr.client.lhand_items[1]))
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()
					del(src)

			if(usr.client.my_hand_active == "right")
				if(istype(src, usr.client.rhand_items[1]))
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()
					del(src)
/obj/item/ore

	uranium
		icon_state = "uranium"

		New()
			rad_wave(28, 3)

		Move()
			..()
			del_rad_wave()
			rad_wave(28, 3)
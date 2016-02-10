/atom
	var/brute_resist = 0
	var/temperature_resist = 0
	var/shock_resist = 0
	var/pass = 0

/obj/items
	icon = 'icons/main_items.dmi'
	layer = 26
	weight = 2
	var/brute_damage = 0
	var/burn_damage = 0
	var/shock_damage = 0

/obj/items/tools
	icon = 'icons/tools.dmi'

/obj/items/tools/screwdriver
	icon_state = "screwdriver"
	brute_damage = 5

/obj/items/tools/power/welding_tool
	icon_state = "welder"
	brute_damage = 1
	burn_damage = 5
	weight = 10

/obj/items/New()
	personal_id += 1
	my_id = personal_id

/obj/items/tools/wrench
	name = "wrench"
	icon_state = "wrench"
	brute_damage = 15

/obj/items/tools/radiotest
	icon_state = "radiotest"
	brute_damage = 1

	act_self()
		for(var/wave/R in usr.loc)
			usr << "\blue ���-���! ���������� ���������:"
			usr << "\blue ���� ������� [R.force]"
			usr << "\blue ������� [R.frequency]"
			usr << "\blue ����� ����� [R.length]"


/*	act()
		if(usr.client.hand == 1)
			var/obj/items/M = src
			M.layer = 25
			usr.client.R.overlays += M
			usr << "�� ������ [src.name] � ������ ����!"
			//usr.contents += M
			//usr.client.my_rhand_contents = M.type

			//del(src)
		if(usr.client.hand == 0)
			var/obj/items/M = src
			M.layer = 25
			usr.client.L.overlays += M
			usr << "�� ������ [src.name] � ����� ����!"
			//usr.contents += M
			//usr.client.my_lhand_contents = M.type
			//del(src)
*/
/*
/mob
	act()
		if(!(istype(src, /mob/human)))
			if(usr.client.act == "grab")
				usr << "\red �� �������� [src]"
				if(usr.client.hand == 1)
					var/mob/M = src
					M.layer = 25
					usr.client.R.overlays += M
					usr << "�� ������ [src.name] � ������ ����!"
					usr.client.my_rhand_contents = M.type
					del(src)
				if(usr.client.hand == 0)
					var/mob/M = src
					M.layer = 25
					usr.client.L.overlays += M
					usr << "�� ������ [src.name] � ����� ����!"
					usr.client.my_lhand_contents = M.type
					del(src)

		else
			usr << "\blue �� ������ �� ������� � [src] � ��� ������������."
*/
/obj/items/fire_ballon
	name = "BOLON"
	icon_state = "OLOLO_BALLON"

/obj/items/drink/beer
	name = "BEERBOOM"
	icon_state = "alcohol"

/obj/items/gun/carp
	name = "carpgun"
	icon_state = "carpgun"
	//bullet = /mob/carp

/obj/items/ore

	uranium
		icon_state = "uranium"

		New()
			rad_wave(28, 3)

		Move()
			..()
			del_rad_wave()
			rad_wave(28, 3)
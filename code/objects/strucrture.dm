/obj/structure
	icon = 'icons/obj/structure.dmi'

/obj/structure/window
	name = "window"
	icon_state = "windows"
	density = 1
	opacity = 0
	pass_gas = 0
	pass = 1
	freq = 21
	layer = 8

/obj/structure/grille
	name = "hatch"
	icon_state = "hatch"
	density = 1
	opacity = 0
	pass_gas = 1
	pass = 1
	layer = 7

/obj/structure/window/act_by_item(var/obj/item/I)
	if(istype(I, /obj/item/fire_ballon))
		usr << "�� ���������� ������"

/obj/structure/stool
	name = "stool"
	icon_state = "stool"

/obj/structure/toilet
	icon = 'icons/obj/trash.dmi'
	icon_state = "toilet"

/obj/structure/table
	name = "table"
	icon = 'icons/obj/table.dmi'
	density = 1
	layer = 6
	alpha = 128

	act_by_item(var/obj/item/I)
		for(I in usr.contents)
			if(usr.client.my_hand_active == "left")
				if(istype(I, usr.client.lhand_items[1]))
					I.Move(src.loc)
					usr << "\bold �� �������� [I] �� [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(I, usr.client.rhand_items[1]))
					I.Move(src.loc)
					usr << "\bold �� �������� [I] �� [src]"
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()

/obj/structure/table/surgery
	icon = 'icons/obj/surgery.dmi'
	icon_state = "table"
	alpha = 255

/obj/structure/table/surgery/act()
	usr.loc = src.loc
	usr.dir = 2
	usr << "\blue �� ��������� �� ����"

/obj/structure/closet/crate
	name = "crate"
	icon = 'icons/obj/crate.dmi'
	icon_state = "closed"

/obj/structure/closet
	name = "closet"
	icon = 'icons/obj/closet.dmi'
	icon_state = "closed"
	density = 1
	var/open = 0
	var/list/obj/item/container = list()

	act()
		if(open == 0)
			open = 1
			icon_state = "open"
			usr << "\blue �� ���������� [src]"
			for(var/obj/item/IT in contents)
				IT.Move(src.loc)
		else
			open = 0
			icon_state = "closed"
			var/turf/T = src.loc
			for(var/obj/item/IT in T)
				IT.Move(src)
			usr << "\blue �� ���������� [src]"
			return
	New()
		open = 0
		sleep(1)
		for(var/obj/item/IT in src.loc)
			IT.Move(src)

	act_by_item(var/obj/item/I)
		for(I in usr.contents)
			if(usr.client.my_hand_active == "left")
				if(istype(I, usr.client.lhand_items[1]))
					I.Move(src)
					usr << "\bold �� �������� [I] � [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(I, usr.client.rhand_items[1]))
					I.Move(src)
					usr << "\bold �� �������� [I] � [src]"
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()

/obj/lobb_y
	name = "lobby"
	icon = 'icons/lobby.dmi'
	layer = 33

/*
obj/structure/hatch
	name = "hatch"
	icon = 'icons/obj/structure.dmi'
	icon_state = "hatch"
	pass_gas = 0
*/
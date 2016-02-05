obj/structure/window
	name = "window"
	icon = 'icons/structure.dmi'
	icon_state = "windows"
	density = 1
	opacity = 0
	pass_gas = 0
	freq = 21
	layer = 8

obj/structure/hatch
	name = "hatch"
	icon = 'icons/structure.dmi'
	icon_state = "hatch"
	density = 1
	opacity = 0
	pass_gas = 1
	layer = 7

/obj/structure/window/act_by_item(var/obj/items/I)
	if(istype(I, /obj/items/fire_ballon))
		usr << "Ты разбиваешь стекло"

/obj/structure/stool
	name = "stool"
	icon = 'icons/structure.dmi'
	icon_state = "stool"

/obj/structure/table
	name = "table"
	icon = 'icons/table.dmi'
	density = 1
	layer = 6
	alpha = 128

	act_by_item(var/obj/items/I)
		for(I in usr.contents)
			if(usr.client.my_hand_active == "left")
				if(istype(I, usr.client.lhand_items[1]))
					I.Move(src.loc)
					usr << "\bold Вы положили [I] на [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(I, usr.client.rhand_items[1]))
					I.Move(src.loc)
					usr << "\bold Вы положили [I] на [src]"
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()

/obj/structure/table/surgery
	icon = 'icons/surgery.dmi'
	icon_state = "table"
	alpha = 255

/obj/structure/table/surgery/act()
	usr.loc = src.loc
	usr.dir = 2
	usr << "\blue Вы залезаете на стол"

/obj/structure/closet/crate
	name = "crate"
	icon = 'icons/crate.dmi'
	icon_state = "closed"

/obj/structure/closet
	name = "closet"
	icon = 'icons/closet.dmi'
	icon_state = "closed"
	density = 1
	var/open = 0
	var/list/obj/items/container = list()

	act()
		if(open == 0)
			open = 1
			icon_state = "open"
			usr << "\blue Ты открываешь [src]"
			for(var/obj/items/IT in contents)
				IT.Move(src.loc)
		else
			open = 0
			icon_state = "closed"
			var/turf/T = src.loc
			for(var/obj/items/IT in T)
				IT.Move(src)
			usr << "\blue Ты закрываешь [src]"
			return
	New()
		open = 0
		sleep(1)
		for(var/obj/items/IT in src.loc)
			IT.Move(src)

	act_by_item(var/obj/items/I)
		for(I in usr.contents)
			if(usr.client.my_hand_active == "left")
				if(istype(I, usr.client.lhand_items[1]))
					I.Move(src)
					usr << "\bold Вы положили [I] в [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(I, usr.client.rhand_items[1]))
					I.Move(src)
					usr << "\bold Вы положили [I] в [src]"
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()

/obj/lobb_y
	name = "lobby"
	icon = 'icons/lobby.dmi'
	layer = 33

/*
obj/structure/hatch
	name = "hatch"
	icon = 'icons/structure.dmi'
	icon_state = "hatch"
	pass_gas = 0
*/
obj/structure/window
	name = "window"
	icon = 'icons/structure.dmi'
	icon_state = "windows"
	density = 1
	opacity = 0
	pass_gas = 0
	freq = 21

obj/structure/hatch
	name = "hatch"
	icon = 'icons/structure.dmi'
	icon_state = "hatch"
	density = 1
	opacity = 0
	pass_gas = 1
	layer = 2.2

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
/*
	act_by_item(var/obj/items/I)
		usr << "\blue Ты кладешь предмет на стол"
		if(usr.client.hand == 1)
			I = usr.client.my_rhand_contents
			new I(src.loc)
			usr.client.my_rhand_contents = 0
			usr.client.R.overlays.Cut()
		if(usr.client.hand == 0)
			I = usr.client.my_lhand_contents
			new I(src.loc)
			usr.client.my_lhand_contents = 0
			usr.client.L.overlays.Cut()
*/

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
/*
	act_by_item(var/obj/items/I)
		if(open == 1)
			usr << "\blue Ты кладешь предмет в [src]"
			if(usr.client.hand == 1)
				I = usr.client.my_rhand_contents
				for(I in usr)
					I.Move(src)

				usr.client.my_rhand_contents = 0
				usr.client.R.overlays.Cut()

			if(usr.client.hand == 0)
				I = usr.client.my_lhand_contents
				for(I in usr)
					I.Move(src)

				usr.client.my_lhand_contents = 0
				usr.client.L.overlays.Cut()
*/
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
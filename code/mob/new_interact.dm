client/show_popup_menus = 0

/atom/proc/pew()

/atom/proc/act()

/atom/proc/hit()

/atom/proc/act_by_item(var/obj/item/I)

/atom/proc/act_self(var/obj/item/I)

/atom/proc/del_from_hand(src)
	if(usr.client.my_hand_active == "right")
		for(src in usr.contents)
			if(istype(src, usr.client.rhand_items[1]))
				usr.client.rhand_items.Cut()
				usr.client.R.overlays -= src
				del(src)

	if(usr.client.my_hand_active == "left")
		for(src in usr.contents)
			if(istype(src, usr.client.lhand_items[1]))
				usr.client.lhand_items.Cut()
				usr.client.L.overlays -= src
				del(src)


/atom/Click(location,control,params)

	params = params2list(params)
	if("right" in params)
		if(pull == 0 && usr.client.my_pull_eba < 2 && weight < usr.client.can_get && anchored == 0)
			pull = 1
			puller = usr
			usr.client.my_pull_eba += 1
			return

		if(pull == 1)
			pull = 0
			puller = 0
			usr.client.my_pull_eba -= 1
			return

	if("left" in params)
		if(src in range(1, usr))
			if(usr.client.my_hand_active == "right")
				if(usr.client.rhand_items.len == 0)
					act()

				if(usr.client.rhand_items.len != 0)
					for(var/obj/O in usr.contents)
						if(istype(O, usr.client.rhand_items[1]))
							act_by_item(O)

			if(usr.client.my_hand_active == "left")
				if(usr.client.lhand_items.len == 0)
					act()

				if(usr.client.lhand_items.len != 0)
					for(var/obj/O in usr.contents)
						if(istype(O, usr.client.lhand_items[1]))

							act_by_item(O)

		if(get_dist(src,usr) > 1)
			if(usr.client.my_hand_active == "right")
				if(usr.client.rhand_items.len != 0)
					for(var/obj/item/weapon/gun/G in usr.contents)
						if(istype(G, usr.client.rhand_items[1]))
							var/obj/item/weapon/gun/GUN = usr.client.rhand_items[1]
							GUN.pew()

			if(usr.client.my_hand_active == "left")
				if(usr.client.lhand_items.len != 0)
					for(var/obj/item/weapon/gun/G in usr.contents)
						if(istype(G, usr.client.lhand_items[1]))
							var/obj/item/weapon/gun/GUN = usr.client.lhand_items[1]
							GUN.pew()

		if(src in usr.client.screen)
			if(usr.client.my_hand_active == "right")
				if(usr.client.rhand_items.len == 0)
					act()

				if(usr.client.rhand_items.len != 0)
					for(var/obj/O in usr.contents)
						if(istype(O, usr.client.rhand_items[1]))

							act_by_item(O)

			if(usr.client.my_hand_active == "left")
				if(usr.client.lhand_items.len == 0)
					act()
				else
					usr << "\red Освободите руку"

				if(usr.client.lhand_items.len != 0)
					for(var/obj/O in usr.contents)
						if(istype(O, usr.client.lhand_items[1]))
							act_by_item(O)

/obj/item/act()
	Move(usr)
	if(usr.client.my_hand_active == "left")
		if(usr.client.lhand_items.len == 0)
			usr.client.lhand_items += src
			usr.client.draw_item_hand(usr.client.my_hand_active, src)
		else
			usr << "\red Освободите руку"

		if(usr.client.my_hand_active == "right")
			if(usr.client.rhand_items.len == 0)
				usr.client.rhand_items += src
				usr.client.draw_item_hand(usr.client.my_hand_active, src)
			else
				usr << "\red Освободите руку"



/mob/proc/drop()
	if(usr.client.my_hand_active == "left")
		for(var/obj/O in usr.contents)
			if(istype(O, usr.client.lhand_items[1]))
				usr.client.lhand_items.Cut()
				usr.client.L.overlays -= O
				O.Move(src.loc)

	if(usr.client.my_hand_active == "right")
		for(var/obj/O in usr.contents)
			if(istype(O, usr.client.rhand_items[1]))
				usr.client.rhand_items.Cut()
				usr.client.R.overlays -= O
				O.Move(src.loc)

/atom
	var/pull = 0
	var/puller = 0
	var/anchored = 0


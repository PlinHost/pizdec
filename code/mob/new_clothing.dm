//Прототип, который я написал за 10 минут, суть в том, чтобы стремиться к нему
//Ибо нынешнее положение дел - хуйня
/*
/atom/proc/act()

/obj/item/clothing
	layer = 9
	icon = 'clothing.dmi'
	icon_state = "clothes"
	var/icon_for_mob = 'clothing_mob.dmi'
	proc
		wear(var/mob/M)
			M.contents += src
			icon = icon_for_mob
			M.overlays += src

		undress(var/mob/M)
			if(src in M.contents)
				Move(M.loc)
				M.overlays -= src
				icon = 'clothing.dmi'

	act()
		wear(usr)

/atom/Click(location,control,params)
	if(src in range(1, usr))
		act()

/mob/verb/undress()
	for(var/obj/item/clothing/C in contents)
		C.undress(src)
*/

/obj/item/clothing
	icon = 'icons/obj/clothing.dmi'
	var/icon_for_mob = 'icons/obj/clothing_mob.dmi'

	proc
		wear(var/mob/human/M)
			M.contents += src
			icon = icon_for_mob
			M.overlays += src

		undress(var/mob/human/M)
			if(src in M.contents)
				M.overlays -= src
				icon = 'icons/obj/clothing.dmi'
				if(M.client.my_hand_active == "right")
					M.client.rhand_items += src
					M.client.R.overlays += src


				if(M.client.my_hand_active == "left")
					M.client.lhand_items += src
					M.client.L.overlays += src
		lying_me()
			icon = 'icons/obj/clothing_lying.dmi'
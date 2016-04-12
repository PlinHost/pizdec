/obj/item/clothing
	icon = 'icons/obj/clothing.dmi'
	var/icon_for_mob = 'icons/obj/clothing_mob.dmi'
	var/old_layer = 0

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

		lying_me(var/mob/human/M)
			//icon = 'icons/obj/clothing_lying.dmi'
			M.overlays -= src
			icon = 'icons/obj/clothing_lying.dmi'
			M.overlays += src

		unlying_me(var/mob/human/M)
			M.overlays -= src
			icon = 'icons/obj/clothing_mob.dmi'
			M.overlays += src
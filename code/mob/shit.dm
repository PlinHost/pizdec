/mob/human
	proc/lying()
		lying = 1

		for(var/obj/item/organs/O in organs)
			overlays -= O
			O.icon = 'icons/human_lying.dmi'
			overlays += O

		if(usr.client.head_items.len > 0)
			if(istype(usr.client.head_items[1],/obj/item/body/head/HELMET))
				var/obj/item/body/head/HELMET/H = new()
				overlays -= H
				H.icon = 'icons/obj/clothes_lying.dmi'
				overlays += H

		if(usr.client.head_items.len > 0)

			if(istype(usr.client.head_items[1],/obj/item/clothing/head/HELMET_SYN))
				var/obj/item/body/head/HELMET_SYN/HS = new()
				overlays -= HS
				HS.icon = 'icons/obj/clothes_lying.dmi'
				overlays += HS

		if(usr.client.foot_items.len > 0)
			var/k = usr.client.foot_items[1]
			var/obj/item/body/shoes/BLACK/B = new()
			if(istype(k,/obj/item/clothing/shoes/BLACK))
				overlays -= B
				B.icon = 'icons/obj/clothes_lying.dmi'
				overlays += B

		if(usr.client.foot_items.len > 0)
			if(istype(usr.client.foot_items[1],/obj/item/clothing/shoes/COOL))
				var/obj/item/body/shoes/COOL/CO = new()
				overlays -= CO
				CO.icon = 'icons/obj/clothes_lying.dmi'
				overlays += CO

		if(usr.client.uniform_items.len > 0)
			var/obj/item/clothing/C = usr.client.uniform_items[1]
			overlays -= C
			C.icon = 'icons/obj/clothes_lying.dmi'
			overlays += C

		if(usr.client.clothing_items.len > 0)
			var/obj/item/clothing/C = usr.client.clothing_items[1]
			overlays -= usr.client.clothing_items[1]
			C.icon = 'icons/obj/clothes_lying.dmi'
			overlays += C

	proc/unlying()
		lying = 0

		for(var/obj/item/organs/O in organs)
			overlays -= O
			O.icon = 'icons/human.dmi'
			overlays += O

		if(usr.client.head_items.len > 0)
			if(istype(usr.client.head_items[1],/obj/item/body/head/HELMET))
				var/obj/item/body/head/HELMET/H = new()
				overlays -= H
				H.icon = 'icons/obj/clothes.dmi'
				overlays += H

		if(usr.client.head_items.len > 0)

			if(istype(usr.client.head_items[1],/obj/item/clothing/head/HELMET_SYN))
				var/obj/item/body/head/HELMET_SYN/HS = new()
				overlays -= HS
				HS.icon = 'icons/obj/clothes.dmi'
				overlays += HS

		if(usr.client.foot_items.len > 0)
			var/k = usr.client.foot_items[1]
			var/obj/item/body/shoes/BLACK/B = new()
			if(istype(k,/obj/item/clothing/shoes/BLACK))
				overlays -= B
				B.icon = 'icons/obj/clothes.dmi'
				overlays += B

		if(usr.client.foot_items.len > 0)
			if(istype(usr.client.foot_items[1],/obj/item/clothing/shoes/COOL))
				var/obj/item/body/shoes/COOL/CO = new()
				overlays -= CO
				CO.icon = 'icons/obj/clothes.dmi'
				overlays += CO

		if(usr.client.uniform_items.len > 0)
			var/obj/item/clothing/C = usr.client.uniform_items[1]
			overlays -= C
			C.icon = 'icons/obj/clothes.dmi'
			overlays += C

		if(usr.client.clothing_items.len > 0)
			var/obj/item/clothing/C = usr.client.clothing_items[1]
			overlays -= usr.client.clothing_items[1]
			C.icon = 'icons/obj/clothes.dmi'
			overlays += C
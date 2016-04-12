/mob/human/proc/help_me_doctor(var/obj/item/I, var/obj/item/organs/O) ///NO
	if(istype(I,/obj/item/medical/brute/gel))
		for(O in src)
			usr << "\blue Вы используете [I]!"
			src << "\blue [usr] использует на вас [I] "// кулаком по телу!"
			while(O.hit_points < 100 && I.medical_power > 1)
				O.hit_points += 1
				I.medical_power -= 1

				if(I.medical_power == 1)
					usr << "\red Вы потратили весь [I]"
					return

/mob/human/proc/EXTINGUISH(var/obj/item/I, var/obj/item/organs/O) ///NO
	if(istype(I,/obj/item/medical/burn/gel))
		for(O in src)
			usr << "\blue Вы используете [I]!"
			src << "\blue [usr] использует на вас [I] "// кулаком по телу!"
			while(O.burn_points > 0 && I.medical_power > 1)
				O.burn_points -= 1
				I.medical_power -= 1

			if(I.medical_power == 1)
				usr << "\red Вы потратили весь [I]"
				return

/mob/human/proc/punch_me_doc(var/obj/item/I, var/obj/item/organs/O)
	for(O in src)
		usr << "\red Вы атакуете [src] с помощью [I]!"
		src << "\red [usr] атакует вас с помощью [I] "// кулаком по телу!"
		if(O.hit_points > 1 && O.burn_points < 100)
			O.hit_points -= I.brute_damage
			O.burn_points += I.burn_damage
			return


/mob/human/act_by_item(var/obj/item/I)
	if(istype(I,/obj/item/medical/brute/gel))
		if(usr.client.act == "help")
			if(usr.client.zone == "chest")
				var/obj/item/organs/chest/O = new()
				help_me_doctor(I, O)

			if(usr.client.zone == "head")
				var/obj/item/organs/head/O = new()
				help_me_doctor(I, O)

			if(usr.client.zone == "r_leg")
				var/obj/item/organs/r_leg/O = new()
				help_me_doctor(I, O)

			if(usr.client.zone == "l_leg")
				var/obj/item/organs/l_leg/O = new()
				help_me_doctor(I, O)

			if(usr.client.zone == "l_arm")
				var/obj/item/organs/l_arm/O = new()
				help_me_doctor(I, O)

			if(usr.client.zone == "r_arm")
				var/obj/item/organs/r_arm/O = new()
				help_me_doctor(I, O)

//FIRE FIRE FIRE

	if(istype(I,/obj/item/medical/burn/gel))
		if(usr.client.act == "help")
			if(usr.client.zone == "chest")
				var/obj/item/organs/chest/O = new()
				EXTINGUISH(I, O)

			if(usr.client.zone == "head")
				var/obj/item/organs/head/O = new()
				EXTINGUISH(I, O)

			if(usr.client.zone == "r_leg")
				var/obj/item/organs/r_leg/O = new()
				EXTINGUISH(I, O)

			if(usr.client.zone == "l_leg")
				var/obj/item/organs/l_leg/O = new()
				EXTINGUISH(I, O)

			if(usr.client.zone == "l_arm")
				var/obj/item/organs/l_arm/O = new()
				EXTINGUISH(I, O)

			if(usr.client.zone == "r_arm")
				var/obj/item/organs/r_arm/O = new()
				EXTINGUISH(I, O)

	if(!istype(I,/obj/item/medical))
		if(usr.client.act == "harm")
			if(usr.client.zone == "chest")
				var/obj/item/organs/chest/O = new()
				punch_me_doc(I, O)

			if(usr.client.zone == "head")
				var/obj/item/organs/head/O = new()
				punch_me_doc(I, O)

			if(usr.client.zone == "r_leg")
				var/obj/item/organs/r_leg/O = new()
				punch_me_doc(I, O)

			if(usr.client.zone == "l_leg")
				var/obj/item/organs/l_leg/O = new()
				punch_me_doc(I, O)


			if(usr.client.zone == "l_arm")
				var/obj/item/organs/l_arm/O = new()
				punch_me_doc(I, O)

			if(usr.client.zone == "r_arm")
				var/obj/item/organs/r_arm/O = new()
				punch_me_doc(I, O)

		if(istype(I,/obj/item/weapon/stunbaton))
			var/obj/item/weapon/stunbaton/S = I
			if(usr.client.act == "help")
				src << "\red <b>Вы чувствуете мощный разр&#255;д тока!</b>"
				usr.client.D.act()
				lying()
				sleep(S.force)
				unlying()

//сэкономлено 104 строчки кода
//ОПТИМИЗАЦИЯ
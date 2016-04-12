/mob/human/proc/help_me_doctor(var/obj/item/I, var/obj/item/organs/O) ///NO
	if(istype(I,/obj/item/medical/brute/gel))
		for(O in src)
			usr << "\blue �� ����������� [I]!"
			src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ����!"
			while(O.hit_points < 100 && I.medical_power > 1)
				O.hit_points += 1
				I.medical_power -= 1

				if(I.medical_power == 1)
					usr << "\red �� ��������� ���� [I]"
					return

/mob/human/proc/EXTINGUISH(var/obj/item/I, var/obj/item/organs/O) ///NO
	if(istype(I,/obj/item/medical/burn/gel))
		for(O in src)
			usr << "\blue �� ����������� [I]!"
			src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ����!"
			while(O.burn_points > 0 && I.medical_power > 1)
				O.burn_points -= 1
				I.medical_power -= 1

			if(I.medical_power == 1)
				usr << "\red �� ��������� ���� [I]"
				return

/mob/human/proc/punch_me_doc(var/obj/item/I, var/obj/item/organs/O)
	for(O in src)
		usr << "\red �� �������� [src] � ������� [I]!"
		src << "\red [usr] ������� ��� � ������� [I] "// ������� �� ����!"
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
				src << "\red <b>�� ���������� ������ ����&#255;� ����!</b>"
				usr.client.D.act()
				lying()
				sleep(S.force)
				unlying()

//����������� 104 ������� ����
//�����������
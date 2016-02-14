/mob/human/act_by_item(var/obj/item/I)
	if(istype(I,/obj/item/medical/brute/gel))
		if(usr.client.act == "help")
			if(usr.client.zone == "chest")
				for(var/obj/item/organs/chest/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ����!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"

			if(usr.client.zone == "head")
				for(var/obj/item/organs/head/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ������!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"

			if(usr.client.zone == "r_leg")
				for(var/obj/item/organs/r_leg/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ������ ����!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"


			if(usr.client.zone == "l_leg")
				for(var/obj/item/organs/l_leg/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ����� ����!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"

			if(usr.client.zone == "l_arm")
				for(var/obj/item/organs/l_leg/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ����� ����!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"

			if(usr.client.zone == "r_arm")
				for(var/obj/item/organs/l_leg/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ������ ����!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"

			if(usr.client.zone == "groin")
				for(var/obj/item/organs/l_leg/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� � ������� ����!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"

//FIRE FIRE FIRE

	if(istype(I,/obj/item/medical/burn/gel))
		if(usr.client.act == "help")
			if(usr.client.zone == "chest")
				for(var/obj/item/organs/chest/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ����!"
					while(O.burn_points > 0 && I.medical_power > 1)
						O.burn_points -= 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"

			if(usr.client.zone == "head")
				for(var/obj/item/organs/head/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ����!"
					while(O.burn_points > 0 && I.medical_power > 1)
						O.burn_points -= 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"

			if(usr.client.zone == "r_leg")
				for(var/obj/item/organs/r_leg/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ����!"
					while(O.burn_points > 0 && I.medical_power > 1)
						O.burn_points -= 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"


			if(usr.client.zone == "l_leg")
				for(var/obj/item/organs/l_leg/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ����!"
					while(O.burn_points > 0 && I.medical_power > 1)
						O.burn_points -= 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"

			if(usr.client.zone == "l_arm")
				for(var/obj/item/organs/l_leg/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ����� ����!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"

			if(usr.client.zone == "r_arm")
				for(var/obj/item/organs/l_leg/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ����!"
					while(O.burn_points > 0 && I.medical_power > 1)
						O.burn_points -= 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"

			if(usr.client.zone == "groin")
				for(var/obj/item/organs/l_leg/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ����!"
					while(O.burn_points > 0 && I.medical_power > 1)
						O.burn_points -= 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red �� ��������� ���� [I]"

	if(!istype(I,/obj/item/medical))
		if(usr.client.act == "harm")
			if(usr.client.zone == "chest")
				for(var/obj/item/organs/chest/O in src)
					usr << "\red �� �������� [src] � ������� [I]!"
					src << "\red [usr] ������� ��� � ������� [I] "// ������� �� ����!"
					if(O.hit_points > 1 && O.burn_points < 100)
						O.hit_points -= I.brute_damage
						O.burn_points += I.burn_damage

			if(usr.client.zone == "head")
				for(var/obj/item/organs/head/O in src)
					usr << "\red �� �������� [src] � ������� [I]!"
					src << "\red [usr] ������� ��� � ������� [I] "// ������� �� ����!"
					if(O.hit_points > 1 && O.burn_points < 100)
						O.hit_points -= I.brute_damage
						O.burn_points += I.burn_damage

			if(usr.client.zone == "r_leg")
				for(var/obj/item/organs/r_leg/O in src)
					usr << "\blue �� ����������� [I]!"
					src << "\blue [usr] ���������� �� ��� [I] "// ������� �� ������ ����!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1

			if(usr.client.zone == "l_leg")
				for(var/obj/item/organs/l_leg/O in src)
					usr << "\red �� �������� [src] � ������� [I]!"
					src << "\red [usr] ������� ��� � ������� [I] "// ������� �� ����!"
					if(O.hit_points > 1 && O.burn_points < 100)
						O.hit_points -= I.brute_damage
						O.burn_points += I.burn_damage

			if(usr.client.zone == "l_arm")
				for(var/obj/item/organs/l_leg/O in src)
					usr << "\red �� �������� [src] � ������� [I]!"
					src << "\red [usr] ������� ��� � ������� [I] "// ������� �� ����!"
					if(O.hit_points > 1 && O.burn_points < 100)
						O.hit_points -= I.brute_damage
						O.burn_points += I.burn_damage

			if(usr.client.zone == "r_arm")
				for(var/obj/item/organs/l_leg/O in src)
					usr << "\red �� �������� [src] � ������� [I]!"
					src << "\red [usr] ������� ��� � ������� [I] "// ������� �� ����!"
					if(O.hit_points > 1 && O.burn_points < 100)
						O.hit_points -= I.brute_damage
						O.burn_points += I.burn_damage

			if(usr.client.zone == "groin")
				for(var/obj/item/organs/l_leg/O in src)
					usr << "\red �� �������� [src] � ������� [I]!"
					src << "\red [usr] ������� ��� � ������� [I] "// ������� �� ����!"
					if(O.hit_points > 1 && O.burn_points < 100)
						O.hit_points -= I.brute_damage
						O.burn_points += I.burn_damage

		if(istype(I,/obj/item/weapon/stunbaton))
			var/obj/item/weapon/stunbaton/S = I
			if(usr.client.act == "help")
				src << "\red <b>�� ���������� ������ ����&#255;� ����!</b>"
				usr.client.D.act()
				lying()
				sleep(S.force)
				unlying()
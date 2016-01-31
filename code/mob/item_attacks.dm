/mob/human/act_by_item(var/obj/items/I)
	if(istype(I,/obj/items/medical/brute/gel))
		if(usr.client.act == "help")
			if(usr.client.zone == "chest")
				for(var/obj/items/organs/chest/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по телу!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"

			if(usr.client.zone == "head")
				for(var/obj/items/organs/head/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по голове!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"

			if(usr.client.zone == "r_leg")
				for(var/obj/items/organs/r_leg/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по правой ноге!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"


			if(usr.client.zone == "l_leg")
				for(var/obj/items/organs/l_leg/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по левой ноге!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"

			if(usr.client.zone == "l_arm")
				for(var/obj/items/organs/l_leg/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по левой руке!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"

			if(usr.client.zone == "r_arm")
				for(var/obj/items/organs/l_leg/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по правой руке!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"

			if(usr.client.zone == "groin")
				for(var/obj/items/organs/l_leg/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком в область паха!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"

//FIRE FIRE FIRE

	if(istype(I,/obj/items/medical/burn/gel))
		if(usr.client.act == "help")
			if(usr.client.zone == "chest")
				for(var/obj/items/organs/chest/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по телу!"
					while(O.burn_points > 0 && I.medical_power > 1)
						O.burn_points -= 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"

			if(usr.client.zone == "head")
				for(var/obj/items/organs/head/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по телу!"
					while(O.burn_points > 0 && I.medical_power > 1)
						O.burn_points -= 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"

			if(usr.client.zone == "r_leg")
				for(var/obj/items/organs/r_leg/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по телу!"
					while(O.burn_points > 0 && I.medical_power > 1)
						O.burn_points -= 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"


			if(usr.client.zone == "l_leg")
				for(var/obj/items/organs/l_leg/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по телу!"
					while(O.burn_points > 0 && I.medical_power > 1)
						O.burn_points -= 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"

			if(usr.client.zone == "l_arm")
				for(var/obj/items/organs/l_leg/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по левой руке!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"

			if(usr.client.zone == "r_arm")
				for(var/obj/items/organs/l_leg/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по телу!"
					while(O.burn_points > 0 && I.medical_power > 1)
						O.burn_points -= 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"

			if(usr.client.zone == "groin")
				for(var/obj/items/organs/l_leg/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по телу!"
					while(O.burn_points > 0 && I.medical_power > 1)
						O.burn_points -= 1
						I.medical_power -= 1

					if(I.medical_power == 1)
						usr << "\red Вы потратили весь [I]"

	if(!istype(I,/obj/items/medical))
		if(usr.client.act == "harm")
			if(usr.client.zone == "chest")
				for(var/obj/items/organs/chest/O in src)
					usr << "\red Вы атакуете [src] с помощью [I]!"
					src << "\red [usr] атакует вас с помощью [I] "// кулаком по телу!"
					if(O.hit_points > 1 && O.burn_points < 100)
						O.hit_points -= I.brute_damage
						O.burn_points += I.burn_damage

			if(usr.client.zone == "head")
				for(var/obj/items/organs/head/O in src)
					usr << "\red Вы атакуете [src] с помощью [I]!"
					src << "\red [usr] атакует вас с помощью [I] "// кулаком по телу!"
					if(O.hit_points > 1 && O.burn_points < 100)
						O.hit_points -= I.brute_damage
						O.burn_points += I.burn_damage

			if(usr.client.zone == "r_leg")
				for(var/obj/items/organs/r_leg/O in src)
					usr << "\blue Вы используете [I]!"
					src << "\blue [usr] использует на вас [I] "// кулаком по правой ноге!"
					while(O.hit_points < 100 && I.medical_power > 1)
						O.hit_points += 1

			if(usr.client.zone == "l_leg")
				for(var/obj/items/organs/l_leg/O in src)
					usr << "\red Вы атакуете [src] с помощью [I]!"
					src << "\red [usr] атакует вас с помощью [I] "// кулаком по телу!"
					if(O.hit_points > 1 && O.burn_points < 100)
						O.hit_points -= I.brute_damage
						O.burn_points += I.burn_damage

			if(usr.client.zone == "l_arm")
				for(var/obj/items/organs/l_leg/O in src)
					usr << "\red Вы атакуете [src] с помощью [I]!"
					src << "\red [usr] атакует вас с помощью [I] "// кулаком по телу!"
					if(O.hit_points > 1 && O.burn_points < 100)
						O.hit_points -= I.brute_damage
						O.burn_points += I.burn_damage

			if(usr.client.zone == "r_arm")
				for(var/obj/items/organs/l_leg/O in src)
					usr << "\red Вы атакуете [src] с помощью [I]!"
					src << "\red [usr] атакует вас с помощью [I] "// кулаком по телу!"
					if(O.hit_points > 1 && O.burn_points < 100)
						O.hit_points -= I.brute_damage
						O.burn_points += I.burn_damage

			if(usr.client.zone == "groin")
				for(var/obj/items/organs/l_leg/O in src)
					usr << "\red Вы атакуете [src] с помощью [I]!"
					src << "\red [usr] атакует вас с помощью [I] "// кулаком по телу!"
					if(O.hit_points > 1 && O.burn_points < 100)
						O.hit_points -= I.brute_damage
						O.burn_points += I.burn_damage

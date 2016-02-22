/reagent
	parent_type = /atom/movable
	icon = 'chem_mass.dmi'
	var
		state = "solid" //gas, solid, liquid
		max_temperature = 100
		min_temperature = -100
		amount = 0

	proc
		react(var/reagent/HANDATTACK)
			var/old_amount
			if(amount > 0)
				for(var/reagent/R in loc)
					if(R != src)
						switch(R.name)
							if("water")
								if(name == "potassium")
									world << "BOOM"
									old_amount = R.amount
									R.amount -= amount*2 //2 единицы калия на 1 воды
									amount -= old_amount
									if(R.amount <= 0)
										del(R)
									if(amount <= 0)
										del(src)

							if("potassium")
								if(name == "water")
									world << "BOOM"
									old_amount = amount
									amount -= R.amount*2 //2 единицы калия на 1 воды
									R.amount -= old_amount
									if(R.amount <= 0)
										del(R)
									if(amount <= 0)
										del(src)

//FOR HAND

				if(HANDATTACK)
					switch(HANDATTACK.name)
						if("water")
							if(name == "potassium")
								world << "BOOM"
								old_amount = HANDATTACK.amount
								HANDATTACK.amount -= amount*2 //2 единицы калия на 1 воды
								amount -= old_amount
								if(HANDATTACK.amount <= 0)
									del(HANDATTACK)
								if(amount <= 0)
									del(src)

						if("potassium")
							if(name == "water")
								world << "BOOM"
								old_amount = amount
								amount -= HANDATTACK.amount*2 //2 единицы калия на 1 воды
								HANDATTACK.amount -= old_amount
								if(HANDATTACK.amount <= 0)
									del(HANDATTACK)
								if(amount <= 0)
									del(src)
		react_on_mob(var/mob)
			return

	water
		name = "water"
		color = "blue"

	potassium
		name = "potassium"


proc/create_reagent(var/turf/simulated/myloc, var/amount_new, var/state, var/R)
	R = new R()
	var/reagent/RK = R
	RK.amount = amount_new
	RK.Move(myloc)
	RK.icon_state = state
	RK.react()

	if(RK.state == "solid")
		var/obj/item/other/solid_reagents/SR = new(RK.loc)
		RK.move_reagent(RK.amount, SR)
		SR.icon = RK.icon
		SR.icon_state = RK.state

/reagent/proc/move_reagent(var/amount_new, var/atom/M)
	if(amount_new >= amount)
		Move(M)
	else
		var/reagent/A = src
		new A(M)
		A.amount = amount_new
		amount -= amount_new

/obj/item/unlimited_reagent
	icon = 'icons/obj/main_items.dmi'
	icon_state = "magic"
	var/reag_type = /reagent/water

	proc/spawn_me(var/turf/T)
		create_reagent(T,100,"solid",reag_type)

	potassium
		reag_type = /reagent/potassium

/obj/item/other/solid_reagents

	act_by_item(var/obj/item/other/solid_reagents/SR)
		var/shit = 0
		for(var/reagent/R in contents)
			for(var/reagent/R2 in SR.contents)
				R.react(R2)

		for(var/reagent/R2 in SR.contents)
			shit = 1

		if(shit == 0)
			for(SR in usr.contents)
				if(usr.client.my_hand_active == "left")
					if(istype(SR, usr.client.lhand_items[1]))
						usr.client.L.overlays.Cut()
						usr.client.lhand_items.Cut()
						del(SR)

				if(usr.client.my_hand_active == "right")
					if(istype(SR, usr.client.rhand_items[1]))
						usr.client.R.overlays.Cut()
						usr.client.rhand_items.Cut()
						del(SR)
		shit = 0

		for(var/reagent/R in contents)
			shit = 1

		if(shit == 0)
			del(src)
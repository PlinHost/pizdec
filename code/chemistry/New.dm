/reagent
	parent_type = /atom/movable
	icon = 'chem_mass.dmi'
	var
		state = "solid" //gas, solid, liquid
		max_temperature = 100
		min_temperature = -100
		amount = 0

	proc
		react()
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

	water
		name = "water"

	potassium
		name = "potassium"


proc/create_reagent(var/turf/simulated/myloc, var/amount_new, var/state, var/R)
	R = new R()
	var/reagent/RK = R
	RK.amount = amount_new
	RK.Move(myloc)
	RK.icon_state = state
	RK.react()

/obj/items/unlimited_reagent
	icon = 'icons/main_items.dmi'
	icon_state = "magic"
	var/reag_type = /reagent/water

	proc/spawn_me(var/turf/T)
		create_reagent(T,100,"solid",reag_type)

	potassium
		reag_type = /reagent/potassium



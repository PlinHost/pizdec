/obj/item/weapon/reagent_containers
	name = "Rgnt_Cntnr"
	icon = 'icons/obj/medbay.dmi'
	icon_state = "pill"

	New()
		var/datum/reagents/R = new/datum/reagents(100)
		reagents = R
		R.my_atom = src
		R.add_reagent("nothing", 30)

	act_self(src)
		usr << "\blue Ты принимаешь [src]."
		if(reagents.total_volume)
			reagents.reaction(usr)
			spawn(5)
				reagents.trans_to(usr, reagents.total_volume)
		del_from_hand()
		del(src)

	poison
		name = "poison"

		New()
			var/datum/reagents/R = new/datum/reagents(100)
			reagents = R
			R.my_atom = src
			R.add_reagent("poison", 30)

		act_self(src)
			usr << "\blue Ты принимаешь [src]."
			if(reagents.total_volume)
				reagents.reaction(usr)
				spawn(5)
					reagents.trans_to(usr, reagents.total_volume)
			del_from_hand()
			del(src)
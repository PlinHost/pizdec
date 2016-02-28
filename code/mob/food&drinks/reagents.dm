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

	glass
		icon_state = "container"
		New()
			var/datum/reagents/R = new/datum/reagents(200)
			reagents = R
			R.my_atom = src

/turf/simulated/floor/act_by_item(var/obj/item/I)
	if(istype(I, /obj/item/weapon/reagent_containers))
		I.reagents.trans_to(src, 50, 1)
		usr << "Вы выливаете часть содержимого колбы на пол"
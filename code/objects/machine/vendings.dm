/obj/items/potato

/obj/items/coin
	icon_state = "coin"

/obj/items/surgery/saw
	icon_state = "saw"

/obj/items/meat
	icon_state = "meat"

/obj/machinery/vending
	var/my_product = /obj/items/potato
	var/amount = 3
	density = 1
	icon = 'icons/vending.dmi'

	proc/give_me_my_potato()
		for(var/mob/M in range(5,src))
			M << "[src] выплюнул свой продукт."
		if(amount > 0)
			amount -= 1
			new my_product(src.loc)

/*	act_by_item(var/obj/items/I)
		if(I == /obj/items/coin)
			usr << "\blue Получи приз!"
			give_me_my_potato()
			if(usr.client.hand == 1)
				usr.client.R.overlays.Cut()
				usr.client.my_rhand_contents = 0
			else
				usr.client.L.overlays.Cut()
				usr.client.my_lhand_contents = 0
*/
/obj/machinery/vending/bar
	icon_state = "bartender_3000"
	name = "bartender_3000"
	my_product = /obj/items/drink/beer

/obj/machinery/vending/ballon
	icon_state = "ballon_vend"
	name = "FIREFIGHT"
	my_product = /obj/items/fire_ballon
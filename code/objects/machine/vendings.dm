/obj/item/other/coin
	icon_state = "coin"

/obj/item/surgery/saw
	icon_state = "saw"

/obj/machinery/vending
	var/amount = 3
	density = 1
	icon = 'icons/obj/vending.dmi'
	var/list/obj/item/my_items = list()
	var/list/obj/item/my_types= list()
	var/list/items_num = list()
	var/products
	var/myclick = 0
	var/my_text

	New()
		sleep(4)
		for(var/i = 1, i <= my_items.len, i++)
			var/type = my_items[i]
			my_items[i] = new type

			//type = my_items[i]


		for(var/g = 1, g <= my_items.len, g++)
			products += "<br><a href='?buy;my_item=[my_types[g]];my_what=[g];iam=[src.type]'>[my_items[g]]</a>"

	act()
		myclick = 1

		my_text = {"
		<html>
		<head><title>Автомат</title></head>
		<body>
		Товары:
		[products]
		<br>

		</body>
		</html>
		"}

		usr << browse(my_text,"window=my_text;can_close=0")

/obj/machinery/vending/bar
	icon_state = "bartender_3000"
	name = "bartender_3000"

/obj/machinery/vending/tools
	icon_state = "ballon_vend"
	name = "tools master"
	my_items = list(/obj/item/tools/wrench, /obj/item/tools/screwdriver, /obj/item/tools/radiotest)
	my_types = list(/obj/item/tools/wrench, /obj/item/tools/screwdriver, /obj/item/tools/radiotest)
	items_num = list(3, 3, 3)
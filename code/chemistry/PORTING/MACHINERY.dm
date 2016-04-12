/obj/machinery/chemdispenser
	icon = 'icons/obj/machine/chem.dmi'
	icon_state = "dispenser"
	density = 1

	proc/dispense(var/reagent)
		for(var/obj/item/weapon/reagent_containers/glass/G in contents)
			G.reagents.add_reagent(reagent, 10)
			for(var/mob/M in range(3,src))
				M << "<b>В стакан заливаетс&#255; [reagent]</b>"
				world << "<b>[G.reagents.total_volume]"

	proc/get_container()
		for(var/obj/item/weapon/reagent_containers/glass/G in contents)
			G.Move(src.loc)

/obj/machinery/chemdispenser/act()
	var/my_text
	if(contents.len > 0)
		my_text = {"
		<html>
		<head><title>Химический раздатчик</title></head>
		<body>
		Выберите реагент:

		<br><a href=?blood>Кровь</a>
		<br><a href=?oil>Масло</a>
		<br><a href=?eth>Этанол</a>
		<br><a href=?car>Углерод</a>
		<br><a href=?oxy>Кислород</a>
		<br><a href=?sil>Кремний</a>
		<br><a href=?nit>Азот</a>

		<br>

		<br><a href=?get_>Получить колбу</a>

		</body>
		</html>
		"}
	else
		my_text = {"
		<html>
		<head><title>Химический раздатчик</title></head>
		<body>

		<h1>Вставьте колбу в раздатчик!</h1>

		</body>
		</html>
		"}

	usr << browse(my_text,"window=my_text")

/obj/machinery/chemdispenser/act_by_item(var/obj/item/I)
	if(istype(I,/obj/item/weapon/reagent_containers/glass))
		if(contents.len == 0)
			if(usr.client.my_hand_active == "left")
				if(istype(I, usr.client.lhand_items[1]))
					I.Move(src)
					usr << "\bold Вы суете [I] в [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(I, usr.client.rhand_items[1]))
					I.Move(src)
					usr << "\bold Вы суете [I] в [src]"
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()
		else
			usr << "\red В автомате уже есть колба"


/obj/machinery/juicer
	icon = 'icons/obj/machine/chem.dmi'
	icon_state = "juicer"

/obj/machinery/juicer/act_by_item(var/obj/item/I)
	if(istype(I,/obj/item/weapon/reagent_containers))
		for(I in usr.contents)
			if(usr.client.my_hand_active == "left")
				if(istype(I, usr.client.lhand_items[1]))
					I.Move(src)
					usr << "\bold Вы суете [I] в [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(I, usr.client.rhand_items[1]))
					I.Move(src)
					usr << "\bold Вы суете [I] в [src]"
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()

/obj/machinery/juicer/act()
	var/obj/item/weapon/reagent_containers/glass/stakan = new()
	for(var/obj/item/weapon/reagent_containers/I in contents)
		I.reagents.trans_to(stakan, 50, 1)
		usr << "\blue Преобразование..."
		//world << "[stakan.reagents.get_reagent_amount("poison")]"
	stakan.Move(src.loc)
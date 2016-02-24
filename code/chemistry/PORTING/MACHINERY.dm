/obj/machinery/chemdispenser
	icon = 'icons/obj/chem.dmi'
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
			I.Move(src)
		else
			usr << "\red В автомате уже есть колба"
/obj/machinery/chemdispenser
	icon = 'icons/obj/machine/chem.dmi'
	icon_state = "dispenser"
	density = 1

	proc/dispense(var/reagent)
		for(var/obj/item/weapon/reagent_containers/glass/G in contents)
			G.reagents.add_reagent(reagent, 10)
			for(var/mob/M in range(3,src))
				M << "<b>� ������ ���������&#255; [reagent]</b>"
				world << "<b>[G.reagents.total_volume]"

	proc/get_container()
		for(var/obj/item/weapon/reagent_containers/glass/G in contents)
			G.Move(src.loc)

/obj/machinery/chemdispenser/act()
	var/my_text
	if(contents.len > 0)
		my_text = {"
		<html>
		<head><title>���������� ���������</title></head>
		<body>
		�������� �������:

		<br><a href=?blood>�����</a>
		<br><a href=?oil>�����</a>
		<br><a href=?eth>������</a>
		<br><a href=?car>�������</a>
		<br><a href=?oxy>��������</a>
		<br><a href=?sil>�������</a>
		<br><a href=?nit>����</a>

		<br>

		<br><a href=?get_>�������� �����</a>

		</body>
		</html>
		"}
	else
		my_text = {"
		<html>
		<head><title>���������� ���������</title></head>
		<body>

		<h1>�������� ����� � ���������!</h1>

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
					usr << "\bold �� ����� [I] � [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(I, usr.client.rhand_items[1]))
					I.Move(src)
					usr << "\bold �� ����� [I] � [src]"
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()
		else
			usr << "\red � �������� ��� ���� �����"


/obj/machinery/juicer
	icon = 'icons/obj/machine/chem.dmi'
	icon_state = "juicer"

/obj/machinery/juicer/act_by_item(var/obj/item/I)
	if(istype(I,/obj/item/weapon/reagent_containers))
		for(I in usr.contents)
			if(usr.client.my_hand_active == "left")
				if(istype(I, usr.client.lhand_items[1]))
					I.Move(src)
					usr << "\bold �� ����� [I] � [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(I, usr.client.rhand_items[1]))
					I.Move(src)
					usr << "\bold �� ����� [I] � [src]"
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()

/obj/machinery/juicer/act()
	var/obj/item/weapon/reagent_containers/glass/stakan = new()
	for(var/obj/item/weapon/reagent_containers/I in contents)
		I.reagents.trans_to(stakan, 50, 1)
		usr << "\blue ��������������..."
		//world << "[stakan.reagents.get_reagent_amount("poison")]"
	stakan.Move(src.loc)
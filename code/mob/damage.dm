//�����������

/mob/human
	typer = "NoFlammable"
	proc/bloodloss()
		for(var/obj/item/organs/O in src)
			if(O.hit_points < 70 || O.burn_points > 30)
				reagents.remove_reagent("blood", 5)

		if(reagents.get_reagent_amount("blood") < 150)
			var/random_message = rand(0,100)
			if(random_message <= 15)
				src << "<b>�� ���������� ��������������</b>"
				new /obj/effect/blood(src.loc)

		if(reagents.get_reagent_amount("blood") < 50)
			lying()
			signal = 1
			src << "<b>�� ������...</b>"

	proc/blood_new() //�������������� �����
		if(reagents.get_reagent_amount("blood") < 300)
			reagents.add_reagent("blood", rand(3,6))

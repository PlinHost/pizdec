/mob/petushok
	icon = 'icons/mob/human.dmi'
	icon_state = "petushok"

/mob/petushok/proc/LIFE_PROGRAM()

	spawn while(1)
		sleep(7)
		var/num_of_direction = rand(0,666)
		var/talking_about = rand(0,666)

		if(num_of_direction < 111)
			Move(step(src, SOUTH))

		if(num_of_direction < 222 && num_of_direction > 111)
			Move(step(src, NORTH))

		if(num_of_direction < 333 && num_of_direction > 222)
			Move(step(src, EAST))

		if(num_of_direction < 666 && num_of_direction > 555)
			Move(step(src, WEST))

		if(talking_about < 111)
			for(var/mob/M in range(6,src))
				M << "\blue Petushok говорит \" Ко-ко-ко! \" "

		if(talking_about < 222 && talking_about > 111)
			for(var/mob/M in range(6,src))
				M << "\blue Petushok говорит \" Кудах! \" "

		if(talking_about < 333 && talking_about > 222)
			for(var/mob/M in range(6,src))
				M << "\blue Petushok говорит \" Чисти, чисти, чисти! \" "

		if(talking_about < 666 && talking_about > 555)
			for(var/mob/M in range(6,src))
				M << "\blue Petushok говорит \" Запускаем гус&#255;, работ&#255;ги! \" "

		drop_egg()

/mob/petushok/New()
	LIFE_PROGRAM()

/mob/petushok/proc/drop_egg()
	var/chance = rand(0,850)

	if(chance < 5)
		new /obj/item/weapon/reagent_containers/psycho_egg(src.loc)

	if(chance < 10)
		new /obj/item/weapon/reagent_containers/egg(src.loc)

/obj/item/weapon/reagent_containers/psycho_egg
	icon_state = "psycho_egg"

	New()
		var/datum/reagents/R = new/datum/reagents(100)
		reagents = R
		R.my_atom = src
		R.add_reagent("codeine", 30) //от слова code

/obj/item/weapon/reagent_containers/egg
	icon_state = "egg"

	New()
		var/datum/reagents/R = new/datum/reagents(100)
		reagents = R
		R.my_atom = src
		R.add_reagent("nothing", 30)

/obj/homunculus
	icon = 'icons/mob/human.dmi'
	icon_state = "human_2"
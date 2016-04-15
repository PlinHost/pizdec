#define self_regulation_is_not_possible 60


/mob/human/proc/checking_turf()
	var/turf/T = src.loc
	if(usr.client.cloth_ == 0 || usr.client.helmet_ == 0)

	//OXY

		if(T.oxygen < 300)
			if(oxygen > 0)
				sleep(1)
				oxygen -= pick(1,0)

		if(T.oxygen > 300)
			if(oxygen < 100)
				oxygen += 1

		if(T.water > 10)
			alpha = 128
		else
			alpha = 255

	//OXY

	//TEMPERATURE

		if(T.temperature > self_regulation_is_not_possible)
			if(temperature < T.temperature)
				temperature += 1

		if(T.temperature < self_regulation_is_not_possible * -1)
			if(temperature > T.temperature)
				temperature -= 1

		if(!(T.temperature < self_regulation_is_not_possible * -1) && !(T.temperature > self_regulation_is_not_possible))

			if(temperature < self_regulation_is_not_possible)
				temperature += 1

			if(temperature < self_regulation_is_not_possible)
				temperature -= 1

	//TEMPERATURE


/mob/human/proc/checking_my_system()

	if(oxygen < 50)
		my_oxygen = "ALERT!"

	if(oxygen > 50)
		my_oxygen = "NO ALERT"

	if(oxygen < 20)
		usr << "Тут ты это, ну умер."
		icon_state = "dead"
		lying()
		signal = 1

	if(temperature < -30 || temperature > 100)
		usr << "Тут ты это, ну умер."
		icon_state = "dead"
		lying()
		signal = 1

	if(stamina == 0)
		if(max_pulse < 150)
			max_pulse += pick(0,1)

	if(!(stamina == 0))
		if(max_pulse > 80)
			max_pulse -= 1

	if(pulse > 100)
		var/chance = rand(0,100)
		if(chance < 2)
			usr << "\red <font size = 5>Сердце остановилось</font>"
			icon_state = "dead"
			signal = 1

	if(pulse > 120)
		var/chance = rand(0,120)
		if(chance < 4)
			usr << "\red <font size = 5>Сердце остановилось</font>"
			icon_state = "dead"
			signal = 1

	if(pulse > 150)
		var/chance = rand(0,120)
		if(chance < 6)
			usr << "\red <font size = 5>Сердце остановилось</font>"
			icon_state = "dead"
			signal = 1

//РАЗБИТО НА ПРОЦЕДУРЫ
//Код взрывной волны

var/global/personal_id = 0

/atom
	var //характеристики
		weight = 0 //масса
		self_speed = 0 //скорость
		my_id = 0

	proc/rad_wave(var/frequency, var/wave_length)
		var/wave/radioactive/RAD
		for(var/turf/simulated/floor/F in range(round(frequency/pow(wave_length,2)), src))
			RAD = new(F)
			RAD.id = my_id
			RAD.frequency = frequency
			RAD.length = wave_length
			RAD.force = (get_dist(src, RAD)*-1) + wave_length

			for(var/obj/machinery/generator/rad_gen/RD in RAD.loc)
				if(RD in RAD.loc)
					if(RAD.force > 1)
						RD.amperage += 150
						RD.icon_state = "rad_gen_on"

	proc/del_rad_wave()
		for(var/wave/W in waves)
			if(W.id == my_id)
				del(W)


	proc/wave_throw(var/atom/movable/I, var/wave/force/RAD, var/k, var/plus, var/k_2, var/plus_2)
		while(RAD.force > 0 && RAD.force > round(I.weight/10))
			RAD.force -= 1
			if(plus == 1)
				k += 1
			else
				k -=1

			if(k_2 != 0)
				if(plus == 1)
					k_2 += 1
				else
					k_2 -= 1

			if(istype(I.loc,/turf/simulated/wall))
				I.y -= RAD.force + 1
				for(var/mob/M in range(6, I))
					M << "\red [I] отскакивает от стены"

				for(var/mob/M in range(6, I))
					M << "\red [I] уносит в сторону ударной волной"


	proc/force_wave(var/frequency, var/wave_length)
		var/wave/force/RAD
		for(var/turf/simulated/floor/F in range(round(frequency/pow(wave_length,2)), src))
			RAD = new(F)
			RAD.id = "boom"
			RAD.pressure = frequency
			RAD.speed = wave_length
			RAD.force = (get_dist(src, RAD)*-1) + wave_length

			for(var/obj/item/I in RAD.loc)
				if(RAD.x > x && RAD.y == y)
					wave_throw(I, RAD,I.x, 1)

				if(RAD.x < x && RAD.y == y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						wave_throw(I, RAD,I.x, -9999, 0, 0)


				if(RAD.y < y && RAD.x == x)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						wave_throw(I, RAD,I.y, -9999, 0, 0)

				if(RAD.y > y && RAD.x == x)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						wave_throw(I, RAD,I.y, 1, 0, 0)

				if(RAD.x < x && RAD.y < y)
					wave_throw(I, RAD,I.x, -9999, I.y, -9999)

				if(RAD.x > x && RAD.y > y)
					wave_throw(I, RAD,I.x, 1, I.y, 1)

				if(RAD.x < x && RAD.y > y)
					wave_throw(I, RAD,I.x, -9999, I.y, 1)

				if(RAD.x > x && RAD.y < y)
					wave_throw(I, RAD,I.x, 1, I.y, -9999)

///////////////////////////MOB////HUMAN//////////

			for(var/mob/I in RAD.loc)
				if(RAD.x > x && RAD.y == y)
					wave_throw(I, RAD,I.x, 1)

				if(RAD.x < x && RAD.y == y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						wave_throw(I, RAD,I.x, -9999, 0, 0)


				if(RAD.y < y && RAD.x == x)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						wave_throw(I, RAD,I.y, -9999, 0, 0)

				if(RAD.y > y && RAD.x == x)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						wave_throw(I, RAD,I.y, 1, 0, 0)

				if(RAD.x < x && RAD.y < y)
					wave_throw(I, RAD,I.x, -9999, I.y, -9999)

				if(RAD.x > x && RAD.y > y)
					wave_throw(I, RAD,I.x, 1, I.y, 1)

				if(RAD.x < x && RAD.y > y)
					wave_throw(I, RAD,I.x, -9999, I.y, 1)

				if(RAD.x > x && RAD.y < y)
					wave_throw(I, RAD,I.x, 1, I.y, -9999)

			for(var/wave/W in waves)
				if(W.id == "boom")
					del(W)
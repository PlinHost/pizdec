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
						RD.amperage += 70
						RD.icon_state = "rad_gen_on"

		for(var/wave/W in waves)
			if(W.id == my_id)
				del(W)

	proc/force_wave(var/frequency, var/wave_length)
		var/wave/force/RAD
		for(var/turf/simulated/floor/F in range(round(frequency/pow(wave_length,2)), src))
			RAD = new(F)
			RAD.id = "boom"
			RAD.pressure = frequency
			RAD.speed = wave_length
			RAD.force = (get_dist(src, RAD)*-1) + wave_length

			for(var/obj/items/I in RAD.loc)
				if(RAD.x > x && RAD.y == y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10)) //одна единица силы может сдвинуть с места 10 кг
						RAD.force -= 1
						I.x += 1
						if(istype(I.loc,/turf/simulated/wall))
							I.x -= RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

				if(RAD.x < x && RAD.y == y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.x -= 1

						if(istype(I.loc,/turf/simulated/wall))
							I.x += RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"


				if(RAD.y < y && RAD.x == x)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.y -= 1

						if(istype(I.loc,/turf/simulated/wall))
							I.y += RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

				if(RAD.y > y && RAD.x == x)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.y += 1

						if(istype(I.loc,/turf/simulated/wall))
							I.y -= RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

				if(RAD.x < x && RAD.y < y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.x -= 1
						I.y -= 1

						if(istype(I.loc,/turf/simulated/wall))
							I.x += RAD.force + 1
							I.y += RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

				if(RAD.x > x && RAD.y > y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.x += 1
						I.y += 1

						if(istype(I.loc,/turf/simulated/wall))
							I.x -= RAD.force + 1
							I.y -= RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

				if(RAD.x < x && RAD.y > y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.x -= 1
						I.y += 1

						if(istype(I.loc,/turf/simulated/wall))
							I.x += RAD.force + 1
							I.y -= RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

				if(RAD.x > x && RAD.y < y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.x += 1
						I.y -= 1

						if(istype(I.loc,/turf/simulated/wall))
							I.x -= RAD.force + 1
							I.y += RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

///////////////////////////MOB////HUMAN//////////

			for(var/mob/I in RAD.loc)
				if(RAD.x > x && RAD.y == y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10)) //одна единица силы может сдвинуть с места 10 кг
						RAD.force -= 1
						I.x += 1
						if(istype(I.loc,/turf/simulated/wall))
							I.x -= RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

				if(RAD.x < x && RAD.y == y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.x -= 1

						if(istype(I.loc,/turf/simulated/wall))
							I.x += RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"


				if(RAD.y < y && RAD.x == x)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.y -= 1

						if(istype(I.loc,/turf/simulated/wall))
							I.y += RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

				if(RAD.y > y && RAD.x == x)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.y += 1

						if(istype(I.loc,/turf/simulated/wall))
							I.y -= RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

				if(RAD.x < x && RAD.y < y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.x -= 1
						I.y -= 1

						if(istype(I.loc,/turf/simulated/wall))
							I.x += RAD.force + 1
							I.y += RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

				if(RAD.x > x && RAD.y > y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.x += 1
						I.y += 1

						if(istype(I.loc,/turf/simulated/wall))
							I.x -= RAD.force + 1
							I.y -= RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

				if(RAD.x < x && RAD.y > y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.x -= 1
						I.y += 1

						if(istype(I.loc,/turf/simulated/wall))
							I.x += RAD.force + 1
							I.y -= RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

				if(RAD.x > x && RAD.y < y)
					while(RAD.force > 0 && RAD.force > round(I.weight/10))
						RAD.force -= 1
						I.x += 1
						I.y -= 1

						if(istype(I.loc,/turf/simulated/wall))
							I.x -= RAD.force + 1
							I.y += RAD.force + 1
							for(var/mob/M in range(6, I))
								M << "\red [I] отскакивает от стены"

						for(var/mob/M in range(6, I))
							M << "\red [I] уносит в сторону ударной волной"

			for(var/wave/W in waves)
				if(W.id == "boom")
					del(W)
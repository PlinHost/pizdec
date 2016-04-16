//Нагрев

#define LASER_POWER 420
#define WELDER 80

//Температура


#define LASER_POINT 0.03
#define WELDER_FLAME 0.25
//Площадь, которая нагревается

/atom
	var/typer = "Melts" //горючий ли объект
	var/MAXTEMP = 1000 //максимальная температуа, которую способен выдержать объект
	var/my_temp = 21 //изначальная температура

	//Flammable, NoFlammable, Melts

/atom/proc/fire()

/atom/proc/melts()

/atom/proc/heat(var/temperature, var/sq)
	if(typer == "NoFlammable")
		return

	if(typer == "Flammable")
		if(sq > 0.01 && temperature > 200)
			fire()

	if(typer == "Melts")
		my_temp += round((temperature * sq) / (round(weight * sq)))
		if(my_temp > MAXTEMP)
			for(var/mob/M in range(5,src))
				M << "\red [src] плавитс&#255;"
			melts()
			if(istype(src, /turf/simulated/wall))
				src = new /turf/simulated/floor/plating(src)
			else
				del(src)

/turf/simulated/floor/proc/temperature_exchange()
	for(var/atom/A in src)
		if(A.my_temp > temperature)
			temperature += 1
			A.my_temp -= 1

		if(A.my_temp < temperature)
			temperature -= 1
			A.my_temp += 1

		if(A.my_temp > A.MAXTEMP)
			if(A.typer == "Melts")
				for(var/mob/M in range(5,src))
					M << "\red [src] плавитс&#255;"
				melts()
				if(istype(src, /turf/simulated/wall))
					src = new /turf/simulated/floor/plating(src)
				else
					del(src)

			if(A.typer == "Flammable")
				if(A.my_temp > 200)
					A.fire()

	for(var/turf/simulated/wall/W in range(1,src))
		if(W.my_temp > temperature)
			W.my_temp -= 1
			temperature += 1

		if(W.my_temp < temperature)
			W.my_temp += 1
			temperature -= 1

		if(W.my_temp > W.MAXTEMP)
			W.melts()
			W = new /turf/simulated/floor/plating(W)

			for(var/turf/simulated/wall/R in range(1,W))

				if(R.my_temp < W.my_temp)
					R.my_temp += 1
					W.my_temp -= 1

				if(R.my_temp > W.my_temp)
					R.my_temp -= 1
					W.my_temp += 1

				if(R.my_temp > R.MAXTEMP)
					R.melts()
					R = new /turf/simulated/floor/plating(R)

/turf/simulated/wall
	typer = "Melts"
	weight = 70

/turf/simulated/wall/r_wall
	MAXTEMP = 5000
	icon_state = "r_wall"

/turf/simulated/wall/shuttle
	icon_state = "shuttle"

	act()
		world << "[my_temp]"
//Хуйня конечно, но сойдет, привкус атмоса есть.
//upd. Это дерьмо претерпело некоторые изменения
//upd. Здесь были переименованы некоторые переменные
var/global/list/turf/simulated/floor/floor_list = list()
#define gas_number 21  //газоделитель

/turf/space
	name = "space"
	icon = 'icons/turf/turfs.dmi'
	icon_state = "space"
	pass_gas = 1
	oxygen = 0
	nitrogen = 0
	plasma = 0
	temperature = -100
	luminosity = 1

/atom
	var/pass_gas = 1

/turf
	var/gas_max = 600 //максимальное число газоединиц на тайл
	var/cur_gas //текущее число газоединиц
	var/transfer_gas
	var/limit = 0

/turf
	var/temperature = 21 //идеальное число температуроединиц

/turf/simulated/floor
	pass_gas = 1

/turf/simulated/floor/Del()
	new /turf/simulated/floor/whore(src.loc)

/turf/simulated/floor/proc/one_unit(var/my_direction)
	var/floor_in_range = 0
	var/outer_space = 1
	var/space_temperature = 0

	var/turf/simulated/floor/F = get_step(src,my_direction)
	var/turf/TF = get_step(src,my_direction)

	for(var/atom/A in F)
		if(A.pass_gas != 1)
			floor_in_range = 1

	for(var/atom/A in TF)
		if(A.pass_gas != 1)
			outer_space = 0

	if(floor_in_range == 0)
		if(F.nitrogen < nitrogen)
			F.nitrogen += nitrogen / gas_number
			nitrogen = nitrogen - (nitrogen / gas_number)

		if(F.plasma < plasma)
			F.plasma += plasma / gas_number
			plasma = plasma - (plasma / gas_number)

		//if(istype(F,/turf/simulated/floor))
		//	F.chem()
		//
		if(outer_space == 1)
			if(istype(TF, /turf/space))
				for(var/atom/A in src)
					if(A.pass_gas != 1)
						space_temperature = 1

				if(space_temperature == 0)
					if(temperature > -320)
						temperature -= pick(1,2)
					if(nitrogen > 15)
						nitrogen -= pick(8,10,15)
					if(plasma > 15)
						plasma -= pick(8,10,15)
					if(oxygen > 15)
						oxygen -= pick(8,10,15)
		//
		if(F.oxygen < oxygen)
			F.oxygen += oxygen / gas_number
			oxygen = oxygen - (oxygen / gas_number)


		if(F.water < water)
			F.water += water / gas_number
			water = water - (water / gas_number)

		if(F.temperature > temperature)
			temperature += 2
			F.temperature -= 1
			if(F.temperature < temperature)
				temperature -= 2
				F.temperature += 1

		/turf/simulated/floor/up
		/turf/simulated/floor/down

		if(istype(F, /turf/simulated/floor/whore) || istype(src, /turf/simulated/floor/down))
			var/turf/simulated/floor/MYWHORE = locate(x,y,z-1)
			F.oxygen = MYWHORE.oxygen
			F.nitrogen = MYWHORE.nitrogen
			F.plasma = MYWHORE.plasma
			F.temperature = MYWHORE.temperature
			F.water = MYWHORE.water

			MYWHORE.oxygen = F.oxygen
			MYWHORE.nitrogen = F.nitrogen
			MYWHORE.plasma = F.plasma
			MYWHORE.temperature = F.temperature
			MYWHORE.water = F.water

		if(istype(F, /turf/simulated/floor/up))
			var/turf/simulated/floor/MYWHORE = locate(x,y,z+1)

			MYWHORE.oxygen = F.oxygen
			MYWHORE.nitrogen = F.nitrogen
			MYWHORE.plasma = F.plasma
			MYWHORE.temperature = F.temperature
			MYWHORE.water = F.water

			F.oxygen = MYWHORE.oxygen
			F.nitrogen = MYWHORE.nitrogen
			F.plasma = MYWHORE.plasma
			F.temperature = MYWHORE.temperature
			F.water = MYWHORE.water

/datum/anal_controller/New()
	process()

/datum/anal_controller

/datum/anal_controller/proc/process()
	spawn while(1)
		sleep(2)
		turfs_processing()

/datum/anal_controller/proc/turfs_processing()
	for(var/turf/simulated/floor/F in floor_list)
		F.one_unit(WEST)
		F.one_unit(EAST)
		F.one_unit(SOUTH)
		F.one_unit(NORTH)
	sleep(1)


/turf/simulated/floor/process()
	spawn while(2)
		cur_gas = nitrogen + plasma + oxygen + water
		//if(cur_gas > gas_max)

		if(water > 10)
			if(limit < 1)
				new /obj/water(src)

		for(var/wave/radio/R in src)
			if(R.frequency > 50 && R.force > 5)
				temperature += 1


		temperature_exchange()

		//sleep(2)
		//chem()
		sleep(1)

mob/verb/block_test()
	var/turf/T
	var k = 0
	for(T in block(locate(1,1,1),locate(100,100,1)))
		if(istype(T, /turf/space))
			k += 1
			world << "[T.x]_[T.y]_[T.z] @ [k]"


/turf/simulated/floor/act()
//	my_val()
//	my_LIGHT_state = 1
	world << "nitrogen [nitrogen]; plasma [plasma]; oxygen [oxygen]; temperature [temperature]; water [water]"
	usr << "brightness:[sd_lumcount]"

/turf/simulated/floor/New()
	floor_list += src
	//fuck_light()
	var/datum/reagents/R = new/datum/reagents(200)
	reagents = R
	R.my_atom = src
	process()
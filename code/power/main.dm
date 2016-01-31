var/global/DERVENPOWER = 0
var/global/list/smes = list()
var/global/list/apc = list()

/obj/machinery
	var/use_power = 0 // используется энергоедениц
	var/powernet = 0

/obj/cable
	name = "cable"
	icon = 'icons/cable.dmi'
	var/powernet = 0
	var/reset = 0
	var/zLevel = 0
	alpha = 128
	layer = 2.4

/obj/machinery/smes
	name = "smes"
	icon = 'power.dmi'
	icon_state = "smes"

	//
	var/power = 26000 //по дефолту 26000 энергоедениц
	var/new_power = 0 // генерируется энергоедениц
	//

/obj/machinery/PIZDA
	name = "power intensity zone device assistant(PIZDA)"
	icon = 'power.dmi'
	icon_state = "apc"
	layer = 4
	var/reset = 0

	//
	var/power = 16000 //по дефолту 16000 энергоедениц
	var/new_power = 0 // генерируется энергоедениц

/obj/machinery/PIZDA/act()
	world << "[powernet]; [power]"

/obj/machinery/PIZDA/New()
	apc += src
	process()

/obj/machinery/PIZDA/process()
	spawn while(1)
		sleep(1)
		if(reset == 1)
			reset = 0
			powernet = 0

/obj/machinery/smes/process()
	spawn while(1)
		sleep(1)
		for(var/obj/machinery/PIZDA/epta in apc)
			if(epta.powernet == powernet)
				if(power > 0)
					power -= 100
					epta.power += 100

/obj/cable/New()
	process()

/obj/cable/process()
	spawn while(1)
		sleep(1)
		if(dir == 2 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

			for(var/obj/cable/A in get_step(src,NORTH))
				if(A.powernet != 0)
					powernet = A.powernet

			for(var/obj/cable/A in get_step(src,SOUTH))
				if(A.powernet != 0)
					powernet = A.powernet

			for(var/obj/machinery/PIZDA/A in get_step(src,SOUTH))
				if(powernet != 0)
					A.powernet = powernet

			for(var/obj/machinery/PIZDA/A in get_step(src,NORTH))
				if(powernet != 0)
					A.powernet = powernet


			for(var/obj/machinery/smes/S in get_step(src,SOUTH))
				powernet = S.powernet

			for(var/obj/machinery/smes/S in get_step(src,NORTH))
				powernet = S.powernet

			for(var/obj/machinery/generator/S in get_step(src,SOUTH))
				S.powernet = powernet

			for(var/obj/machinery/generator/S in get_step(src,NORTH))
				S.powernet = powernet

		if(dir == 4 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

			for(var/obj/cable/A in get_step(src,EAST))
				if(A.powernet != 0)
					powernet = A.powernet

			for(var/obj/cable/A in get_step(src,WEST))
				if(A.powernet != 0)
					powernet = A.powernet

			for(var/obj/machinery/smes/S in get_step(src,EAST))
				powernet = S.powernet

			for(var/obj/machinery/smes/S in get_step(src,WEST))
				powernet = S.powernet

			for(var/obj/machinery/generator/S in get_step(src,WEST))
				S.powernet = powernet

			for(var/obj/machinery/generator/S in get_step(src,EAST))
				S.powernet = powernet

			for(var/obj/machinery/PIZDA/A in get_step(src,EAST))
				if(powernet != 0)
					A.powernet = powernet

			for(var/obj/machinery/PIZDA/A in get_step(src,WEST))
				if(powernet != 0)
					A.powernet = powernet

		if(zLevel == 1)
			for(var/obj/cable/A in locate(x,y,z+1))
				if(A.powernet != 0)
					powernet = A.powernet

		if(zLevel == -1)
			for(var/obj/cable/A in locate(x,y,z-1))
				if(A.powernet != 0)
					powernet = A.powernet

		if(reset == 1) // ебасброс
			powernet = 0
			reset = 0
			world << "ОБРЫВ КАБЕЛЯ К ХУЯМ БЛЯДЬ"



/obj/cable/Del()
	for(var/obj/cable/P in world)
		if(powernet == P.powernet)
			P.reset = 1

	for(var/obj/machinery/PIZDA/A in apc)
		if(powernet == A.powernet)
			A.reset = 1

/obj/cable/act()
	world << "[powernet]"

/obj/machinery/smes/New()
	DERVENPOWER ++
	powernet = DERVENPOWER
	smes += src
	process()

/obj/machinery/generator
	name = "generator"
	icon = 'power.dmi'
	icon_state = "generator"
	layer = 4

/obj/machinery/smes/act()
	usr << "Банк энергии несет в себе [power] энергоединиц"

/obj/machinery/generator/act()
	usr << "Вы бьете пиздюльгенератор и тем самым принуждаете его работать"
	for(var/obj/machinery/smes/S in world)
		if(S.powernet == powernet)
			S.new_power += 200
			S.power += S.new_power
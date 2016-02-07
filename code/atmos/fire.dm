var/global/list/landmarks = list()

var/global/list/lesorub = list()
var/global/list/ass = list()
var/global/list/hunt = list()
var/global/list/ultraboy = list()

/obj/fire
	name = "fire"
	icon = 'icons/effects.dmi'
	icon_state = "fire"

	act_by_item(var/obj/items/I)

		if(I == /obj/items/fire_ballon)
			usr << "\blue Пшык-пшыыык! Огонь умирает!"
			del(src)

/obj/explode
	name = "explode"
	icon = 'icons/effects.dmi'
	icon_state = "explode"
	var/destroy = 0
	var/EXPLODE = 0

/obj/start
	name = "start"
	icon = 'icons/effects.dmi'
	icon_state = "start"
	layer = 7

/obj/prof/ass/New()
	layer = 1
	var/turf/T = src.loc
	ass += T

/obj/prof/lesorub/New()
	layer = 1
	var/turf/T = src.loc
	lesorub += T

/obj/prof/ultraboy/New()
	layer = 1
	var/turf/T = src.loc
	ultraboy += T

/obj/prof/hunt/New()
	layer = 1
	var/turf/T = src.loc
	hunt += T

/obj/prof/ass
	name = "start"
	icon = 'icons/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/hunt
	name = "start"
	icon = 'icons/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/lesorub
	name = "start"
	icon = 'icons/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/ultraboy
	name = "start"
	icon = 'icons/effects.dmi'
	icon_state = "start2"
	layer = 7



/obj/start/New()
	layer = 1
	var/turf/T = src.loc
	landmarks += T



/obj/explode/New()
	personal_id += 1
	my_id = personal_id
	BOOM()

/obj/lobby_marker

/obj/lobby_marker/New()
	y -= 1
	new /obj/lobb_y(src.loc)

/obj/smoke
	name = "smoke"
	icon = 'icons/effects.dmi'
	icon_state = "smoke"
	opacity = 1

/obj/smoke/New()
	sleep(6)
	del(src)

/obj/explode/proc/BOOM()
	var/turf/T = src.loc
	EXPLODE = T.plasma / 10
	EXPLODE = round(EXPLODE) //сила взрыва во взрывоединицах

	force_wave(rand(0,T.oxygen/10), EXPLODE)
	for(var/mob/M in range(15,src))
		M << "Ты слышишь смачный бабах"
	for(var/turf/simulated/floor/EPTAHULI in range(src,EXPLODE))
		destroy = rand(0,100)
		if(destroy < 30)
			for(var/atom/A in EPTAHULI)
				if(!(istype(A, /obj/explode)))
					del(A)
			del(EPTAHULI)
		else
			new /obj/smoke(EPTAHULI)
	del(src)


/obj/fire/New()
	process()

/turf

/obj/fire/process()
	var/SAD
	spawn while(1)
		sleep(3)
		for(var/turf/simulated/floor/EPTAHULI in range(src,1))
			for(var/atom/A in EPTAHULI)
				if(A.pass_gas == 1)
					if(EPTAHULI.temperature < 2048) //возможный максимум теплоединиц при самых оптимальных условиях на данной станции
						EPTAHULI.temperature += 1 //передача тепла с помощью излучения
						if(EPTAHULI.temperature > 600) //при данной температуре кислород пусть будет гореть без поддержания горения с помощью плазмы
							if(EPTAHULI.oxygen > 100)
								EPTAHULI.oxygen -= 1
								EPTAHULI.CO2 += 1
								EPTAHULI.temperature += 1
								if(SAD < 2)
									new /obj/fire(EPTAHULI)
									SAD += 1

						if(EPTAHULI.oxygen > 100 && EPTAHULI.plasma > 5) //выделение тепла при сжигании кислорода и плазмы
							EPTAHULI.temperature += 1
							EPTAHULI.oxygen -= 1
							EPTAHULI.plasma -= 1
							EPTAHULI.CO2 += 1
							new /obj/fire(EPTAHULI)

						if(EPTAHULI.oxygen < 100)
							del(src)

						if(EPTAHULI.water > 10)
							del(src)


/obj/machinery/lighter/act()
	var/turf/T = src.loc
	var/EXP
	EXP = T.plasma/10
	EXP = round(EXP)
	if(T.oxygen > 100 && T.plasma > 5)

		usr << "Пых-пых, ВСПЫХИВАЕТ ПЛАМЯ!"
		new /obj/fire(T)

	if(T.oxygen > 100 && T.plasma > 10)
		usr << "Бах-бах!"
		new /obj/explode(src.loc)
	//if(T.oxygen > 500 && T.plasma > 10)

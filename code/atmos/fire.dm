//здесь прописаны различные эффекты

var/global/list/landmarks = list()

//здесь прописаны списки профессий
var/global/list/captain = list()
var/global/list/assistant = list()
var/global/list/HOS = list()
var/global/list/HOP = list()
var/global/list/CE = list()
var/global/list/engineer = list()
var/global/list/technic = list()
var/global/list/scientist = list()
var/global/list/doctor = list()
var/global/list/bartender = list()
var/global/list/cook = list()
var/global/list/security = list()
var/global/list/detective = list()

/obj/effect/blood
	icon = 'icons/effects/effects.dmi'
	icon_state = "blood1"

/obj/effect/blood/New()
	var/blood_sprite = pick(1,2,3)
	icon_state = "blood[blood_sprite]"

/obj/effect/fire
	name = "fire"
	icon = 'icons/effects/effects.dmi'
	icon_state = "fire"

	act_by_item(var/obj/item/I)

		if(I == /obj/item/fire_ballon)
			usr << "\blue Пшык-пшыыык! Огонь умирает!"
			del(src)

/obj/effect/explode
	name = "explode"
	icon = 'icons/effects/effects.dmi'
	icon_state = "explode"
	var/destroy = 0
	var/EXPLODE = 0

/obj/start
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start"
	layer = 7

/obj/prof/assistant/New()
	layer = 1
	var/turf/T = src.loc
	assistant += T

/obj/prof/captain/New()
	layer = 1
	var/turf/T = src.loc
	captain += T

/obj/prof/security/New()
	layer = 1
	var/turf/T = src.loc
	security += T

/obj/prof/detective/New()
	layer = 1
	var/turf/T = src.loc
	detective += T

/obj/prof/HOS/New()
	layer = 1
	var/turf/T = src.loc
	HOS += T

/obj/prof/HOP/New()
	layer = 1
	var/turf/T = src.loc
	HOP += T

/obj/prof/scientist/New()
	layer = 1
	var/turf/T = src.loc
	scientist += T

/obj/prof/security/New()
	layer = 1
	var/turf/T = src.loc
	security += T

/obj/prof/doctor/New()
	layer = 1
	var/turf/T = src.loc
	doctor += T

/obj/prof/CE/New()
	layer = 1
	var/turf/T = src.loc
	CE += T

/obj/prof/engineer/New()
	layer = 1
	var/turf/T = src.loc
	engineer += T

/obj/prof/cook/New()
	layer = 1
	var/turf/T = src.loc
	cook += T

/obj/prof/assistant
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/captain
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/engineer
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/CE
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/technic
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/HOP
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/HOS
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/security
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/detective
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/doctor
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/bartender
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/scientist
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/cook
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/start/New()
	layer = 1
	var/turf/T = src.loc
	landmarks += T

/obj/effect/explode/New()
	personal_id += 1
	my_id = personal_id
	BOOM()

/obj/lobby_marker

/obj/lobby_marker/New()
	y -= 1
	new /obj/lobb_y(src.loc)

/obj/effect/smoke
	name = "smoke"
	icon = 'icons/effects/effects.dmi'
	icon_state = "smoke"
	opacity = 1

/obj/effect/smoke/New()
	sleep(6)
	del(src)

/obj/effect/explode/proc/BOOM()
	var/turf/T = src.loc
	EXPLODE = T.plasma / 10
	EXPLODE = round(EXPLODE) //сила взрыва во взрывоединицах

	force_wave(rand(round(T.oxygen/10 - pick(10,15,5)),T.oxygen/10), EXPLODE)
	for(var/mob/M in range(15,src))
		M << "Ты слышишь смачный бабах"
	for(var/turf/simulated/floor/FLOOR in range(src,EXPLODE))
		destroy = rand(0,100)
		if(destroy < 45)
			for(var/atom/A in FLOOR)
				if(!(istype(A, /obj/effect/explode)))
					del(A)
			del(FLOOR)
		else
			new /obj/effect/smoke(FLOOR)
	del(src)


/obj/effect/fire/New()
	process()

/turf

/obj/effect/fire/process() //огонь
	var/SAD
	spawn while(1)
		sleep(3)
		for(var/turf/simulated/floor/FLOOR in range(src,1))
			for(var/atom/A in FLOOR)
				if(A.pass_gas == 1)
					if(FLOOR.temperature < 2048) //возможный максимум теплоединиц при самых оптимальных условиях на данной станции
						FLOOR.temperature += 1 //передача тепла с помощью излучения
						if(FLOOR.temperature > 600) //при данной температуре кислород пусть будет гореть без поддержания горения с помощью плазмы
							if(FLOOR.oxygen > 100)
								FLOOR.oxygen -= 1
								FLOOR.CO2 += 1
								FLOOR.temperature += 1
								if(SAD < 2)
									new /obj/effect/fire(FLOOR)
									SAD += 1

						if(FLOOR.oxygen > 100 && FLOOR.plasma > 5) //выделение тепла при сжигании кислорода и плазмы
							FLOOR.temperature += 1
							FLOOR.oxygen -= 1
							FLOOR.plasma -= 1
							FLOOR.CO2 += 1
							new /obj/effect/fire(FLOOR)

						if(FLOOR.oxygen < 100)
							del(src)

						if(FLOOR.water > 10)
							del(src)


/obj/machinery/lighter/act()
	var/turf/T = src.loc
	var/EXP
	EXP = T.plasma/10
	EXP = round(EXP)
	if(T.oxygen > 100 && T.plasma > 5)

		usr << "Пых-пых, ВСПЫХИВАЕТ ПЛАМЯ!"
		new /obj/effect/fire(T)

	if(T.oxygen > 100 && T.plasma > 10)
		usr << "Бах-бах!"
		new /obj/effect/explode(src.loc)
	//if(T.oxygen > 500 && T.plasma > 10)

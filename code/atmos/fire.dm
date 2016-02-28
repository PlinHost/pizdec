var/global/list/landmarks = list()

var/global/list/lesorub = list()
var/global/list/ass = list()
var/global/list/hunt = list()
var/global/list/ultraboy = list()

/obj/effect/blood
	icon = 'icons/effects/effects.dmi'
	icon_state = "blood1"

/obj/effect/blood/New()
	var/recei_poshel_nahui = pick(1,2,3)
	icon_state = "blood[recei_poshel_nahui]"

/obj/effect/fire
	name = "fire"
	icon = 'icons/effects/effects.dmi'
	icon_state = "fire"

	act_by_item(var/obj/item/I)

		if(I == /obj/item/fire_ballon)
			usr << "\blue ����-������! ����� �������!"
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
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/hunt
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/lesorub
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/ultraboy
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
	EXPLODE = round(EXPLODE) //���� ������ �� ��������������

	force_wave(rand(round(T.oxygen/10 - pick(10,15,5)),T.oxygen/10), EXPLODE)
	for(var/mob/M in range(15,src))
		M << "�� ������� ������� �����"
	for(var/turf/simulated/floor/EPTAHULI in range(src,EXPLODE))
		destroy = rand(0,100)
		if(destroy < 45)
			for(var/atom/A in EPTAHULI)
				if(!(istype(A, /obj/effect/explode)))
					del(A)
			del(EPTAHULI)
		else
			new /obj/effect/smoke(EPTAHULI)
	del(src)


/obj/effect/fire/New()
	process()

/turf

/obj/effect/fire/process()
	var/SAD
	spawn while(1)
		sleep(3)
		for(var/turf/simulated/floor/EPTAHULI in range(src,1))
			for(var/atom/A in EPTAHULI)
				if(A.pass_gas == 1)
					if(EPTAHULI.temperature < 2048) //��������� �������� ����������� ��� ����� ����������� �������� �� ������ �������
						EPTAHULI.temperature += 1 //�������� ����� � ������� ���������
						if(EPTAHULI.temperature > 600) //��� ������ ����������� �������� ����� ����� ������ ��� ����������� ������� � ������� ������
							if(EPTAHULI.oxygen > 100)
								EPTAHULI.oxygen -= 1
								EPTAHULI.CO2 += 1
								EPTAHULI.temperature += 1
								if(SAD < 2)
									new /obj/effect/fire(EPTAHULI)
									SAD += 1

						if(EPTAHULI.oxygen > 100 && EPTAHULI.plasma > 5) //��������� ����� ��� �������� ��������� � ������
							EPTAHULI.temperature += 1
							EPTAHULI.oxygen -= 1
							EPTAHULI.plasma -= 1
							EPTAHULI.CO2 += 1
							new /obj/effect/fire(EPTAHULI)

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

		usr << "���-���, ���������� �����!"
		new /obj/effect/fire(T)

	if(T.oxygen > 100 && T.plasma > 10)
		usr << "���-���!"
		new /obj/effect/explode(src.loc)
	//if(T.oxygen > 500 && T.plasma > 10)

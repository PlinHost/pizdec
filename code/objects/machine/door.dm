var/global/DOOR_ID = 1
var/global/list/doors = list()

/obj/machinery/door/airlock
	name = "door"
	icon = 'icons/obj/door.dmi'
	icon_state = "door_close"
	density = 1
	on = 0
	weight = 50
	use_power = 1
	var/close = 1
	pass_gas = 0
	layer = 7
	need_amperage = 20
	var/id

/obj/machinery/door/airlock/New()
	id = DOOR_ID
	DOOR_ID += 1
	doors += src
	process()

/obj/machinery/firedoor
	name = "firedoor"
	icon = 'icons/obj/door.dmi'
	icon_state = "firedoor_open"
	density = 0
	on = 1
	use_power = 1
	var/close = 1
	pass_gas = 1

/obj/machinery/firedoor/check()
	var/turf/T = src.loc
	var/say_chance = pick(0,200)
	if(on == 1)
		if(T.oxygen < 300 || T.nitrogen > 100 || T.plasma > 100 || T.temperature > 70 || T.temperature < -10)
			icon_state = "firedoor_close"
			if(say_chance < 15)
				for(var/mob/M in range(5,src))
					M << "Со стороны фаирлока слышна сирена \"Виу-виу, спасайтесь!\" "
			pass_gas = 0
			density = 1
			opacity = 1
		else
			icon_state = "firedoor_open"
			density = 0
			opacity = 0
			pass_gas = 1

/obj/machinery/door/airlock/act()
	world << "[powernet]"
	if(on == 1)
		if(close == 1)
			usr << "Дверь делает пшышь-пшышь"
			icon_state = "door_open"
			close = 0
			density = 0
			pass_gas = 1
		else
			usr << "Дверь делает пшышь-пшышь"
			icon_state = "door_close"
			close = 1
			density = 1
			pass_gas = 0
	else
		usr << "Дверь обeсточена"

/obj/machinery/door/airlock/proc/open()
	icon_state = "door_open"
	close = 0
	density = 0
	opacity = 0
	pass_gas = 1

/obj/machinery/door/airlock/proc/close()
	icon_state = "door_close"
	close = 1
	density = 1
	opacity = 1
	pass_gas = 0
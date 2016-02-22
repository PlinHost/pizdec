/obj/machinery/light
	var/on_

/wave/light
	icon = 'icons/effects/lum2.dmi'
	layer = 20

/turf/simulated/floor/proc/check_my_light()
	for(var/wave/light/L in loc)
		if(L.force < 1)
			L.icon_state = "7"

		if(L.force > 0)
			L.icon_state = "6"

		if(L.force > 1)
			L.icon_state = "5"

		if(L.force > 2)
			L.icon_state = "4"

		if(L.force > 3)
			L.icon_state = "3"

		if(L.force > 4)
			L.icon_state = "2"

		if(L.force > 5)
			L.icon_state = "1"

		if(L.force > 6)
			L.icon_state = "0"

/obj/machinery/light/check()
	if(on != 1)
		del_light_wave()
		on_ = 0
	else
		if(on_ == 0)
			light_wave(64,8)
			on_ = 1
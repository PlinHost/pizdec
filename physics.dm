/*
	These are simple defaults for your project.
 */
#define DEBUG 1

world
	fps = 25		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default

	view = 6		// show up to 6 tiles outward from center (13x13 view)
	hub = "S_Sting.Physics"	//Кей.Название, реально похуй что сюда писать


// Make objects move 32 pixels per tick when walking

mob
	step_size = 32

obj
	step_size = 32

atom/proc/process()
	spawn while(1)
		sleep(0.001)

world
	mob = /mob/human
	turf = /turf/space


	New() //при создании мира мы
		new /datum/GAS_controller() //создаем контроллер атмоса
		new /datum/power_master() //создаем контроллер энергии
		sleep(1)
		sd_SetDarkIcon('icons/effects/SD_lum.dmi',11) //задаем количество теней
		world << "\blue <b>Инициализаци&#255;, подождите...</b>"
		sleep(5)
		new /datum/Kate() //создаем Кейт
		new /datum/POWERMASTER() //создаем (отдельный) контроллер для проводки
		name = "Physics Simulator 3000"

/area
	icon = 'icons/other/decoration.dmi'
	icon_state = "area"
	mouse_opacity = 0

/mob
	icon = 'icons/other/decoration.dmi'
	icon_state = "mob"

/obj/decor
	icon = 'icons/other/decoration.dmi'
	icon_state = "decor"

/obj/electro
	icon = 'icons/other/decoration.dmi'
	icon_state = "electro"

/obj/effect
	icon = 'icons/other/decoration.dmi'
	icon_state = "effect"

/obj/machinery
	icon = 'icons/other/decoration.dmi'
	icon_state = "machinery"

/obj
	icon = 'icons/other/decoration.dmi'
	icon_state = "obj"
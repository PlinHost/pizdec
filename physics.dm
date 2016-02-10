/*
	These are simple defaults for your project.
 */
#define DEBUG 1

world
	fps = 25		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default

	view = 6		// show up to 6 tiles outward from center (13x13 view)


// Make objects move 8 pixels per tick when walking

mob
	step_size = 8

obj
	step_size = 8

atom/proc/process()
	spawn while(1)
		sleep(0.001)

world
	mob = /mob/human
	turf = /turf/space

//	proc

		//process_2()
		//	spawn while(1)
		//		sleep(5)
				//name = pick("Dervenbay13","HelloStation","HELL","Dervenus_Mind","ATTENTIONWHORE13","SithStation","JediStation")

	New()
		new /datum/anal_controller()
		new /datum/power_master()
		sleep(1)
		world << "\blue <b>Инициализаци&#255;, подождите...</b>"
		sleep(5)
		new /datum/Kate()
		new /datum/POWERMASTER()
		name = "Physics Simulator 3000"
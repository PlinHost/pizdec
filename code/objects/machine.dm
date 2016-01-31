var/list/global/machines = list()

/obj/machinery
	name = "machinery"
	var/need_voltage = 0
	var/need_amperage = 0
	var/on

/obj/machinery/recharger
	name = "recharger"
	icon = 'icons/shaitan_machine.dmi'
	icon_state = "recharger"
	need_amperage = 35
	on = 0

/obj/machinery/recharger/check()
	if(on == 1)
		icon_state = "recharge_on"
	else
		icon_state = "recharger"


/obj/machinery/light
	name = "light"
	icon = 'icons/light.dmi'
	icon_state = "light"
	luminosity = 0
	layer = 4
	on = 0
	use_power = 1
	resistance = 15
	need_amperage = 5
	var/pam_pam = 0

/obj/machinery/light/act()
	world << "[marker]"

/obj/machinery/New()
	on = 0
	personal_id += 1
	my_id = personal_id
	process()

/obj/machinery/light/New()
	on = 0
	process()

/obj/machinery/light/check()
	if(on == 1)
		luminosity = 5
		if(pam_pam == 0)
			lumina()
			pam_pam = 1
	else
		if(pam_pam == 1)
			luminosity = 0
			dark()
			pam_pam = 0

/obj/machinery/proc/check()

/obj/machinery/process()
	machines += src
	spawn while(1)
		check()
		sleep(4)
		if(use_power == 1)
			if(amperage >= need_amperage && marker == 0)
				on = 1
				amperage = 0
			else
				on = 0

		/*if(use_power == 1)
			for(var/obj/machinery/PIZDA/S in range(5,src))
				if(S.power > 0)
					S.power -= 1

					if(istype(src, /obj/machinery/light) || istype(src, /obj/machinery/door) || istype(src, /obj/machinery/firedoor) || istype(src, /obj/machinery/computer))
						on = 1
				else
					on = 0
				//world << "Банк энергии несет в себе [S.power] энергоединиц"
*/
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

/obj/machinery/computer
	icon = 'icons/computer.dmi'
	icon_state = "computer"
	name = "computer"
	use_power = 1
	on = 1
/*
/obj/machinery/gibber
	icon = 'icons/hydro.dmi'
	icon_state = "gibber"
	name = "HRUM-HRUM MACHINE"

	act_by_item(var/mob/I)

		if(I == /mob/carp)
			usr << "\red HRUM-HRUM "

			new /obj/items/meat(src.loc)

			if(usr.client.hand == 1)
				usr.client.my_rhand_contents = 0
				usr.client.R.overlays.Cut()
			if(usr.client.hand == 0)
				usr.client.my_lhand_contents = 0
				usr.client.L.overlays.Cut()
*/
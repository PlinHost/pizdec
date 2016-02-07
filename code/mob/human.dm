/obj/items/organs
	icon = 'icons/human.dmi'
	var/hit_points = 100
	var/burn_points = 0
	weight = 0

/obj/items/organs/r_leg
	name = "RIGHT LEG"
	white
		icon_state = "human_leg_r"
	black
		icon_state = "human_leg_r_black"

/obj/items/organs/l_leg
	name = "LEFT LEG"
	white
		icon_state = "human_leg_l"

	black
		icon_state = "human_leg_l_black"

/obj/items/organs/l_arm
	name = "LEFT ARM"
	white
		icon_state = "human_arm_l"

	black
		icon_state = "human_arm_l_black"

/obj/items/organs/r_arm
	name = "RIGHT ARM"
	white
		icon_state = "human_arm_r"

	black
		icon_state = "human_arm_r_black"

/obj/items/organs/chest
	name = "CHEST"
	white
		icon_state = "human_chest"

		fem
			icon_state = "human_chest_fem"

	black
		icon_state = "human_chest_black"

		fem
			icon_state = "human_chest_black_f"

/obj/items/organs/head
	name = "HEAD"
	white
		icon_state = "human_head"

	black
		icon_state = "human_head_black"

/mob
	var/list/obj/items/organs/organs = list()

/mob/proc/white_overlay()
	overlays.Cut()
	organs.Cut()
	overlays += /obj/items/organs/r_leg/white
	overlays += /obj/items/organs/l_leg/white
	overlays += /obj/items/organs/chest/white
	overlays += /obj/items/organs/r_arm/white
	overlays += /obj/items/organs/l_arm/white
	overlays += /obj/items/organs/head/white


	var/obj/items/organs/r_leg/white/R_LEG = new()
	var/obj/items/organs/l_leg/white/L_LEG = new()
	var/obj/items/organs/chest/white/CHEST = new()
	var/obj/items/organs/r_arm/white/R_ARM = new()
	var/obj/items/organs/l_arm/white/L_ARM = new()
	var/obj/items/organs/head/white/HEAD = new()

	organs += R_LEG
	organs += L_LEG
	organs += CHEST
	organs += R_ARM
	organs += L_ARM
	organs += HEAD

	var/obj/items/organs/r_leg/R_LEG_CONTENTS
	R_LEG_CONTENTS = new()
	R_LEG_CONTENTS.Move(src)

	var/obj/items/organs/l_leg/L_LEG_CONTENTS
	L_LEG_CONTENTS = new()
	L_LEG_CONTENTS.Move(src)

	var/obj/items/organs/r_arm/R_ARM_CONTENTS
	R_ARM_CONTENTS = new()
	R_ARM_CONTENTS.Move(src)

	var/obj/items/organs/l_arm/L_ARM_CONTENTS
	L_ARM_CONTENTS = new()
	L_ARM_CONTENTS.Move(src)

	var/obj/items/organs/chest/CHEST_CONTENTS
	CHEST_CONTENTS = new()
	CHEST_CONTENTS.Move(src)

	var/obj/items/organs/head/HEAD_CONTENTS
	HEAD_CONTENTS = new()
	HEAD_CONTENTS.Move(src)


/mob/proc/white_fem_overlay()
	overlays.Cut()
	organs.Cut()
	overlays += /obj/items/organs/r_leg/white
	overlays += /obj/items/organs/l_leg/white
	overlays += /obj/items/organs/chest/white/fem
	overlays += /obj/items/organs/r_arm/white
	overlays += /obj/items/organs/l_arm/white
	overlays += /obj/items/organs/head/white

	var/obj/items/organs/r_leg/white/R_LEG = new()
	var/obj/items/organs/l_leg/white/L_LEG = new()
	var/obj/items/organs/chest/white/fem/CHEST = new()
	var/obj/items/organs/r_arm/white/R_ARM = new()
	var/obj/items/organs/l_arm/white/L_ARM = new()
	var/obj/items/organs/head/white/HEAD = new()

	organs += R_LEG
	organs += L_LEG
	organs += CHEST
	organs += R_ARM
	organs += L_ARM
	organs += HEAD


/mob/proc/black_overlay()
	overlays.Cut()
	organs.Cut()

	overlays += /obj/items/organs/r_leg/black
	overlays += /obj/items/organs/l_leg/black
	overlays += /obj/items/organs/chest/black
	overlays += /obj/items/organs/r_arm/black
	overlays += /obj/items/organs/l_arm/black
	overlays += /obj/items/organs/head/black

	var/obj/items/organs/r_leg/black/R_LEG = new()
	var/obj/items/organs/l_leg/black/L_LEG = new()
	var/obj/items/organs/chest/black/CHEST = new()
	var/obj/items/organs/r_arm/black/R_ARM = new()
	var/obj/items/organs/l_arm/black/L_ARM = new()
	var/obj/items/organs/head/black/HEAD = new()

	organs += R_LEG
	organs += L_LEG
	organs += CHEST
	organs += R_ARM
	organs += L_ARM
	organs += HEAD

/mob/proc/black_fem_overlay()
	overlays.Cut()
	organs.Cut()

	overlays += /obj/items/organs/r_leg/black
	overlays += /obj/items/organs/l_leg/black
	overlays += /obj/items/organs/chest/black/fem
	overlays += /obj/items/organs/r_arm/black
	overlays += /obj/items/organs/l_arm/black
	overlays += /obj/items/organs/head/black

	var/obj/items/organs/r_leg/black/R_LEG = new()
	var/obj/items/organs/l_leg/black/L_LEG = new()
	var/obj/items/organs/chest/black/fem/CHEST = new()
	var/obj/items/organs/r_arm/black/R_ARM = new()
	var/obj/items/organs/l_arm/black/L_ARM = new()
	var/obj/items/organs/head/black/HEAD = new()

	organs += R_LEG
	organs += L_LEG
	organs += CHEST
	organs += R_ARM
	organs += L_ARM
	organs += HEAD

var/html = {"
<html>
<head><title>Начальные настройки</title></head>
<body>
Выбери пол:
<br>
<a href=?male>Мужчина</a>
<a href=?female>Женщина</a>
<br>
Выбери расу:
<br>
<a href=?niga>Негроид</a>
<a href=?white>Европеоид</a>
<a href=?mongol>Монголоид</a>
<br>
Выбери роль:
<br>
<a href=?lesorub>Ученый</a>
<a href=?hunt>Инженер</a>
<a href=?ass>Ассистент</a>
<a href=?ultra>Авантюрист</a>

<br>
Левша или правша?
<br>
<a href=?right>Правша</a>
<a href=?left>Левша</a>

</body>
</html>
"}

client
	var
		mymcolor = "white"
		mygender = 1
		var/list/obj/my_pull = list()

/mob/human
	name = "human"
	icon = 'icons/human.dmi'
	icon_state = "human"
	layer = 6
	weight = 70
	var/sound/S
	var/lying = 0
	var/stop = 0
	var/state_of_health = "normal"
	var/stamina = 100
	var/temperature = 36
	var/my_oxygen = "NO ALERT"
	var/oxygen = 100
	var/pulse = 70
	var/min_pulse = 60
	var/max_pulse = 80
	var/signal = 0
	var/a_hole_in_the_ceiling = 0
	var/list/datum/reagents/chemical = list()
	var/reagents_max = 100
	var/cur_val = 0
	var/no_way_bro = 0
	var/mcolor = 1
	var/my_gend = 1
	var/oldloc
	var/my_weight

	Stat()
		statpanel("State")
		stat("appearance - ", src)
		stat("state of health - ", state_of_health)
		stat("stamina(percents) - ", stamina)
		stat("temperature(C°) - ", temperature)
		stat("oxygen(ALERT) - ", my_oxygen)
		stat("pulse - ", pulse)
		stat("chem - ", cur_val)
		statpanel("Organs")
		for(var/obj/items/organs/O in usr)
			stat("\[[O.name]\]", "soundness - [O.hit_points]; percent burns - [O.burn_points]")

		statpanel("Description")
		var/turf/T = locate(usr.x,usr.y, usr.z + 1)
		if(istype(T,/turf/simulated/floor/whore))
			a_hole_in_the_ceiling = 1
		else
			a_hole_in_the_ceiling = 0
		stat("A hole in the ceiling ", a_hole_in_the_ceiling)

	//shot()
	//	world << "[src.name] подбит"

	verb/emerge()
		var/turf/T = locate(usr.x,usr.y, usr.z + 1)
		var/turf/TU = src.loc
		if(istype(T,/turf/simulated/floor/whore) && TU.water > 15)
			usr.z += 1
		else
			usr << "\red Здесь нельз&#255; вынырнуть!"

	proc/lying()
		lying = 1

		for(var/obj/items/organs/O in organs)
			overlays -= O
			O.icon = 'icons/human_lying.dmi'
			overlays += O

		if(usr.client.head_items.len > 0)
			if(istype(usr.client.head_items[1],/obj/items/body/head/HELMET))
				var/obj/items/body/head/HELMET/H = new()
				overlays -= H
				H.icon = 'icons/clothes_lying.dmi'
				overlays += H

		if(usr.client.head_items.len > 0)

			if(istype(usr.client.head_items[1],/obj/items/clothes/head/HELMET_SYN))
				var/obj/items/body/head/HELMET_SYN/HS = new()
				overlays -= HS
				HS.icon = 'icons/clothes_lying.dmi'
				overlays += HS

		if(usr.client.foot_items.len > 0)
			var/k = usr.client.foot_items[1]
			var/obj/items/body/shoes/BLACK/B = new()
			if(istype(k,/obj/items/clothes/shoes/BLACK))
				overlays -= B
				B.icon = 'icons/clothes_lying.dmi'
				overlays += B

		if(usr.client.foot_items.len > 0)
			if(istype(usr.client.foot_items[1],/obj/items/clothes/shoes/COOL))
				var/obj/items/body/shoes/COOL/CO = new()
				overlays -= CO
				CO.icon = 'icons/clothes_lying.dmi'
				overlays += CO

		if(usr.client.uniform_items.len > 0)
			var/obj/items/clothes/C = usr.client.uniform_items[1]
			overlays -= C
			C.icon = 'icons/clothes_lying.dmi'
			overlays += C

		if(usr.client.clothes_items.len > 0)
			var/obj/items/clothes/C = usr.client.clothes_items[1]
			overlays -= usr.client.clothes_items[1]
			C.icon = 'icons/clothes_lying.dmi'
			overlays += C

	proc/unlying()
		lying = 0

		for(var/obj/items/organs/O in organs)
			overlays -= O
			O.icon = 'icons/human.dmi'
			overlays += O

		if(usr.client.head_items.len > 0)
			if(istype(usr.client.head_items[1],/obj/items/body/head/HELMET))
				var/obj/items/body/head/HELMET/H = new()
				overlays -= H
				H.icon = 'icons/clothes.dmi'
				overlays += H

		if(usr.client.head_items.len > 0)

			if(istype(usr.client.head_items[1],/obj/items/clothes/head/HELMET_SYN))
				var/obj/items/body/head/HELMET_SYN/HS = new()
				overlays -= HS
				HS.icon = 'icons/clothes.dmi'
				overlays += HS

		if(usr.client.foot_items.len > 0)
			var/k = usr.client.foot_items[1]
			var/obj/items/body/shoes/BLACK/B = new()
			if(istype(k,/obj/items/clothes/shoes/BLACK))
				overlays -= B
				B.icon = 'icons/clothes.dmi'
				overlays += B

		if(usr.client.foot_items.len > 0)
			if(istype(usr.client.foot_items[1],/obj/items/clothes/shoes/COOL))
				var/obj/items/body/shoes/COOL/CO = new()
				overlays -= CO
				CO.icon = 'icons/clothes.dmi'
				overlays += CO

		if(usr.client.uniform_items.len > 0)
			var/obj/items/clothes/C = usr.client.uniform_items[1]
			overlays -= C
			C.icon = 'icons/clothes.dmi'
			overlays += C

		if(usr.client.clothes_items.len > 0)
			var/obj/items/clothes/C = usr.client.clothes_items[1]
			overlays -= usr.client.clothes_items[1]
			C.icon = 'icons/clothes.dmi'
			overlays += C

/mob/human/process() //как Life(), епта
	S = new()
	S.file = 'sound/lobby.mid'
	usr << S
	spawn while(1)
		//if(src == usr)
		if(usr.client.ouch == 0)
			S.volume = 0
			usr << S
			usr.client.D.iam = src
			if(usr.client.U.overlays.len == 0)
				usr.client.uniform_items.Cut()

			if(usr.client.C.overlays.len == 0)
				usr.client.clothes_items.Cut()

			if(usr.client.H.overlays.len == 0)
				usr.client.head_items.Cut()

			if(usr.client.F.overlays.len == 0)
				usr.client.foot_items.Cut()

		//analyaze_me()

		var/turf/T = locate(x,y,z)
		sleep(0.5)

		organ_damage_calculate()
		for(var/obj/O in usr.contents)
			usr.client.my_weight += O.weight

		if(usr.client.my_weight > usr.client.can_get)
			stamina -= 2

		usr.client.my_weight = 0

		if(usr.client.mygender == 1)
			icon_state = "human"
			//var/lleg = 0
			//var/rleg = 0
			//var/rarm = 0
			//var/larm = 0
			//var/chest = 0
			//var/head = 0

		if(usr.client.time_to_change == 1)
			if(usr.client.mygender == 0 && usr.client.mymcolor != "chocolate")
				white_fem_overlay()
				usr.client.time_to_change = 0
				mcolor = 1
				my_gend = 0

			if(usr.client.mygender == 1 && usr.client.mymcolor != "chocolate")
				white_overlay()
				usr.client.time_to_change = 0
				mcolor = 1
				my_gend = 1

			if(usr.client.mygender == 1 && usr.client.mymcolor == "chocolate")
				black_overlay()
				usr.client.time_to_change = 0
				mcolor = 0
				my_gend = 1

			if(usr.client.mygender == 0 && usr.client.mymcolor == "chocolate")
				black_fem_overlay()
				usr.client.time_to_change = 0
				mcolor = 0
				my_gend = 0

		if(usr.client.mygender == 0)
			icon_state = "human_f"

		if(usr.client.mymcolor == "chocolate" && usr.client.mygender == 0)
			icon_state = "human_black_f"

		if(usr.client.mymcolor == "chocolate" && usr.client.mygender == 1)
			icon_state = "human_black"
		if(usr.client.r_int == "walk")
			if(stamina < 100)
				stamina += 1
		if(signal == 1)
			return
		pulse = rand(min_pulse, max_pulse)

		//if(T.chemical.len > 0)
		//	my_chem()

		//for(var/turf/simulated/floor/F in range(1,usr))
		//	F.my_LIGHT_state = 1
		//for(var/turf/TURF in range(1,src))
		//	TURF.REMOVE_LIGHT()
		/*
		if(usr.client.cloth_epta == 0)
			if(T.oxygen < 300 || T.plasma > 100 || T.nitrogen > 100 || T.temperature > 100 || T.temperature < -20)
				usr << "Тут ты это, ну умер."
				icon_state = "dead"
				return
		*/
		checking_turf()
		checking_my_system()
	//	on_turf_react()
		for(var/turf/F in range(1,src))
			if(F.density == 0)
				if(T.cur_gas - F.cur_gas > 121) //при разнице в 121 газоединицу тащит за собой
					Move(locate(F.x, F.y, F.z))
		/*if(src == usr)
			if(usr.client.ouch == 0)
				if(usr.client.D.time_to_drop == 1)
					usr.client.D.time_to_drop = 0
					if(usr.client.hand == 1)
						var/obj/items/I = usr.client.my_rhand_contents
						for(I in src)
							I.Move(src.loc)

						usr.client.my_rhand_contents = 0
						usr.client.R.overlays.Cut()
					if(usr.client.hand == 0)
						var/obj/items/I = usr.client.my_lhand_contents
						for(I in src)
							I.Move(src.loc)
						usr.client.my_lhand_contents = 0
						usr.client.L.overlays.Cut()
*/
mob/human/Move()
	if(signal != 1)
		..()
		for(var/obj/A in range(2,usr))
			if(A.pull == 1 && A.puller == usr)
				A.Move(oldloc)

		if(usr.client.r_int == "walk")
			step_size = 32
			see_in_night()
		else
			var/turf/T = src.loc
			if(!(istype(T, /turf/simulated/floor/downbitch)) || !(istype(T, /turf/simulated/floor/upbitch)))
				step_size = pick(64, 32)
				if(stamina > 0)
					stamina -= 1
		oldloc = usr.loc
		return

mob/human/proc/hello_bitch()
	usr.client.ouch = 1
	return ..()

/mob/human/New()
	white_overlay()
	if(src == usr)
		sleep(0.1)
		usr << "<h1> Мы рады вам(нет)!</h1>"
		usr << browse(html,"window=setup")
		no_way_bro = 1
		hello_bitch()
		usr.loc = landmarks[rand(1,landmarks.len)]
		//light_fom_my_heart_babe()

		process()

/mob/human/act()
	if(usr.client.act == "harm")
		if(usr.client.zone == "chest")
			for(var/obj/items/organs/chest/O in src)
				usr << "\red Вы бьете [src] кулаком по телу!"
				src << "\red [usr] ударил вас кулаком по телу!"
				O.hit_points -= 1

		if(usr.client.zone == "head")
			for(var/obj/items/organs/head/O in src)
				usr << "\red Вы бьете [src] кулаком по голове!"
				src << "\red [usr] ударил вас кулаком по голове!"
				O.hit_points -= 1

		if(usr.client.zone == "r_leg")
			for(var/obj/items/organs/r_leg/O in src)
				usr << "\red Вы бьете [src] кулаком по правой ноге!"
				src << "\red [usr] ударил вас кулаком по правой ноге!"
				O.hit_points -= 1

		if(usr.client.zone == "l_leg")
			for(var/obj/items/organs/l_leg/O in src)
				usr << "\red Вы бьете [src] кулаком по левой ноге!"
				src << "\red [usr] ударил вас кулаком по левой ноге!"
				O.hit_points -= 1

		if(usr.client.zone == "l_arm")
			for(var/obj/items/organs/l_leg/O in src)
				usr << "\red Вы бьете [src] кулаком по левой руке!"
				src << "\red [usr] ударил вас кулаком по левой руке!"
				O.hit_points -= 1

		if(usr.client.zone == "r_arm")
			for(var/obj/items/organs/l_leg/O in src)
				usr << "\red Вы бьете [src] кулаком по правой руке!"
				src << "\red [usr] ударил вас кулаком по правой руке!"
				O.hit_points -= 1

		if(usr.client.zone == "groin")
			for(var/obj/items/organs/l_leg/O in src)
				usr << "\red Вы бьете [src] кулаком в область паха!"
				src << "\red [usr] ударил вас кулаком в область паха!"
				O.hit_points -= 1
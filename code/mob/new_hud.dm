#define RHAND 1
#define LHAND 0

obj
	screen
		layer = 25
		icon = 'icons/screen.dmi'
		icon_state = "screen"
		var/active = 0
		var/time_to_swap = 0
		var/time_to_drop = 0
		var/time_to_wear = 0
		var/time_to_intent = 0
		var/run_time_to_intent = 0

		humanhead
			icon_state = "head"
			icon = 'big_screen.dmi'
			layer = 25
			New(client/C)
				screen_loc="13,10"
				C.screen+=src

			act()
				usr.client.zone = "head"
				usr.client.HH.icon_state = "head_active"
				usr.client.HG.icon_state = "groin"
				usr.client.HC.icon_state = "chest"
				usr.client.HRL.icon_state = "right_leg"
				usr.client.HLL.icon_state = "left_leg"
				usr.client.HRA.icon_state = "right_arm"
				usr.client.HLA.icon_state = "left_arm"

		humanchest
			icon_state = "chest"
			icon = 'big_screen.dmi'
			layer = 25
			New(client/C)
				screen_loc="13,10"
				C.screen+=src

			act()
				usr.client.zone = "chest"
				usr.client.HH.icon_state = "head"
				usr.client.HG.icon_state = "groin"
				usr.client.HC.icon_state = "chest_active"
				usr.client.HRL.icon_state = "right_leg"
				usr.client.HLL.icon_state = "left_leg"
				usr.client.HRA.icon_state = "right_arm"
				usr.client.HLA.icon_state = "left_arm"

		humanright_leg
			icon_state = "right_leg"
			icon = 'big_screen.dmi'
			layer = 25
			New(client/C)
				screen_loc="13,10"
				C.screen+=src

			act()
				usr.client.zone = "chest"
				usr.client.HH.icon_state = "head"
				usr.client.HG.icon_state = "groin"
				usr.client.HC.icon_state = "chest"
				usr.client.HRL.icon_state = "right_leg_active"
				usr.client.HLL.icon_state = "left_leg"
				usr.client.HRA.icon_state = "right_arm"
				usr.client.HLA.icon_state = "left_arm"

		humanleft_leg
			icon_state = "left_leg"
			icon = 'big_screen.dmi'
			layer = 25
			New(client/C)
				screen_loc="13,10"
				C.screen+=src

			act()
				usr.client.zone = "l_leg"
				usr.client.HH.icon_state = "head"
				usr.client.HG.icon_state = "groin"
				usr.client.HC.icon_state = "chest"
				usr.client.HRL.icon_state = "right_leg"
				usr.client.HLL.icon_state = "left_leg_active"
				usr.client.HRA.icon_state = "right_arm"
				usr.client.HLA.icon_state = "left_arm"

		humanleft_arm
			icon_state = "left_arm"
			icon = 'big_screen.dmi'
			layer = 25
			New(client/C)
				screen_loc="13,10"
				C.screen+=src

			act()
				usr.client.zone = "l_arm"
				usr.client.HH.icon_state = "head"
				usr.client.HG.icon_state = "groin"
				usr.client.HC.icon_state = "chest"
				usr.client.HRL.icon_state = "right_leg"
				usr.client.HLL.icon_state = "left_leg_active"
				usr.client.HRA.icon_state = "right_arm"
				usr.client.HLA.icon_state = "left_arm"


		humanright_arm
			icon_state = "right_arm"
			icon = 'big_screen.dmi'
			layer = 25
			New(client/C)
				screen_loc="13,10"
				C.screen+=src

			act()
				usr.client.zone = "r_arm"
				usr.client.HH.icon_state = "head"
				usr.client.HG.icon_state = "groin"
				usr.client.HC.icon_state = "chest"
				usr.client.HRL.icon_state = "right_leg"
				usr.client.HLL.icon_state = "left_leg"
				usr.client.HRA.icon_state = "right_arm_active"
				usr.client.HLA.icon_state = "left_arm"

		humangroin
			icon_state = "groin"
			icon = 'big_screen.dmi'
			layer = 25
			New(client/C)
				screen_loc="13,10"
				C.screen+=src

			act()
				usr.client.zone = "groin"
				usr.client.HH.icon_state = "head"
				usr.client.HG.icon_state = "groin_active"
				usr.client.HC.icon_state = "chest"
				usr.client.HRL.icon_state = "right_leg"
				usr.client.HLL.icon_state = "left_leg"
				usr.client.HRA.icon_state = "right_arm"
				usr.client.HLA.icon_state = "left_arm"
		shit
			icon_state = "shit"
			layer = 23
			New(client/C)
				screen_loc="1,-1 to 13,-1"
				C.screen+=src

		shit2
			icon_state = "shit2"
			layer = 23
			New(client/C)
				screen_loc="13,-1 to 13,10"
				C.screen+=src

		shit3
			icon_state = "shit3"
			layer = 27
			New(client/C)
				screen_loc="13,-1"
				C.screen+=src

		lhand

			icon_state = "lhand_active"
			active = 1
			New(client/C)
				screen_loc="7,-1"
				C.screen+=src
			var/client/C

			Click()
				if(usr.client.lhand_items.len > 0)
					for(var/obj/O in usr.contents)
						if(istype(O,usr.client.lhand_items[1]))
							O.act_self(O)
				else
					if(C.my_hand_active == "left")
						C.my_hand_active = "right"
						C.change_hands()
						return

					if(C.my_hand_active == "right")
						C.my_hand_active = "left"
						C.change_hands()
						return

		rhand
			icon_state = "rhand"
			New(client/C)
				screen_loc="8,-1"
				C.screen+=src
			var/client/C

			Click()
				if(usr.client.rhand_items.len > 0)
					for(var/obj/O in usr.contents)
						if(istype(O,usr.client.lhand_items[1]))
							O.act_self(O)
				else
					if(C.my_hand_active == "left")
						C.my_hand_active = "right"
						C.change_hands()
						return

					if(C.my_hand_active == "right")
						C.my_hand_active = "left"
						C.change_hands()
						return

		drop
			icon_state = "drop"
			var/mob/human/iam
			New(client/C)
				screen_loc="9,-1"
				C.screen+=src

			Click()
				iam.drop()


		uniform
			icon_state = "uniform"
			New(client/C)
				screen_loc="4,-1"
				C.screen+=src
			var/client/C

			act_by_item(var/obj/item/clothing/uniform/I)
				if(usr.client.uniform_items.len == 0)
					if(istype(I,/obj/item/clothing/uniform))

						I.wear(usr)
						usr.client.uniform_items += I

						var/cloth = I.type
						cloth = new cloth()

						usr.client.U.overlays += cloth

						if(usr.client.my_hand_active == "right")
							usr.client.rhand_items -= I
							usr.client.R.overlays.Cut()


						if(usr.client.my_hand_active == "left")
							usr.client.lhand_items -= I
							usr.client.L.overlays.Cut()

						return

			proc/undress_my_uniform_baby()
				usr.client.U.overlays.Cut()
				usr.overlays -= usr.client.uniform_items[1]

			proc/add_to_rhand()


				usr.client.R.overlays += usr.client.uniform_items[1]
				usr.client.rhand_items += usr.client.uniform_items[1]

			proc/add_to_lhand()
				usr.client.L.overlays += usr.client.uniform_items[1]
				usr.client.lhand_items += usr.client.uniform_items[1]

			act()
				if(istype(usr,/mob/human))
					var/mob/human/H = usr
					if(H.lying == 0)
						undress_my_uniform_baby()
						if(usr.client.my_hand_active == "left")
							add_to_lhand()


						if(usr.client.my_hand_active == "right")
							add_to_rhand()


		mask
			icon_state = "mask"
			New(client/C)
				screen_loc="3,-1"
				C.screen+=src

		ear
			icon_state = "ear"
			New(client/C)
				screen_loc="2,-1"
				C.screen+=src

		gloves
			icon_state = "gloves"
			New(client/C)
				screen_loc="1,-1"
				C.screen+=src

		foot
			icon_state = "foot"
			New(client/C)
				screen_loc="1,0"
				C.screen+=src

			act_by_item(var/obj/item/clothing/I)
				if(usr.client.foot_items.len == 0)
					if(istype(I,/obj/item/clothing/shoes))

						I.wear(usr)

						var/cloth = I.type
						cloth = new cloth()

						usr.client.foot_items += I
						usr.client.F.overlays += cloth

						if(usr.client.my_hand_active == "right")
							usr.client.rhand_items -= I
							usr.client.R.overlays.Cut()


						if(usr.client.my_hand_active == "left")
							usr.client.lhand_items -= I
							usr.client.L.overlays.Cut()

						return

			proc/undress_my_uniform_baby()
				usr.client.F.overlays.Cut()
				if(istype(usr.client.foot_items[1], /obj/item/clothing/shoes/BLACK))
					var/obj/item/body/shoes/BLACK/H = new
					usr.overlays -= H

				if(istype(usr.client.foot_items[1], /obj/item/clothing/shoes/COOL))
					var/obj/item/body/shoes/COOL/H = new
					usr.overlays -= H

			proc/add_to_rhand()


				usr.client.R.overlays += usr.client.foot_items[1]
				usr.client.rhand_items += usr.client.foot_items[1]

			proc/add_to_lhand()
				usr.client.L.overlays += usr.client.foot_items[1]
				usr.client.lhand_items += usr.client.foot_items[1]

			act()
				if(istype(usr,/mob/human))
					var/mob/human/H = usr
					if(H.lying == 0)
						undress_my_uniform_baby()
						if(usr.client.my_hand_active == "left")
							add_to_lhand()


						if(usr.client.my_hand_active == "right")
							add_to_rhand()

		head
			icon_state = "head"
			New(client/C)
				screen_loc="2,0"
				C.screen+=src


			act_by_item(var/obj/item/clothing/I)
				if(usr.client.head_items.len == 0)
					if(istype(I,/obj/item/clothing/head))

						I.wear(usr)
						var/cloth = I.type
						cloth = new cloth()
						usr.client.head_items += I
						usr.client.H.overlays += cloth

						if(usr.client.my_hand_active == "right")
							usr.client.rhand_items -= I
							usr.client.R.overlays.Cut()


						if(usr.client.my_hand_active == "left")
							usr.client.lhand_items -= I
							usr.client.L.overlays.Cut()

						return

			proc/undress_my_uniform_baby()
				usr.client.H.overlays.Cut()
				if(istype(usr.client.head_items[1], /obj/item/clothing/head/HELMET))
					var/obj/item/body/head/HELMET/H = new
					usr.overlays -= H

				if(istype(usr.client.head_items[1], /obj/item/clothing/head/HELMET_SYN))
					var/obj/item/body/head/HELMET_SYN/H = new
					usr.overlays -= H

			proc/add_to_rhand()


				usr.client.R.overlays += usr.client.head_items[1]
				usr.client.rhand_items += usr.client.head_items[1]

			proc/add_to_lhand()
				usr.client.L.overlays += usr.client.head_items[1]
				usr.client.lhand_items += usr.client.head_items[1]

			act()
				if(istype(usr,/mob/human))
					var/mob/human/H = usr
					if(H.lying == 0)
						undress_my_uniform_baby()
						if(usr.client.my_hand_active == "left")
							add_to_lhand()


						if(usr.client.my_hand_active == "right")
							add_to_rhand()

		clothing
			icon_state = "clothes"
			New(client/C)
				screen_loc="5,-1"
				C.screen+=src

			act_by_item(var/obj/item/clothing/I)
				if(usr.client.clothing_items.len == 0)
					if(istype(I,/obj/item/clothing/suit))

						I.wear(usr)

						var/cloth = I.type
						cloth = new cloth()

						usr.client.clothing_items += I
						usr.client.C.overlays += cloth

						if(usr.client.my_hand_active == "right")
							usr.client.rhand_items -= I
							usr.client.R.overlays.Cut()


						if(usr.client.my_hand_active == "left")
							usr.client.lhand_items -= I
							usr.client.L.overlays.Cut()

						return

			proc/undress_my_uniform_baby()
				usr.client.C.overlays.Cut()
				usr.overlays -= usr.client.clothing_items[1]

			proc/add_to_rhand()


				usr.client.R.overlays += usr.client.clothing_items[1]
				usr.client.rhand_items += usr.client.clothing_items[1]

			proc/add_to_lhand()
				usr.client.L.overlays += usr.client.clothing_items[1]
				usr.client.lhand_items += usr.client.clothing_items[1]

			act()
				if(istype(usr,/mob/human))
					var/mob/human/H = usr
					if(H.lying == 0)
						undress_my_uniform_baby()
						if(usr.client.my_hand_active == "left")
							add_to_lhand()


						if(usr.client.my_hand_active == "right")
							add_to_rhand()
		act_intent
			icon_state = "help"
			New(client/C)
				screen_loc="11,-1"
				C.screen+=src

			act()
				if(usr.client.act == "help")
					usr.client.act = "grab"
					usr.client.ACT.icon_state = "grab"
					return

				if(usr.client.act == "harm")
					usr.client.act = "help"
					usr.client.ACT.icon_state = "help"
					return

				if(usr.client.act == "grab")
					usr.client.act = "harm"
					usr.client.ACT.icon_state = "harm"
					return

		run_intent
			icon_state = "walk"
			New(client/C)
				screen_loc="12,-1"
				C.screen+=src

			act()
				if(usr.client.r_int == "walk")
					usr.client.r_int = "run"
					usr.client.RUN.icon_state = "run"
					return

				if(usr.client.r_int == "run")
					usr.client.r_int = "walk"
					usr.client.RUN.icon_state = "walk"
					return


		proc/check_act_hand()
			if(active == 1)
				icon_state = "hand_act"
			else
				icon_state = "hand"


client

	var/obj/screen/humanhead/HH
	var/obj/screen/humanchest/HC
	var/obj/screen/humangroin/HG
	var/obj/screen/humanright_leg/HRL
	var/obj/screen/humanleft_leg/HLL
	var/obj/screen/humanright_arm/HRA
	var/obj/screen/humanleft_arm/HLA
	var/my_pull_eba = 0
	var/can_get = 35
	var/my_weight = 0

	var/obj/screen/lhand/L
	var/obj/screen/rhand/R
	var/obj/screen/drop/D

	var/obj/screen/clothing/C
	var/obj/screen/uniform/U
	var/obj/screen/head/H
	var/obj/screen/gloves/G
	var/obj/screen/foot/F
	var/obj/screen/mask/M
	var/obj/screen/ear/E

	var/obj/screen/shit/S
	var/obj/screen/shit2/S2
	var/obj/screen/shit3/S3

	var/obj/screen/act_intent/ACT
	var/obj/screen/run_intent/RUN
	var/ouch = 0

	var/hand = RHAND
	var/act = "help"
	var/r_int = "walk"

	var/my_hand_active = "left"
	var/list/obj/item/rhand_items = list()
	var/list/obj/item/lhand_items = list()
	var/list/obj/item/uniform_items = list()
	var/list/obj/item/clothing_items = list()
	var/list/obj/item/head_items = list()
	var/list/obj/item/foot_items = list()

	var/cloth_epta = 0
	var/helmet_epta = 0
	var/shoes_epta = 0
	var/uniform_epta = 0
	var/time_to_change = 0

	var/zone = "chest"

	proc/create_hud()
		HC = new(src)
		HH = new(src)
		HG = new(src)
		HRL = new(src)
		HLL = new(src)
		HRA = new(src)
		HLA = new(src)

		L = new(src)
		L.C = src

		R = new(src)
		R.C = src

		D = new(src)

		C = new(src)
		H = new(src)
		G = new(src)
		F = new(src)
		M = new(src)
		E = new(src)
		U = new(src)
		U.C = src

		S = new(src)
		S2 = new(src)
		S3 = new(src)

		ACT = new(src)
		RUN = new(src)

	proc/draw_item_hand(var/hand, var/obj/item/I)
		if(hand == "left")
			L.overlays += I

		if(hand == "right")
			R.overlays += I

	proc/change_hands()
		if(R.icon_state == "rhand_active")
			R.icon_state = "rhand"
			L.icon_state = "lhand_active"
			return

		if(L.icon_state == "lhand_active")
			L.icon_state = "lhand"
			R.icon_state = "rhand_active"
			return
/datum/reagents
	var
		amount
		mycolor
		state
		name

	blood
		name = "blood"
		state = "liquid"
		mycolor = "red"

	Fe
		name = "Fe"
		state = "liquid"
		mycolor = "red"

	Ag
		name = "Ag"
		state = "liquid"
		mycolor = "red"

	Cu
		name = "Cu"
		state = "liquid"
		mycolor = "red"

	Au
		name = "Au"
		state = "liquid"
		mycolor = "red"

	H
		name = "H"
		state = "liquid"
		mycolor = "red"

	K
		name = "K"
		state = "liquid"
		mycolor = "red"

	Rb
		name = "Rb"
		state = "liquid"
		mycolor = "red"

	Po
		name = "Po"
		state = "liquid"
		mycolor = "red"

	O
		name = "O"
		state = "liquid"
		mycolor = "red"

	Pb
		name = "Pb"
		state = "liquid"
		mycolor = "red"

	N
		name = "N"
		state = "liquid"
		mycolor = "red"

	S
		name = "S"
		state = "liquid"
		mycolor = "red"

	Cl
		name = "Cl"
		state = "liquid"
		mycolor = "red"

	AntiTox
		name = "Anti-toxin"
		state = "liquid"
		mycolor = "red"


	proc/check_my_reagent()
		if(amount == 0)
			del(src)

/obj/item/container
	name = "container"
	icon_state = "container"
	icon = 'icons/chem.dmi'
	var/list/datum/reagents/chemical = list()

	var/cur_val = 0
	var/max = 100

/obj/item/container/proc/check_react(var/chem1, var/chem2)
	var/mycheck1 = 0

	for(var/datum/reagents/R in chemical)
		if(R.name == chem1)
			mycheck1 += 1

		if(R.name == chem2)
			mycheck1 += 1

	if(mycheck1 == 2)
		react(chem1, chem2)

	if(mycheck1 != 2)
		return 0

proc/react(var/chem1, var/chem2)
	world << "PISH-PISH"


/obj/item/food

/obj/item/food/pill
	icon_state = "pill"
	icon = 'icons/chem.dmi'
	var/cur_val = 0
	var/max = 100
	var/list/datum/reagents/chemical = list()

/obj/item/food/pill/proc/my_val()
	cur_val = 0
	for(var/i = 1, i <= chemical.len, i++)
		var/datum/reagents/RG = chemical[i]
		cur_val += RG.amount


/obj/item/container/proc/my_val()
	cur_val = 0
	for(var/i = 1, i <= chemical.len, i++)
		var/datum/reagents/RG = chemical[i]
		cur_val += RG.amount

/turf/simulated/floor/
	var/cur_val = 0

/turf/simulated/floor/proc/my_val()
	cur_val = 0
	for(var/i = 1, i <= chemical.len, i++)
		var/datum/reagents/RG = chemical[i]
		cur_val += RG.amount

/obj/machinery/chem
	icon = 'icons/chem.dmi'
	icon_state = "dispenser"
	density = 1
	var
		list/obj/item/container/cont = list()
		list/datum/reagents/chemical = list()
		cur_val = 0

/obj/machinery/chem/proc/my_val()
	cur_val = 0
	for(var/i = 1, i <= chemical.len, i++)
		var/datum/reagents/RG = chemical[i]
		cur_val += RG.amount

/mob/human/proc/my_val()
	cur_val = 0
	for(var/i = 1, i <= chemical.len, i++)
		var/datum/reagents/RG = chemical[i]
		cur_val += RG.amount

/obj/machinery/chem/chemdispenser/New()
	var/datum/reagents/blood/B = new()

	var/datum/reagents/Fe/FE = new()
	var/datum/reagents/Ag/AG = new()
	var/datum/reagents/Au/AU = new()
	var/datum/reagents/O/OX = new()
	var/datum/reagents/H/HY = new()
	var/datum/reagents/Pb/PB = new()
	var/datum/reagents/Po/PO = new()
	var/datum/reagents/S/SE = new()
	var/datum/reagents/N/NI = new()
	var/datum/reagents/Cl/CL = new()
	var/datum/reagents/Cu/CU = new()
	var/datum/reagents/AntiTox/AT = new()


	B.amount = 1000
	FE.amount = 1000
	AG.amount = 1000
	AU.amount = 1000
	OX.amount = 1000
	HY.amount = 1000
	PB.amount = 1000
	PO.amount = 1000
	SE.amount = 1000
	NI.amount = 1000
	CL.amount = 1000
	CU.amount = 1000
	AT.amount = 1000

	chemical += B
	chemical += FE
	chemical += AG
	chemical += AU
	chemical += OX
	chemical += HY
	chemical += PB
	chemical += PO
	chemical += SE
	chemical += NI
	chemical += CL
	chemical += CU

/obj/machinery/chem/chemdispenser/act_by_item(var/obj/item/container/I)
	if(usr.client.hand == 1)
		usr.client.R.overlays.Cut()
		usr.client.my_rhand_contents = 0
	else
		usr.client.L.overlays.Cut()
		usr.client.my_lhand_contents = 0
	cont.Cut()
	for(I in usr)
		cont += I
		world << "[I.chemical.len]"

/obj/machinery/chem/chemdispenser/act()
	var/my_text
	if(cont.len > 0)
		my_text = {"
		<html>
		<head><title>Химический раздатчик</title></head>
		<body>
		Выберите реагент:

		<br><a href=?blood>Кровь</a>
		<br><a href=?Fe>Железо</a>
		<br><a href=?Ag>Серебро</a>
		<br><a href=?Au>Золото</a>
		<br><a href=?Cu>Медь</a>
		<br><a href=?O>Кислород</a>
		<br><a href=?N>Азот</a>
		<br><a href=?Pb>Свинец</a>
		<br><a href=?K>Калий</a>
		<br><a href=?H>Водород</a>
		<br><a href=?Rb>Рубидий</a>
		<br><a href=?S>Сера</a>
		<br><a href=?Po>Полоний</a>
		<br><a href=?Cl>Хлор</a>

		<br>

		<br><a href=?get_>Получить колбу</a>

		</body>
		</html>
		"}
	else
		my_text = {"
		<html>
		<head><title>Химический раздатчик</title></head>
		<body>

		<h1>Вставьте колбу в раздатчик!</h1>

		</body>
		</html>
		"}

	usr << browse(my_text,"window=my_text")

/obj/machinery/chem/gasification_machine
	icon = 'icons/chem.dmi'
	icon_state = "gasification_machine"

/obj/machinery/chem/solid_machine
	icon = 'icons/chem.dmi'
	icon_state = "solid_machine"

/obj/machinery/chem/solid_machine/act_by_item(var/obj/item/container/I)
	usr << "\blue Сублимаци&#255;..."
	sleep(3)
	var/obj/item/food/pill/P = new()
	if(usr.client.hand == 1)
		usr.client.R.overlays.Cut()
		usr.client.my_rhand_contents = 0
	else
		usr.client.L.overlays.Cut()
		usr.client.my_lhand_contents = 0
	for(I in usr)
		for(var/i = 1, i <= I.chemical.len, i++)
			P.chemical += I.chemical[i]
		P.my_val()
		del(I)
	world << "[P.cur_val]"
	world << "[P.chemical.len]"
	var/obj/item/container/CON = new()
	CON.Move(src.loc)
	P.Move(src.loc)

/obj/machinery/chem/liquid_machine
	icon = 'icons/chem.dmi'
	icon_state = "liquid_machine"

/obj/machinery/chem/liquid_machine/act_by_item(var/obj/item/food/pill/I)
	usr << "\blue Превращение в жидкость..."
	sleep(3)
	var/obj/item/container/P = new()
	if(usr.client.hand == 1)
		usr.client.R.overlays.Cut()
		usr.client.my_rhand_contents = 0
	else
		usr.client.L.overlays.Cut()
		usr.client.my_lhand_contents = 0
	for(I in usr)
		for(var/i = 1, i <= I.chemical.len, i++)
			P.chemical += I.chemical[i]
		P.my_val()
		del(I)
	world << "[P.cur_val]"
	world << "[P.chemical.len]"
	P.Move(src.loc)

/obj/machinery/chem/gasification_machine/act_by_item(var/obj/item/container/I)
	usr << "\blue Газификаци&#255;..."
	sleep(3)
	if(usr.client.hand == 1)
		usr.client.R.overlays.Cut()
		usr.client.my_rhand_contents = 0
	else
		usr.client.L.overlays.Cut()
		usr.client.my_lhand_contents = 0
	for(I in usr)
		for(var/i = 1, i <= I.chemical.len, i++)
			chemical += I.chemical[i]
		my_val()
		del(I)
	var/obj/item/container/CON = new()
	CON.Move(src.loc)
	world << "[cur_val]"
	world << "[chemical.len]"

	var/fuck = 0
	var/atmosnet = 0
	for(var/obj/machinery/atmospherics/pipe/P in range(1, src))
		atmosnet = P.atmosnet
	for(var/obj/machinery/portable_atmospherics/canister/C in world)
		if(C.connected == 1 && C.atmosnet == atmosnet)
			if(C.chemical.len < 1)
				for(var/i = 1, i <= chemical.len, i++)
					C.chemical += chemical[i]
				return

			for(var/i = 1, i <= C.chemical.len, i++)
				var/datum/reagents/RG = C.chemical[i]

				for(var/g = 1, g <= chemical.len, g++)
					var/datum/reagents/REAG = chemical[g]


					if(RG.name == REAG.name)
						RG.amount += REAG.amount
						REAG.amount -= REAG.amount
						fuck = 1

			if(fuck == 0)
				for(var/i = 1, i <= chemical.len, i++)
					var/datum/reagents/REAG = chemical[i]
					C.chemical += REAG


/obj/machinery/atmospherics/outer/proc/chem_to_turfs()
	for(var/obj/machinery/portable_atmospherics/canister/C in world)
		if(C.connected == 1 && C.atmosnet == atmosnet)
			for(var/i = 1, i <= C.chemical.len, i++)
				var/datum/reagents/RG = C.chemical[i]
				for(var/turf/simulated/floor/FL in range(1,src))

					if(RG.amount > 0)
						for(var/m = 1, m <= C.chemical.len, m++)
							RG.amount -= 1
							FL.increase_reagent(RG.name)


/turf/simulated/floor/proc/chem()
	var/bitch = 0
	for(var/turf/simulated/floor/FL in range(1,src))
		for(var/atom/A in FL)
			if(A.pass_gas != 1)
				bitch = 1

		if(FL != src && bitch == 0)
//кровь
			if(blood > 0 && FL.blood < blood)
				FL.blood += 1
				blood -= 1
	//сера
			if(S > 0 && FL.S < S)
				FL.S += 1
				S -= 1
	//кислород
			if(O > 0 && FL.O < O)
				FL.O += 1
				O -= 1
	//хлор
			if(Cl > 0 && FL.Cl < Cl)
				FL.Cl += 1
				Cl -= 1

	//азот
			if(N > 0 && FL.N < N)
				FL.N += 1
				N -= 1

	//свинец
			if(Pb > 0 && FL.Pb < Pb)
				FL.Pb += 1
				Pb -= 1


	//cеребро
			if(Ag > 0 && FL.Ag < Ag)
				FL.Ag += 1
				Ag -= 1


	//золото
			if(Au > 0 && FL.Au < Au)
				FL.Au += 1
				Au -= 1


	//медь
			if(Cu > 0 && FL.Cu < Cu)
				FL.Cu += 1
				Cu -= 1


	//рубидий
			if(Rb > 0 && FL.Rb < Rb)
				FL.Rb += 1
				Rb -= 1


	//полоний
			if(Po > 0 && FL.Po < Po)
				FL.Po += 1
				Po -= 1


	//водород
			if(H > 0 && FL.H < H)
				FL.H += 1
				H -= 1


proc/dispense_chem(usr, var/chem)
	for(var/obj/machinery/chem/chemdispenser/CH in range(1,usr))
		for(var/i = 1, i <= CH.cont.len, i++)
			var/obj/item/container/CONTA = CH.cont[i]
			for(var/j = 1, j <= CH.chemical.len, j++)
				var/datum/reagents/RG = CH.chemical[j]
				if(RG.name == chem) //NY CHO DATUMOMRAZ, SUCK MY DICK???
					//CONTA.my_val()
					if(CONTA.cur_val < CONTA.max)
						if(CONTA.chemical.len == 0)
							//CONTA.my_val()
							//world << "SUCK"
							if(RG.amount > 10)
								//world << "SUCK2"
								var/fucker = RG.type
								var/datum/reagents/RG2 = fucker
								RG2 = new()
								RG.amount -= 10
								RG2.amount = 10
								RG2.name = RG.name
								CONTA.chemical += RG2
								//world << "FUCK"
								CONTA.my_val()
								usr << "\blue Вы набираете в колбу 10 единиц [RG.name]"

								//ximicheskie reakcii
								CONTA.check_react("blood", "blood")
								//ximicheskie reakcii


								//world << "[CONTA.chemical.len]"
								return

						//world << "PIZDA"
						//world << "[CONTA.chemical.len]"
						for(var/m = 1, m <= CONTA.chemical.len, m++)
							var/datum/reagents/REG = CONTA.chemical[m]
							//world << "FUCK2"
							if(REG.name == chem)
								//world << "FUCK3 - [CH.cont.len] - [CH.chemical.len] - [CONTA.chemical.len]"
								if(RG.amount > 10)
									REG.amount += 10
									RG.amount -= 10
									CONTA.my_val()
									usr << "\blue Вы набираете в колбу 10 единиц [RG.name]"
									//ximicheskie reakcii
									CONTA.check_react("blood", "blood")
									//ximicheskie reakcii
				//	else
				//		world << "STOP IT"

proc/get_container(usr)
	for(var/obj/machinery/chem/chemdispenser/CH in range(1,usr))
		for(var/i = 1, i <= CH.cont.len, i++)
			var/obj/item/container/CONTA = CH.cont[i]
			world << "[CONTA.cur_val]"
			world << "[CONTA.chemical.len]"
			CONTA.Move(CH.loc)
			CH.cont.Cut()

proc/create_reagent()
	for(var/obj/machinery/chem/chemdispenser/CH in range(1,usr))
		for(var/i = 1, i <= CH.cont.len, i++)
			var/obj/item/container/CONTA = CH.cont[i]
			world << "[CONTA.cur_val]"
			world << "[CONTA.chemical.len]"
			CONTA.Move(CH.loc)
			CH.cont.Cut()

/turf/simulated/floor/proc/increase_reagent(var/joke)
	switch(joke)
		if("blood")
			blood += 1

		if("Pb")
			Pb += 1

		if("O")
			O += 1

		if("N")
			N += 1

		if("H")
			H += 1

		if("Cl")
			Cl += 1

		if("Ag")
			Ag += 1

		if("Cu")
			Cu += 1

		if("Au")
			Au += 1

		if("K")
			K += 1

		if("Rb")
			Rb += 1

		if("Po")
			Po += 1

		if("S")
			S += 1

/turf/simulated/floor/proc/decrease_reagent(var/joke)
	switch(joke)
		if("blood")
			blood -= 1

		if("Pb")
			Pb -= 1

		if("O")
			O -= 1

		if("N")
			N -= 1

		if("H")
			H -= 1

		if("Cl")
			Cl -= 1

		if("Ag")
			Ag -= 1

		if("Cu")
			Cu -= 1

		if("Au")
			Au -= 1

		if("K")
			K -= 1

		if("Rb")
			Rb -= 1

		if("Po")
			Po -= 1

		if("S")
			S -= 1

/mob/human/proc/on_turf_react()
	var/turf/simulated/floor/T = src.loc
	var/random = rand(0,100)

	if(T.blood > 0)
		return

	if(T.Pb > 0)
		if(src == usr)
			if(random < 5)
				usr << "\red Вы чувствуете привкус металла"

	if(T.O > 0)
		return

	if(T.N > 0)
		return

	if(T.H > 0)
		return

	if(T.Cl > 0)
		if(src == usr)
			if(random < 5)
				usr << "\red Вы чувствуете резкий неприятный запах"

	if(T.Ag > 0)
		if(src == usr)
			if(random < 5)
				usr << "\red Вы чувствуете привкус металла"

	if(T.Cu > 0)
		if(src == usr)
			if(random < 5)
				usr << "\red Вы чувствуете привкус металла"

	if(T.Au > 0)
		if(src == usr)
			if(random < 5)
				usr << "\red Вы чувствуете привкус металла"

	if(T.K > 0)
		if(src == usr)
			if(random < 5)
				usr << "\red Вы чувствуете привкус металла"

	if(T.Rb > 0)
		if(src == usr)
			if(random < 5)
				usr << "\red Вы чувствуете привкус металла"

	if(T.Po > 0)
		if(src == usr)
			if(random < 5)
				usr << "\red Вы чувствуете привкус металла"
				usr << "\red Вы чувствуете рвоту"

	if(T.S > 0)
		if(src == usr)
			if(random < 5)
				usr << "\red Вы чувствуете резкий неприятный запах"
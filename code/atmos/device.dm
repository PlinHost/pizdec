/datum/atmos_net
	var/list/canisters = list()

var/global/datum/atmos_net/a_net = new()

/obj/machinery/atmos
	var/oxygen = 0
	var/nitrogen = 0
	var/plasma = 0
	var/list/datum/reagents/chemical = list()
	icon = 'icons/atmos.dmi'
	density = 1

/obj/machinery/lighter
	icon = 'icons/atmos.dmi'
	density = 0
	icon_state = "lighter"


/obj/machinery/atmos/canister
	var/open = 0
	var/connected = 0
	var/id // ������ ��������������
	var/list/chemistry = list("blood")
	weight = 20

/obj/machinery/atmos/canister/oxygen
	oxygen = 500
	nitrogen = 0
	plasma = 0
	icon_state = "canister_o"

/obj/machinery/atmos/canister/plasma
	oxygen = 0
	nitrogen = 0
	plasma = 500
	icon_state = "canister_p"

/obj/machinery/atmos/canister/nitrogen
	oxygen = 0
	nitrogen = 500
	plasma = 0
	icon_state = "canister_n"

/obj/machinery/atmos/canister/empty
	oxygen = 0
	nitrogen = 0
	plasma = 0
	icon_state = "canister_empty"

/obj/machinery/atmos/canister/act()
	var/turf/T = src.loc
	world << "oxygen [oxygen]; plasma [plasma]; nitrogen [nitrogen]; atmosnet [atmosnet];"
	if(connected == 0 && open == 0)
		for(var/obj/machinery/atmos/connector/C in T)
			if(T)
				atmosnet = C.atmosnet
				connected = 1
				usr << "�� �������� �������� � ����������"
				return

	if(connected == 1 && open == 1)
		for(var/obj/machinery/atmos/connector/C in T)
			if(T)
				atmosnet = C.atmosnet
				connected = 0
				usr << "�� ������� �������� �� ����������"
				return

	if(open == 0)
		open = 1
		usr << "�� ������ ��������"
		return

	if(open == 1)
		open = 0
		usr << "�� ������ ��������"
		return

/obj/machinery/atmos/canister/New()
	//id = rand(1,999)
	a_net.canisters += src
	process()

/obj/machinery/atmos/canister/process()
	spawn while(1)
		sleep(1)
		for(var/turf/simulated/floor/F in range(1, src))
			for(var/atom/A in F)
				if(A.pass_gas == 1)
					if(open == 1)
						if(nitrogen > 0)
							sleep(1)
							F.nitrogen += 1
							nitrogen -= 1
						if(plasma > 0)
							sleep(1)
							F.plasma += 1
							plasma -= 1
						if(oxygen > 0)
							sleep(1)
							F.oxygen += 1
							oxygen -= 1

		for(var/obj/machinery/atmos/canister/Z in a_net.canisters)
			if(Z.connected == 1 && Z.atmosnet == atmosnet)
				if(Z != src)
					//world << "������� �������� [Z.id]"
					if(oxygen > Z.oxygen)
						if(oxygen > 0)
							Z.oxygen += 1
							oxygen -= 1

					if(nitrogen > Z.nitrogen)
						if(nitrogen > 0)
							Z.nitrogen += 1
							nitrogen -= 1

					if(plasma > Z.plasma)
						if(plasma > 0)
							Z.plasma += 1
							plasma -= 1


					if(oxygen < Z.oxygen)
						if(Z.oxygen > 0)
							Z.oxygen -= 1
							oxygen += 1

					if(nitrogen < Z.nitrogen)
						if(Z.nitrogen > 0)
							Z.nitrogen -= 1
							nitrogen += 1

					if(plasma < Z.plasma)
						if(Z.plasma > 0)
							Z.plasma -= 1
							plasma += 1

					//for(var/datum/reagents/REG in chemical)
					//	move_one_unit(Z, REG)

/obj/machinery/atmos/colder
	icon_state = "cold"
	use_power = 1
	on = 0

/obj/machinery/atmos/hater
	icon_state = "hate"
	use_power = 1
	on = 0

/obj/machinery/atmos/connector/New()
	GASWAGEN_NET++
	atmosnet = GASWAGEN_NET
	process()


/obj/machinery/atmos/connector
	icon_state = "connector"
	on = 0

/obj/machinery/atmos/connector/process()
	spawn while(1)
		sleep(2)
		for(var/obj/machinery/atmos/pipe/P in range(1, src))
			if(P.atmosnet != 0)
				atmosnet = P.atmosnet

/obj/machinery/atmos/outer
	icon_state = "out"
	density = 0
	layer = 3

/obj/machinery/atmos/outer/process()
	spawn while(1)
		sleep(2)
		atmosnet = 0
		icon_state = "out"
		for(var/obj/machinery/atmos/pipe/P in range(1, src))
			atmosnet = P.atmosnet
		for(var/obj/machinery/atmos/canister/C in world)
			if(C.connected == 1 && C.atmosnet == atmosnet)
				for(var/turf/simulated/floor/F in range(1, src))
					for(var/atom/A in F)
						if(A.pass_gas == 1)

							if(C.oxygen > 0)
								icon_state = "out_work"
								sleep(2)

								F.oxygen += 1
								C.oxygen -= 1

							if(C.nitrogen > 0)
								icon_state = "out_work"
								sleep(2)

								F.nitrogen += 1
								C.nitrogen -= 1

							if(C.plasma > 0)
								icon_state = "out_work"
								sleep(2)

								F.plasma += 1
								C.plasma -= 1

							//if(C.chemical.len > 0)
							//	icon_state = "out_work"
							//	chem_to_turfs()
							//	dispense_to_turf("blood")
								sleep(2)


/obj/machinery/atmos/outer/New()
	process()

/obj/machinery/atmos/outer/act()
	world << "[atmosnet]"

/obj/machinery/atmos/inner
	icon_state = "in"
	density = 0
	layer = 2.3

/obj/machinery/atmos/inner/New()
	process()


/obj/machinery/atmos/inner/process()
	spawn while(1)
		sleep(2)
		atmosnet = 0
		icon_state = "in"
		for(var/obj/machinery/atmos/pipe/P in range(1, src))
			atmosnet = P.atmosnet
		for(var/obj/machinery/atmos/canister/C in world)
			if(C.connected == 1 && C.atmosnet == atmosnet)
				for(var/turf/simulated/floor/F in range(1, src))
					for(var/atom/A in F)
						if(A.pass_gas == 1)

							if(F.oxygen > 0)
								icon_state = "in_work"
								sleep(2)

								F.oxygen -= 1
								C.oxygen += 1

							if(F.nitrogen > 0)
								icon_state = "in_work"
								sleep(2)

								F.nitrogen -= 1
								C.nitrogen += 1

							if(F.plasma > 0)
								icon_state = "in_work"
								sleep(2)

								F.plasma -= 1
								C.plasma += 1


/obj/machinery/atmos/colder/act()
	if(on == 1)
		on = 0
		usr << "�� ��������� �����������"
		return
	else
		on = 1
		usr << "�� �������� �����������"
		return

/obj/machinery/atmos/hater/act()
	if(on == 1)
		on = 0
		usr << "�� ��������� ������������"
		return
	else
		on = 1
		usr << "�� �������� ������������"
		return

/obj/machinery/atmos/colder/check()
	if(on == 1)
		for(var/turf/simulated/floor/F in range(1, src))
			for(var/atom/A in F)
				if(A.pass_gas == 1)
					sleep(5)
					if(F.temperature > -320)
						F.temperature -= 1
	if(on == 0)
		return

/obj/machinery/atmos/hater/check()
	if(on == 1)
		for(var/turf/simulated/floor/F in range(1, src))
			for(var/atom/A in F)
				if(A.pass_gas == 1)
					sleep(5)
					F.temperature += 1
	if(on == 0)
		return
/datum/plumbing_net
	var/list/canisters = list()

var/global/datum/plumbing_net/p_net = new()

/obj/machinery/plumbing
	var/water = 0
	icon = 'icons/obj/plumbing.dmi'
	density = 1

/obj/machinery/plumbing/canister
	var/open = 0
	var/connected = 0
	var/id // Плохое дервенорешение


/obj/machinery/plumbing/canister/water
	water = 500
	icon_state = "canister"


/obj/machinery/plumbing/canister/empty
	water = 0
	icon_state = "canister_empty"

/obj/machinery/plumbing/canister/act()
	var/turf/T = src.loc
	world << "water [water]; plumbingnet [plumbingnet]"
	if(connected == 0 && open == 0)
		for(var/obj/machinery/plumbing/connector/C in T)
			if(T)
				plumbingnet = C.plumbingnet
				connected = 1
				usr << "Ты подцепил канистру к коннектору"
				return

	if(connected == 1 && open == 1)
		for(var/obj/machinery/plumbing/connector/C in T)
			if(T)
				plumbingnet = C.plumbingnet
				connected = 0
				usr << "Ты отцепил канистру от коннектора"
				return

	if(open == 0)
		open = 1
		usr << "Ты открыл канистру"
		return

	if(open == 1)
		open = 0
		usr << "Ты закрыл канистру"
		return

/obj/machinery/plumbing/canister/New()
	//id = rand(1,999)
	p_net.canisters += src
	process()

/obj/machinery/plumbing/canister/process()
	spawn while(1)
		sleep(1)
		for(var/turf/simulated/floor/F in range(1, src))
			for(var/atom/A in F)
				if(A.pass_gas == 1)
					if(open == 1)
						if(water > 0)
							sleep(1)
							F.water += 1
							water -= 1

		for(var/obj/machinery/plumbing/canister/Z in p_net.canisters)
			if(Z.connected == 1 && Z.plumbingnet == plumbingnet)
				if(Z != src)
					//world << "Найдена канистра [Z.id]"
					if(water > Z.water)
						if(water > 0)
							Z.water += 1
							water -= 1


					if(water < Z.water)
						if(Z.water > 0)
							Z.water -= 1
							water += 1

/obj/machinery/plumbing/colder
	icon_state = "cold"
	use_power = 1
	on = 0

/obj/machinery/plumbing/hater
	icon_state = "hate"
	use_power = 1
	on = 0

/obj/machinery/plumbing/connector/New()
	GASWAGEN_NET++
	plumbingnet = GASWAGEN_NET
	process()


/obj/machinery/plumbing/connector
	icon_state = "connector"
	on = 0

/obj/machinery/plumbing/connector/process()
	spawn while(1)
		sleep(2)
		for(var/obj/machinery/plumbing/pipe/P in range(1, src))
			if(P.plumbingnet != 0)
				plumbingnet = P.plumbingnet

/obj/machinery/plumbing/outer
	icon_state = "out"
	density = 0

/obj/machinery/plumbing/outer/process()
	spawn while(1)
		sleep(2)
		plumbingnet = 0
		icon_state = "out"
		for(var/obj/machinery/plumbing/pipe/P in range(1, src))
			plumbingnet = P.plumbingnet
		for(var/obj/machinery/plumbing/canister/C in world)
			if(C.connected == 1 && C.plumbingnet == plumbingnet)
				for(var/turf/simulated/floor/F in range(1, src))
					for(var/atom/A in F)
						if(A.pass_gas == 1)

							if(C.water > 0)
								icon_state = "out_work"
								sleep(2)

								F.water += 1
								C.water -= 1

/obj/machinery/plumbing/sink
	icon_state = "sink"
	density = 0


/obj/machinery/plumbing/sink/New()
	process()

/obj/machinery/plumbing/sink/process()
	spawn while(1)
		sleep(2)
		plumbingnet = 0
		icon_state = "sink"
		for(var/obj/machinery/plumbing/pipe/P in range(1, src))
			plumbingnet = P.plumbingnet
		for(var/obj/machinery/plumbing/canister/C in world)
			if(C.connected == 1 && C.plumbingnet == plumbingnet)
				for(var/turf/simulated/floor/F in range(1, src))
					for(var/atom/A in F)
						if(A.pass_gas == 1)

							if(C.water > 0)
								icon_state = "sink_work"
								sleep(2)

/obj/machinery/plumbing/sink/act()
	for(var/obj/machinery/plumbing/canister/C in world)
		if(C.connected == 1 && C.plumbingnet == plumbingnet)
			if(C.water > 0)
				C.water -= 1
				world << "[C.water]"
				usr << "\blue Ты умываешь руки"
				return

/obj/machinery/plumbing/outer/New()
	process()

/obj/machinery/plumbing/outer/act()
	world << "[plumbingnet]"

/obj/machinery/plumbing/inner
	icon_state = "in"
	density = 0

/obj/machinery/plumbing/inner/New()
	process()


/obj/machinery/plumbing/inner/process()
	spawn while(1)
		sleep(2)
		plumbingnet = 0
		icon_state = "in"
		for(var/obj/machinery/plumbing/pipe/P in range(1, src))
			plumbingnet = P.plumbingnet
		for(var/obj/machinery/plumbing/canister/C in world)
			if(C.connected == 1 && C.plumbingnet == plumbingnet)
				for(var/turf/simulated/floor/F in range(1, src))
					for(var/atom/A in F)
						if(A.pass_gas == 1)

							if(F.water > 0)
								icon_state = "in_work"
								sleep(2)

								F.water -= 1
								C.water += 1
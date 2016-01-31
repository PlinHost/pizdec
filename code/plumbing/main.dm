//КАК ЖЕ Я НЕНАВИЖУ ТРУБЫ БЛЯДЬ И ПРОВОДА УЕБАНСКИЕ
var/global/WATERWAGEN_NET = 0//


/obj/machinery/plumbing
	var/plumbingnet = 0 //трубосети, нужны, чтобы создавать независимые друг от друга атмосокоммуникации
	var/reset
	var/zLevel = 0
	var/list/datum/reagents/chemical = list()

/obj/machinery/plumbing/pipe
	icon = 'icons/plumbing.dmi'
	name = "pipe"
	icon_state = "pipe"
	density = 0
	alpha = 128
	layer = 2.4

/obj/machinery/plumbing/pipe/pipemainfold
	icon_state = "pipe_tr"
	plumbingnet = 0

/obj/machinery/plumbing/pipe/pipemainfold/process() // используется для подключения дополнительного коннектора, также соединения атмососетей
	spawn while(1)
		sleep(1)
		for(var/obj/machinery/plumbing/A in range(1,src))
			if(!(istype(src, /obj/machinery/plumbing/connector)))
				if(A.plumbingnet != 0)
					plumbingnet = A.plumbingnet
		for(var/obj/machinery/plumbing/connector/A in range(1,src))
			A.plumbingnet = plumbingnet
			if(A.plumbingnet == 0)
				WATERWAGEN_NET++
				A.plumbingnet = WATERWAGEN_NET
				plumbingnet = A.plumbingnet

/obj/machinery/plumbing/pipe/pipemainfold/New()
	process()

/obj/machinery/plumbing/pipe/pipemainfold/act()
	world << "[plumbingnet]"

/obj/machinery/plumbing/pipe/process()
	spawn while(1)
		sleep(1)

		if(dir == 2 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

			for(var/obj/machinery/plumbing/A in get_step(src,NORTH)) //вертикальные трубы
				if(istype(A,/obj/machinery/plumbing/outer))
					if(plumbingnet != 0)
						A.plumbingnet = plumbingnet
					else
						A.plumbingnet = 0
				else
					if(A.plumbingnet != 0)
						plumbingnet = A.plumbingnet

			for(var/obj/machinery/plumbing/A in get_step(src,SOUTH)) //вертикальные трубы
				if(istype(A,/obj/machinery/plumbing/outer))
					if(plumbingnet != 0)
						A.plumbingnet = plumbingnet
				else
					if(A.plumbingnet != 0)
						plumbingnet = A.plumbingnet

		if(dir == 4 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

			for(var/obj/machinery/plumbing/A in get_step(src,EAST))  //горизонтальные трубы
				if(istype(A,/obj/machinery/plumbing/outer))
					if(plumbingnet != 0)
						A.plumbingnet = plumbingnet
				else
					if(A.plumbingnet != 0)
						plumbingnet = A.plumbingnet

			for(var/obj/machinery/plumbing/A in get_step(src,WEST)) //горизонтальные трубы
				if(istype(A,/obj/machinery/plumbing/outer))
					if(plumbingnet != 0)
						A.plumbingnet = plumbingnet
					else
						A.plumbingnet = 0
				else
					if(A.plumbingnet != 0)
						plumbingnet = A.plumbingnet

		if(zLevel == 1)
			for(var/obj/machinery/plumbing/A in locate(x,y,z+1)) //Z трубы
				if(istype(A,/obj/machinery/plumbing/outer))
					if(plumbingnet != 0)
						A.plumbingnet = plumbingnet
					else
						A.plumbingnet = 0
				else
					if(A.plumbingnet != 0)
						plumbingnet = A.plumbingnet

		if(zLevel == -1)
			for(var/obj/machinery/plumbing/A in locate(x,y,z-1)) //Z трубы
				if(istype(A,/obj/machinery/plumbing/outer))
					if(plumbingnet != 0)
						A.plumbingnet = plumbingnet
					else
						A.plumbingnet = 0
				else
					if(A.plumbingnet != 0)
						plumbingnet = A.plumbingnet

		if(reset == 1) // ебасброс
			plumbingnet = 0
			reset = 0
			world << "ОБРЫВ ТРУБЫ К ХУЯМ БЛЯДЬ"
		/*
		if(dir == 6)

			for(var/obj/machinery/plumbing/A in get_step(src,SOUTH))
				for(A in get_step(src,EAST)) //юговосточная йобатруба
					plumbingnet = A.plumbingnet

		if(dir == 10)

			for(var/obj/machinery/plumbing/A in get_step(src,SOUTH))
				for(A in get_step(src,WEST))  //югозападная йобатруба
					plumbingnet = A.plumbingnet

		if(dir == 9)

			for(var/obj/machinery/plumbing/A in get_step(src,NORTH))
				for(A in get_step(src,WEST))  //северозападная йобатруба
					plumbingnet = A.plumbingnet

		if(dir == 5)

			for(var/obj/machinery/plumbing/A in get_step(src,NORTH))
				for(A in get_step(src,EAST))   //северовосточная йобатруба
					plumbingnet = A.plumbingnet
		*/



/obj/machinery/plumbing/pipe/New()
	process()

/obj/machinery/plumbing/pipe/act()
	//world << "plumbingnet №[plumbingnet]"
	del(src)

/obj/machinery/plumbing/pipe/Del()
	world << "plumbingnet №[plumbingnet]"
	var/how_much
	for(var/obj/machinery/plumbing/connector/C in world)
		if(plumbingnet == C.plumbingnet)
			how_much = 0 //сколько сранных коннекторов в ебучей атмососети
			how_much += 1
	if(how_much > 1)
		for(var/obj/machinery/plumbing/connector/C in world)
			WATERWAGEN_NET++
			C.plumbingnet = WATERWAGEN_NET

	for(var/obj/machinery/plumbing/pipe/P in world)
		if(plumbingnet == P.plumbingnet)
			P.reset = 1

	//world << "plumbingnet №[plumbingnet]"
	..()


///////////////////
/////////////////
///////////////////////

////////////////////////////////////
///////////////////////////////////////////////
//////////////////////////////////////////////////////

/obj/machinery/plumbing/outer
	layer = 2.4

/obj/machinery/plumbing/connector
	layer = 2.4

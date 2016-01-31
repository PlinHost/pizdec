//КАК ЖЕ Я НЕНАВИЖУ ТРУБЫ БЛЯДЬ И ПРОВОДА УЕБАНСКИЕ
var/global/TRASHWAGEN_NET = 0//

/obj/machinery/trash/huita

/obj/machinery/trash
	var/trashnet = 0 //трубосети, нужны, чтобы создавать независимые друг от друга атмосокоммуникации
	var/reset
	var/zLevel = 0

/obj/machinery/trash/pipe
	icon = 'icons/trash.dmi'
	name = "pipe"
	icon_state = "pipe"
	density = 0
	layer = 2.3

/obj/machinery/trash/pipe/pipemainfold
	icon_state = "pipe_tr"
	trashnet = 0

/obj/machinery/trash/pipe/pipemainfold/process() // используется для подключения дополнительного коннектора, также соединения атмососетей
	spawn while(1)
		sleep(1)
		for(var/obj/machinery/trash/A in range(1,src))
			if(!(istype(A, /obj/machinery/trash/huita)))
				if(A.trashnet != 0)
					trashnet = A.trashnet
		for(var/obj/machinery/trash/pipe/A in range(1,src))
			A.trashnet = trashnet

/obj/machinery/trash/pipe/pipemainfold/New()
	var/turf/T = src.loc
	if(istype(T, /turf/simulated/floor) && !(istype(T, /turf/simulated/floor/plating)))
		alpha = 0

	if(istype(T, /turf/simulated/wall/))
		alpha = 0
	process()

/obj/machinery/trash/pipe/pipemainfold/act()
	world << "[trashnet]"

/obj/machinery/trash/pipe/process()
	spawn while(1)
		sleep(1)

		if(dir == 2 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

			for(var/obj/machinery/trash/A in get_step(src,NORTH)) //вертикальные трубы
				if(istype(A,/obj/machinery/trash/disposal))
					if(trashnet != 0)
						A.trashnet = trashnet
					else
						A.trashnet = 0
				else
					if(A.trashnet != 0)
						trashnet = A.trashnet

			for(var/obj/machinery/trash/A in get_step(src,SOUTH)) //вертикальные трубы
				if(istype(A,/obj/machinery/trash/disposal))
					if(trashnet != 0)
						A.trashnet = trashnet
				else
					if(A.trashnet != 0)
						trashnet = A.trashnet

		if(dir == 4 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

			for(var/obj/machinery/trash/A in get_step(src,EAST))  //горизонтальные трубы
				if(istype(A,/obj/machinery/trash/disposal))
					if(trashnet != 0)
						A.trashnet = trashnet
				else
					if(A.trashnet != 0)
						trashnet = A.trashnet

			for(var/obj/machinery/trash/A in get_step(src,WEST)) //горизонтальные трубы
				if(istype(A,/obj/machinery/trash/disposal))
					if(trashnet != 0)
						A.trashnet = trashnet
					else
						A.trashnet = 0
				else
					if(A.trashnet != 0)
						trashnet = A.trashnet

		if(zLevel == 1)
			for(var/obj/machinery/trash/A in locate(x,y,z+1)) //Z трубы
				if(istype(A,/obj/machinery/trash/disposal))
					if(trashnet != 0)
						A.trashnet = trashnet
					else
						A.trashnet = 0
				else
					if(A.trashnet != 0)
						trashnet = A.trashnet

		if(zLevel == -1)
			for(var/obj/machinery/trash/A in locate(x,y,z-1)) //Z трубы
				if(istype(A,/obj/machinery/trash/disposal))
					if(trashnet != 0)
						A.trashnet = trashnet
					else
						A.trashnet = 0
				else
					if(A.trashnet != 0)
						trashnet = A.trashnet

		if(reset == 1) // ебасброс
			trashnet = 0
			reset = 0
			world << "ОБРЫВ ТРУБЫ К ХУЯМ БЛЯДЬ"


/obj/machinery/trash/pipe/New()
	var/turf/T = src.loc
	if(istype(T, /turf/simulated/floor) && !(istype(T, /turf/simulated/floor/plating)))
		alpha = 0

	if(istype(T, /turf/simulated/wall))
		alpha = 0
	process()

/obj/machinery/trash/pipe/act()
	del(src)

/obj/machinery/trash/pipe/Del()
	world << "trashnet №[trashnet]"
	var/how_much
	for(var/obj/machinery/trash/outlet/C in world)
		if(trashnet == C.trashnet)
			how_much = 0 //сколько сранных коннекторов в ебучей атмососети
			how_much += 1
	if(how_much > 1)
		for(var/obj/machinery/trash/outlet/C in world)
			TRASHWAGEN_NET++
			C.trashnet = TRASHWAGEN_NET

	for(var/obj/machinery/trash/pipe/P in world)
		if(trashnet == P.trashnet)
			P.reset = 1

	..()
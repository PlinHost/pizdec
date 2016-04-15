//��� �� � �������� ����� ����� � ������� ���������
var/global/GASWAGEN_NET = 0//


/obj/machinery/atmospherics
	var/atmosnet = 0 //���������, �����, ����� ��������� ����������� ���� �� ����� ������������������
	var/reset
	var/zLevel = 0


/obj/machinery/atmospherics/pipe
	icon = 'icons/obj/machine/atmos.dmi'
	name = "pipe"
	icon_state = "pipe"
	density = 0
	alpha = 128
	layer = 2.4
	anchored = 1

/obj/machinery/atmospherics/pipe/manifold
	icon_state = "pipe_tr"
	atmosnet = 0

/obj/machinery/atmospherics/pipe/manifold/process() // ������������ ��� ����������� ��������������� ����������, ����� ���������� �����������
	processing = 1
	objects += src
	spawn while(1)
		sleep(1)
		for(var/obj/machinery/atmospherics/A in range(1,src))
			if(!(istype(src, /obj/machinery/atmospherics/connector)))
				if(A.atmosnet != 0)
					atmosnet = A.atmosnet
		for(var/obj/machinery/atmospherics/connector/A in range(1,src))
			A.atmosnet = atmosnet
			if(A.atmosnet == 0)
				GASWAGEN_NET++
				A.atmosnet = GASWAGEN_NET
				atmosnet = A.atmosnet

/obj/machinery/atmospherics/pipe/manifold/New()
	process()

/obj/machinery/atmospherics/pipe/manifold/act()
	world << "[atmosnet]"

/obj/machinery/atmospherics/pipe/process()
	processing = 1
	objects += src
	spawn while(1)
		sleep(1)

		if(dir == 2 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

			for(var/obj/machinery/atmospherics/A in get_step(src,NORTH)) //������������ �����
				if(istype(A,/obj/machinery/atmospherics/outer))
					if(atmosnet != 0)
						A.atmosnet = atmosnet
					else
						A.atmosnet = 0
				else
					if(A.atmosnet != 0)
						atmosnet = A.atmosnet

			for(var/obj/machinery/atmospherics/A in get_step(src,SOUTH)) //������������ �����
				if(istype(A,/obj/machinery/atmospherics/outer))
					if(atmosnet != 0)
						A.atmosnet = atmosnet
				else
					if(A.atmosnet != 0)
						atmosnet = A.atmosnet

		if(dir == 4 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

			for(var/obj/machinery/atmospherics/A in get_step(src,EAST))  //�������������� �����
				if(istype(A,/obj/machinery/atmospherics/outer))
					if(atmosnet != 0)
						A.atmosnet = atmosnet
				else
					if(A.atmosnet != 0)
						atmosnet = A.atmosnet

			for(var/obj/machinery/atmospherics/A in get_step(src,WEST)) //�������������� �����
				if(istype(A,/obj/machinery/atmospherics/outer))
					if(atmosnet != 0)
						A.atmosnet = atmosnet
					else
						A.atmosnet = 0
				else
					if(A.atmosnet != 0)
						atmosnet = A.atmosnet

		if(zLevel == 1)
			for(var/obj/machinery/atmospherics/A in locate(x,y,z+1)) //Z �����
				if(istype(A,/obj/machinery/atmospherics/outer))
					if(atmosnet != 0)
						A.atmosnet = atmosnet
					else
						A.atmosnet = 0
				else
					if(A.atmosnet != 0)
						atmosnet = A.atmosnet

		if(zLevel == -1)
			for(var/obj/machinery/atmospherics/A in locate(x,y,z-1)) //Z �����
				if(istype(A,/obj/machinery/atmospherics/outer))
					if(atmosnet != 0)
						A.atmosnet = atmosnet
					else
						A.atmosnet = 0
				else
					if(A.atmosnet != 0)
						atmosnet = A.atmosnet

		if(reset == 1) // ��������
			atmosnet = 0
			reset = 0
			world << "����� ����� � ���� �����"


/obj/machinery/atmospherics/pipe/New()
	process()

/obj/machinery/atmospherics/pipe/act()
	//world << "atmosnet �[atmosnet]"
	del(src)

/obj/machinery/atmospherics/pipe/Del()
	world << "atmosnet �[atmosnet]"
	var/how_much
	for(var/obj/machinery/atmospherics/connector/C in world)
		if(atmosnet == C.atmosnet)
			how_much = 0 //������� ������� ����������� � ������ ����������
			how_much += 1
	if(how_much > 1)
		for(var/obj/machinery/atmospherics/connector/C in world)
			GASWAGEN_NET++
			C.atmosnet = GASWAGEN_NET

	for(var/obj/machinery/atmospherics/pipe/P in world)
		if(atmosnet == P.atmosnet)
			P.reset = 1

	..()

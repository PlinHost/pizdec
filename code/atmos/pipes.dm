//��� �� � �������� ����� ����� � ������� ���������
var/global/GASWAGEN_NET = 0//


/obj/machinery/atmos
	var/atmosnet = 0 //���������, �����, ����� ��������� ����������� ���� �� ����� ������������������
	var/reset
	var/zLevel = 0

/obj/machinery/atmos/pipe
	icon = 'icons/atmos.dmi'
	name = "pipe"
	icon_state = "pipe"
	density = 0
	alpha = 128
	layer = 2.4
	anchored = 1

/obj/machinery/atmos/pipe/pipemainfold
	icon_state = "pipe_tr"
	atmosnet = 0

/obj/machinery/atmos/pipe/pipemainfold/process() // ������������ ��� ����������� ��������������� ����������, ����� ���������� �����������
	spawn while(1)
		sleep(1)
		for(var/obj/machinery/atmos/A in range(1,src))
			if(!(istype(src, /obj/machinery/atmos/connector)))
				if(A.atmosnet != 0)
					atmosnet = A.atmosnet
		for(var/obj/machinery/atmos/connector/A in range(1,src))
			A.atmosnet = atmosnet
			if(A.atmosnet == 0)
				GASWAGEN_NET++
				A.atmosnet = GASWAGEN_NET
				atmosnet = A.atmosnet

/obj/machinery/atmos/pipe/pipemainfold/New()
	process()

/obj/machinery/atmos/pipe/pipemainfold/act()
	world << "[atmosnet]"

/obj/machinery/atmos/pipe/process()
	spawn while(1)
		sleep(1)

		if(dir == 2 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

			for(var/obj/machinery/atmos/A in get_step(src,NORTH)) //������������ �����
				if(istype(A,/obj/machinery/atmos/outer))
					if(atmosnet != 0)
						A.atmosnet = atmosnet
					else
						A.atmosnet = 0
				else
					if(A.atmosnet != 0)
						atmosnet = A.atmosnet

			for(var/obj/machinery/atmos/A in get_step(src,SOUTH)) //������������ �����
				if(istype(A,/obj/machinery/atmos/outer))
					if(atmosnet != 0)
						A.atmosnet = atmosnet
				else
					if(A.atmosnet != 0)
						atmosnet = A.atmosnet

		if(dir == 4 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

			for(var/obj/machinery/atmos/A in get_step(src,EAST))  //�������������� �����
				if(istype(A,/obj/machinery/atmos/outer))
					if(atmosnet != 0)
						A.atmosnet = atmosnet
				else
					if(A.atmosnet != 0)
						atmosnet = A.atmosnet

			for(var/obj/machinery/atmos/A in get_step(src,WEST)) //�������������� �����
				if(istype(A,/obj/machinery/atmos/outer))
					if(atmosnet != 0)
						A.atmosnet = atmosnet
					else
						A.atmosnet = 0
				else
					if(A.atmosnet != 0)
						atmosnet = A.atmosnet

		if(zLevel == 1)
			for(var/obj/machinery/atmos/A in locate(x,y,z+1)) //Z �����
				if(istype(A,/obj/machinery/atmos/outer))
					if(atmosnet != 0)
						A.atmosnet = atmosnet
					else
						A.atmosnet = 0
				else
					if(A.atmosnet != 0)
						atmosnet = A.atmosnet

		if(zLevel == -1)
			for(var/obj/machinery/atmos/A in locate(x,y,z-1)) //Z �����
				if(istype(A,/obj/machinery/atmos/outer))
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
		/*
		if(dir == 6)

			for(var/obj/machinery/atmos/A in get_step(src,SOUTH))
				for(A in get_step(src,EAST)) //������������ ���������
					atmosnet = A.atmosnet

		if(dir == 10)

			for(var/obj/machinery/atmos/A in get_step(src,SOUTH))
				for(A in get_step(src,WEST))  //����������� ���������
					atmosnet = A.atmosnet

		if(dir == 9)

			for(var/obj/machinery/atmos/A in get_step(src,NORTH))
				for(A in get_step(src,WEST))  //�������������� ���������
					atmosnet = A.atmosnet

		if(dir == 5)

			for(var/obj/machinery/atmos/A in get_step(src,NORTH))
				for(A in get_step(src,EAST))   //��������������� ���������
					atmosnet = A.atmosnet
		*/



/obj/machinery/atmos/pipe/New()
	process()

/obj/machinery/atmos/pipe/act()
	//world << "atmosnet �[atmosnet]"
	del(src)

/obj/machinery/atmos/pipe/Del()
	world << "atmosnet �[atmosnet]"
	var/how_much
	for(var/obj/machinery/atmos/connector/C in world)
		if(atmosnet == C.atmosnet)
			how_much = 0 //������� ������� ����������� � ������ ����������
			how_much += 1
	if(how_much > 1)
		for(var/obj/machinery/atmos/connector/C in world)
			GASWAGEN_NET++
			C.atmosnet = GASWAGEN_NET

	for(var/obj/machinery/atmos/pipe/P in world)
		if(atmosnet == P.atmosnet)
			P.reset = 1

	//world << "atmosnet �[atmosnet]"
	..()

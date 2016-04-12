//ZAKON OMA
// R = U/I ### resistance = voltage / amperage
// U = IR ### voltage = ameperage * resistance
// I = U/R ### amperage = voltage / resistance

//емкость в ватт-часах (напряжение * емкость в ампер-часах) ### full_charge = charge * work_voltage

var/global/DERVENPOWER = 0
var/global/list/smes = list()
var/global/list/wires = list()
var/global/list/generators = list()

#define LENGTH 2 //длина тайла предположим метра 2, соответственно длина провода тоже 2 метра (константная величина, неизменяемая)

//алсо, при большом сопротивлении и высокой силе тока проводник должен нагреваться, но мне удобнее было кодить немного иначе. Вот.
//в общем, маленькое сопротивление это большое сопротивление, а большое это маленькое. Вот такая вот Дервенофизика

/atom
	var
		resistance = 1 //сопротивление, определяет материал
		amperage = 0 //сила тока
		voltage = 0 //напряжение
		conductivity = 1 //проводимость (проводник/диэлектрик)
		isolation = 1 //изоляция, нужна в общем-то проводам.
		my_temperature = 0 //температура будет повышаться от перегрузок
		power_limit //предел до првышения которого температура проводника не повышается
		temperature_limit = 100 //максимальная температура, которую способен выдержать проводник

/obj/machinery
	var/marker = 0

/obj/electro/powerbox
	name = "powerbox"
	icon = 'icons/obj/machine/power.dmi'
	icon_state = "apc"
	var/powernet = 0
	alpha = 128
	layer = 2.4
	anchored = 1


/obj/electro/transformator
	name = "transformator"
	icon = 'icons/obj/machine/HICH_VOLTAGE.dmi'
	icon_state = "transformator"
	var/powernet = 0
	density = 1
	alpha = 128
	layer = 3
	var/mode = 0 //0 - понижающий, 1 - повышающий
	var/force = 10

/obj/electro/transformator/forced
	force = 35

/obj/electro/transformator/reverse
	mode = 1

/obj/electro/transformator/forced/reverse
	mode = 0
	force = 35

/obj/electro/cable
	var
		sq = 1 //площадь сечения

	name = "cable"
	icon = 'icons/obj/physics_cable.dmi'
	var/powernet = 0
	var/reset = 0
	var/zLevel = 0
	var/marker = 0
	alpha = 128
	layer = 2.4
	var/real_resistance

	output
		name = "out_cable"
		icon_state = "force"
		resistance = 50
		sq = 12

	act()
		world << "[resistance];[amperage];[voltage];[power_limit];[my_temperature]"

/obj/electro/cable/copper
	name = "copper_cable"
	icon_state = "copper"
	resistance = 99
	sq = 15

/obj/electro/cable/iron
	name = "iron_cable"
	icon_state = "iron"
	resistance = 25
	sq = 12

/obj/electro/cable/alluminium
	name = "alluminium_cable"
	icon_state = "alluminium"
	resistance = 97
	sq = 12

/obj/machinery
	var/use_power = 1
	var/powernet = 0

/obj/electro/cable/New()
	power_limit = resistance * LENGTH * sq
	real_resistance = resistance
	objects += src
	wires += src
	process()

/obj/electro/battery/smes/New()
	DERVENPOWER ++
	powernet = DERVENPOWER
	smes += src
	process()

/obj/electro/battery/smes/act()
	world << "[charge];[full_charge]"


/obj/electro/battery

	var
		charge = 0 //емкость в ампер-часах(так как это не самая реалистичная штука, часы будем опускать)
		work_voltage = 0 //рабочее напряжение
		//емкость в ватт-часах (напряжение * емкость в ампер-часах) ### full_charge = charge * work_voltage
		full_charge = 0
		powernet
	smes
		name = "smes"
		icon = 'icons/obj/machine/power.dmi'
		icon_state = "smes"
		work_voltage = 320

/datum/power_master
	New()
		machine()

/datum/power_master/proc/machine()
	spawn while(1)
		sleep(2)
		for(var/obj/machinery/M in machines)
			for(var/obj/electro/battery/smes/S in smes)
				if(M.powernet == S.powernet)
					if(S.charge >= M.need_amperage)
						if(M.amperage == 0 && M.marker == 0)
							M.amperage += M.need_amperage
							S.charge -= M.need_amperage

		for(var/obj/electro/cable/C in wires)
			for(var/obj/electro/battery/smes/S in smes)
				if(C.powernet == S.powernet)
					C.voltage = S.full_charge/(C.resistance * C.sq * LENGTH)

/obj/electro/battery/smes/process()
	processing = 1
	objects += src
	spawn while(1)
		sleep(1)
		for(var/obj/machinery/generator/S in generators)
			sleep(1)
			if(S.powernet == powernet)
				charge += S.amperage
				full_charge = charge * work_voltage
				S.amperage -= S.amperage

/obj/electro/powerbox/act()
	var/my_text
	my_text = {"
		<html>
		<head><title>Панель управлени&#255; электропитанием</title></head>
		<body>
		<br><a href=?off>Отключить приборы от сети</a>
		<br><a href=?on>Включить приборы в сеть</a>

		</body>
		</html>
		"}
	usr << browse(my_text,"window=my_text")
	world << "[powernet]"

/obj/electro/battery/smes/act()
	world << "[charge]"

/obj/electro/transformator/process()
	processing = 1
	objects += src
	spawn while(1)
		sleep(1)
		processing = 1
		for(var/obj/electro/cable/C in world)
			if(mode == 0)
				if(C.powernet == powernet)
					C.resistance += force

			if(mode == 1)
				if(C.powernet == powernet)
					C.resistance -= force



/obj/electro/transformator/New()
	process()

/obj/electro/cable/proc/just_check(var/other_amperage)
	if(amperage == 0)
		amperage = other_amperage
		if(other_amperage > 0)
			if(amperage - resistance > 0)
				amperage -= resistance //энергопотери
			else
				amperage = 0

		other_amperage = 0
			//world << "myloc ([x],[y])"

	if(amperage < other_amperage || (amperage == other_amperage && amperage != 0))
		amperage = other_amperage
		other_amperage = 0

		if(amperage - resistance > 0)
			amperage -= resistance //энергопотери
		else
			amperage = 0

		//world << "myloc ([x],[y])"

//Философский вопрос, что лучше несколько тысяч зацикленных проводов или один зацикленный контроллер обрабатывающий несколько тысяч проводов?
//Лучше без этого всего как-нибудь обойтись
//Но я пока не втыкаю как

/datum/POWERMASTER

/datum/POWERMASTER/proc/PROCESS()

/datum/POWERMASTER/New()
	PROCESS()

/obj/electro/cable/process()
	spawn while(1)
		sleep(2)
		processing = 1
		sleep(1)
		amperage = voltage / resistance

		if(voltage > power_limit)
			my_temperature = amperage - resistance - sq - LENGTH
			if(my_temperature < 0)
				my_temperature = 0

		if(voltage < power_limit)
			my_temperature = 0

		if(resistance > real_resistance)
			resistance -= resistance - real_resistance

		if(resistance < real_resistance)
			resistance += resistance + real_resistance

		if(my_temperature > temperature_limit)
			for(var/obj/electro/cable/P in world)
				if(powernet == P.powernet)
					P.reset = 1
					P.my_temperature = 0
					P.voltage = 0

			for(var/obj/machinery/P in world)
				if(powernet == P.powernet)
					P.on = 0
					P.powernet = 0
			del(src)

		sleep(1)


		if(dir == 2 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

			for(var/obj/electro/cable/A in get_step(src,NORTH))
				if(A.powernet != 0)
					powernet = A.powernet

			for(var/obj/electro/cable/A in get_step(src,SOUTH))
				if(A.powernet != 0)
					powernet = A.powernet

			for(var/obj/electro/powerbox/A in get_step(src,NORTH))
				if(powernet != 0)
					A.powernet = powernet

			for(var/obj/electro/powerbox/A in get_step(src,SOUTH))
				if(powernet != 0)
					A.powernet = powernet

			for(var/obj/electro/transformator/A in get_step(src,NORTH))
				if(powernet != 0)
					A.powernet = powernet

			for(var/obj/electro/transformator/A in get_step(src,SOUTH))
				if(powernet != 0)
					A.powernet = powernet

			for(var/obj/electro/battery/smes/S in get_step(src,SOUTH))
				powernet = S.powernet

			for(var/obj/electro/battery/smes/S in get_step(src,NORTH))
				powernet = S.powernet

			for(var/obj/machinery/generator/S in get_step(src,SOUTH))
				S.powernet = powernet

			for(var/obj/machinery/generator/S in get_step(src,NORTH))
				S.powernet = powernet

			for(var/obj/machinery/S in get_step(src,NORTH))
				S.powernet = powernet
					//world << "power[x];[y]"

			for(var/obj/machinery/S in get_step(src,SOUTH))
				S.powernet = powernet
					//world << "power[x];[y]"

		if(dir == 4 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

			for(var/obj/electro/cable/A in get_step(src,EAST))
				if(A.powernet != 0)
					powernet = A.powernet

			for(var/obj/electro/cable/A in get_step(src,WEST))
				if(A.powernet != 0)
					powernet = A.powernet

			for(var/obj/electro/powerbox/A in get_step(src,EAST))
				if(powernet != 0)
					A.powernet = powernet

			for(var/obj/electro/powerbox/A in get_step(src,WEST))
				if(powernet != 0)
					A.powernet = powernet

			for(var/obj/electro/transformator/A in get_step(src,EAST))
				if(powernet != 0)
					A.powernet = powernet

			for(var/obj/electro/transformator/A in get_step(src,WEST))
				if(powernet != 0)
					A.powernet = A.powernet

			for(var/obj/electro/battery/smes/S in get_step(src,EAST))
				powernet = S.powernet

			for(var/obj/electro/battery/smes/S in get_step(src,WEST))
				powernet = S.powernet

			for(var/obj/machinery/generator/S in get_step(src,WEST))
				S.powernet = powernet

			for(var/obj/machinery/generator/S in get_step(src,EAST))
				S.powernet = powernet

			for(var/obj/machinery/S in get_step(src,EAST))
				S.powernet = powernet
						//world << "power[x];[y]"

			for(var/obj/machinery/S in get_step(src,WEST))
				S.powernet = powernet
					//world << "power[x];[y]"

		if(zLevel == 1)
			for(var/obj/electro/cable/A in locate(x,y,z+1))
				if(A.powernet != 0)
					powernet = A.powernet

		if(zLevel == -1)
			for(var/obj/electro/cable/A in locate(x,y,z-1))
				if(A.powernet != 0)
					powernet = A.powernet

		if(reset == 1) // ебасброс
			powernet = 0
			reset = 0
			world << "ОБРЫВ КАБЕЛЯ"

		processing = 0

/obj/effect/sparks
	name = "spaks"
	icon = 'icons/obj/machine/HICH_VOLTAGE.dmi'
	icon_state = "sparks"

/obj/decor

/obj/decor/cable_part
	name = "cable"
	icon = 'icons/obj/machine/HICH_VOLTAGE.dmi'
	icon_state = "cable_part"

/obj/electro/cable/Del()
	var/obj/effect/sparks/S = new(src.loc)
	new /obj/decor/cable_part(src.loc)
	sleep(5)
	del(S)
	..()

/obj/machinery/generator
	name = "generator"
	icon = 'icons/obj/machine/power.dmi'
	icon_state = "generator"
	layer = 4

/obj/machinery/generator/act()
	usr << "Вы используете генератор"
	amperage += 500

/obj/machinery/generator/process()
	processing = 1
	objects += src
	generators += src
	spawn while(1)
		sleep(5)
		if(amperage > 0)
			amperage -= 50

/obj/machinery/generator/solar
	icon_state = "solar"

/obj/machinery/generator/solar/process()
	processing = 1
	objects += src
	generators += src
	spawn while(1)
		sleep(4)
		if(amperage > 0)
			amperage -= 50

		amperage += rand(55, 75)


/obj/machinery/generator/rad_gen
	icon_state = "rad_gen_off"

	New()
		process()

/obj/machinery/generator/rad_gen/act()
	return

/obj/machinery/generator/rad_gen/process()
	processing = 1
	objects += src
	generators += src
	var/ha = 0
	spawn while(1)
		sleep(1.5)
		processing = 1
		icon_state = "rad_gen_off"
		if(amperage > 0)
			amperage -= 50

		ha = pick(0,1)
		if(ha == 1)
			for(var/wave/radioactive/RAD in range(1,src))
				if(RAD.force > 1)
					amperage += rand(80,150)

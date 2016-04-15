/client/Topic(href,href_list[])
	if(href == "captain" && usr.client.ouch == 1)
		usr.loc = captain[rand(1,captain.len)]
		usr.client.create_hud()


		usr.client.ouch = 0

	if(href == "assistant" && usr.client.ouch == 1)
		usr.loc =assistant[rand(1,assistant.len)]
		usr.client.create_hud()
		usr.client.ouch = 0

	if(href == "engineer" && usr.client.ouch == 1)
		usr.loc = engineer[rand(1,engineer.len)]
		usr.client.create_hud()

		usr.client.ouch = 0

	if(href == "CE" && usr.client.ouch == 1)
		usr.loc = CE[rand(1,CE.len)]
		usr.client.create_hud()

		usr.client.ouch = 0

	if(href == "niga" && usr.client.ouch == 1)
		usr.client.mymcolor = "chocolate"
		usr.client.time_to_change = 1
		usr << "\blue Подождите немного..."

	if(href == "white" && usr.client.ouch == 1)
		usr.client.mymcolor = "white"
		usr.client.time_to_change = 1
		usr << "\blue Подождите немного..."

	if(href == "male" && usr.client.ouch == 1)
		usr.client.mygender = 1
		usr << "\blue Подождите немного..."
		usr.client.time_to_change = 1

	if(href == "female" && usr.client.ouch == 1)
		usr.client.mygender = 0
		usr.client.time_to_change = 1
		usr << "\blue Подождите немного..."

	if(href == "right")
		usr.client.dir = NORTH

	if(href == "left")
		usr.client.dir = SOUTH


	///CHEM DISPENSER
	if(href == "blood")
		for(var/obj/machinery/chemdispenser/D in range(1,usr))
			D.dispense("blood")

	if(href == "oil")
		for(var/obj/machinery/chemdispenser/D in range(1,usr))
			D.dispense("oil")

	if(href == "eth")
		for(var/obj/machinery/chemdispenser/D in range(1,usr))
			D.dispense("ethanol")

	if(href == "car")
		for(var/obj/machinery/chemdispenser/D in range(1,usr))
			D.dispense("carbon")

	if(href == "nit")
		for(var/obj/machinery/chemdispenser/D in range(1,usr))
			D.dispense("nitrogen")

	if(href == "oxy")
		for(var/obj/machinery/chemdispenser/D in range(1,usr))
			D.dispense("oxygen")

	if(href == "sil")
		for(var/obj/machinery/chemdispenser/D in range(1,usr))
			D.dispense("silicon")

	if(href == "get_")
		for(var/obj/machinery/chemdispenser/D in range(1,usr))
			D.get_container(usr)

	//RADIO

	if(href == "+freq")
		for(var/obj/machinery/radio/transmitter/T in range(1,usr))
			T.frequency += 1
			T.del_all_waves()
			T.waves()
			T.on = 0

	if(href == "-freq")
		for(var/obj/machinery/radio/transmitter/T in range(1,usr))
			T.frequency -= 1
			T.del_all_waves()
			T.waves()
			T.on = 0

	if(href == "+length")
		for(var/obj/machinery/radio/transmitter/T in range(1,usr))
			T.wave_length += 1
			T.on = 0


	if(href == "-length")
		for(var/obj/machinery/radio/transmitter/T in range(1,usr))
			T.wave_length -= 1
			T.on = 0


	if(href == "+freq_r")
		for(var/obj/machinery/radio/receiver/T in range(1,usr))
			T.frequency += 1

	if(href == "-freq_r")
		for(var/obj/machinery/radio/receiver/T in range(1,usr))
			T.frequency -= 1

	if(href == "+length_r")
		for(var/obj/machinery/radio/receiver/T in range(1,usr))
			T.wave_length += 1

	if(href == "-length_r")
		for(var/obj/machinery/radio/receiver/T in range(1,usr))
			T.wave_length -= 1

	//RADIO

	if(href == "on")
		for(var/obj/electro/powerbox/P in range(1,usr))
			for(var/obj/machinery/M in world)
				if(M.powernet == P.powernet)
					M.marker = 0

	if(href == "off")
		for(var/obj/electro/powerbox/P in range(1,usr))
			for(var/obj/machinery/M in world)
				if(M.powernet == P.powernet)
					M.marker = 1

	//VENDING

	else
		for(var/obj/machinery/vending/V in range(1,usr))
			if(V.myclick == 1)
				var/l = href_list["my_item"]
				var/what = text2num(href_list["my_what"])
				if(V.items_num[what] > 0)
					V.items_num[what] -= 1
					new l(V.loc)
					usr << "\blue <b>Автомат выдал вам [V.my_items[what]]</b>"

				if(V.items_num[what] == 0)
					usr << "\red <b>В автомате закончились все [V.my_items[what]]</b>"

				winshow(usr,"my_text",0)
				V.myclick = 0

	//VENDING
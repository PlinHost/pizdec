/client/Topic(href,href_list[])
	if(href == "lesorub" && usr.client.ouch == 1)
		usr.loc = lesorub[rand(1,lesorub.len)]
		usr.client.create_hud()


		usr.client.ouch = 0

	if(href == "hunt" && usr.client.ouch == 1)
		usr.loc = hunt[rand(1,hunt.len)]
		usr.client.create_hud()


		usr.client.ouch = 0

	if(href == "ass" && usr.client.ouch == 1)
		usr.loc = ass[rand(1,ass.len)]
		usr.client.create_hud()

		usr.client.ouch = 0

	if(href == "ultra" && usr.client.ouch == 1)
		usr.loc = ultraboy[rand(1,ultraboy.len)]
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

/*
	///CHEM DISPENSER
	if(href == "blood")
		dispense_chem(usr, "blood")

	if(href == "Fe")
		dispense_chem(usr, "Fe")

	if(href == "Ag")
		dispense_chem(usr, "Ag")

	if(href == "Au")
		dispense_chem(usr, "Au")

	if(href == "Cu")
		dispense_chem(usr, "Cu")

	if(href == "Pb")
		dispense_chem(usr, "Pb")

	if(href == "Po")
		dispense_chem(usr, "Po")

	if(href == "H")
		dispense_chem(usr, "H")

	if(href == "O")
		dispense_chem(usr, "O")

	if(href == "N")
		dispense_chem(usr, "N")

	if(href == "S")
		dispense_chem(usr, "S")

	if(href == "K")
		dispense_chem(usr, "K")

	if(href == "Cl")
		dispense_chem(usr, "Cl")

	if(href == "get_")
		get_container(usr)
*/
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

		for(var/obj/item/other/solid_reagents/SR in usr.contents)
			var/l = href_list["my_craft"]
			l = new l()
			var/atom/movable/A = l
			A.color = SR.color
			A.Move(usr.loc)
			for(var/reagent/R2 in SR.contents)
				R2.amount -= 80

	//VENDING
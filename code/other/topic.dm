/client/Topic(href)
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
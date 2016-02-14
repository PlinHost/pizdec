
/datum/trash_net
	var/list/disposals = list()

var/global/datum/trash_net/t_net = new()

/obj/machinery/trash
	var/water = 0
	icon = 'icons/trash.dmi'
	density = 1

/obj/machinery/trash/disposal
	var/open = 0
	var/connected = 0
	icon_state = "disposal"
	var/id

/obj/machinery/trash/disposal/act()
	world << "[trashnet]"

/*
/obj/machinery/trash/disposal/act_by_item(var/obj/item/I)
	if(usr.client.hand == 1)
		usr.client.R.overlays.Cut()
		usr.client.my_rhand_contents = 0
	else
		usr.client.L.overlays.Cut()
		usr.client.my_lhand_contents = 0



	var/mylen = 0
	var/list/disposals = list()

	for(var/obj/machinery/trash/outlet/G in t_net.disposals)
		if(G.trashnet == trashnet)
			mylen += 1
			disposals += G

	world << "[mylen] [t_net.disposals.len]"
	var/obj/machinery/trash/outlet/Z = disposals[rand(1,mylen)]
	if(Z.trashnet == trashnet)
		if(Z != src)
			sleep(1)
			for(I in usr)
				I.Move(Z.loc)

	disposals.Cut()
			//new I(Z.loc)
*/
/obj/machinery/trash/outlet/act()
	world << "[trashnet]"

/obj/machinery/trash/outlet/New()
	TRASHWAGEN_NET++
	trashnet = TRASHWAGEN_NET
	t_net.disposals += src
	process()


/obj/machinery/trash/outlet
	icon_state = "outlet"

/obj/machinery/trash/outlet/process()
	spawn while(1)
		sleep(0.2)
		for(var/obj/machinery/trash/pipe/P in range(1, src))
			if(P.trashnet != 0)
				trashnet = P.trashnet

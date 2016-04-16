
/datum/trash_net
	var/list/disposals = list()

var/global/datum/trash_net/t_net = new()

/obj/machinery/trash
	var/water = 0
	icon = 'icons/obj/trash.dmi'
	density = 1

/obj/machinery/trash/disposal
	var/open = 0
	var/connected = 0
	icon_state = "disposal"
	var/id

/obj/machinery/trash/disposal/act()
	world << "[trashnet]"


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

/obj/item/weapon/gun/lasergun
	icon = 'icons/obj/gun.dmi'
	icon_state = "advancelaser"

	pew()
		for(var/mob/M in range(5,src))
			M << "\red <b>Ïèó-ïèó!</b>"

		if(usr.dir == 1)
			var/turf/T = locate(usr.x, usr.y+1, usr.z)
			var/obj/beam/B = new(T)
			B.dir = 1
			B.attack_zone = usr.client.zone
			B.fly()

		if(usr.dir == 2)
			var/turf/T = locate(usr.x, usr.y-1, usr.z)
			var/obj/beam/B = new(T)
			B.dir = 2
			B.attack_zone = usr.client.zone
			B.fly()

		if(usr.dir == 4)
			var/turf/T = locate(usr.x+1, usr.y, usr.z)
			var/obj/beam/B = new(T)
			B.dir = 4
			B.attack_zone = usr.client.zone
			B.fly()

		if(usr.dir == 8)
			var/turf/T = locate(usr.x-1, usr.y, usr.z)
			var/obj/beam/B = new(T)
			B.dir = 8
			B.attack_zone = usr.client.zone
			B.fly()
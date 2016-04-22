/obj/machinery/hydroponics
	name = "hydroponics tray"
	icon = 'icons/obj/machine/hydroponics.dmi'
	icon_state = "hydrotray"
	density = 1
	anchored = 1
	var/waterlevel = 100	//The amount of water in the tray (max 100)
	var/maxwater = 100		//The maximum amount of water in the tray
	var/nutrilevel = 10		//The amount of nutrient in the tray (max 10)
	var/maxnutri = 10		//The maximum nutrient of water in the tray
	var/pestlevel = 0		//The amount of pests in the tray (max 10)
	var/weedlevel = 0		//The amount of weeds in the tray (max 10)
	var/yieldmod = 1		//Nutriment's effect on yield
	var/mutmod = 1			//Nutriment's effect on mutations
	var/toxic = 0			//Toxicity in the tray?
	var/age = 0				//Current age
	var/dead = 0			//Is it dead?
	var/health = 0			//Its health.
	var/lastproduce = 0		//Last time it was harvested
	var/lastcycle = 0		//Used for timing of cycles.
	var/cycledelay = 200	//About 10 seconds / cycle
	var/planted = 0			//Is it occupied?
	var/harvest = 0			//Ready to harvest?
	var/obj/item/seeds/myseed = null	//The currently planted seed
	var/unwrenchable = 1

	proc
		update_icon()

	New()
		process()

/obj/machinery/hydroponics/proc/adjustNutri(var/NUTRI)
	nutrilevel += NUTRI

/obj/machinery/hydroponics/proc/adjustHealth(var/HEALTH)
	health += HEALTH

/obj/machinery/hydroponics/proc/adjustWater(var/WATER)
	waterlevel += WATER

/obj/machinery/hydroponics/proc/adjustWeeds(var/WEED)
	weedlevel += WEED

/obj/machinery/hydroponics/proc/adjustToxic(var/TOXIC)
	toxic += TOXIC

/obj/machinery/hydroponics/proc/adjustPests(var/PEST)
	pestlevel += PEST

/obj/machinery/hydroponics/proc/plantdies() // OH NOES!!!!! I put this all in one function to make things easier
	health = 0
	harvest = 0
	pestlevel = 0 // Pests die
	if(!dead)
		update_icon()
		dead = 1

/obj/machinery/hydroponics/act_by_item(var/obj/item/O)
	if(istype(O, /obj/item/seeds))
		if(!planted)
			dead = 0
			planted = 1
			age = 1
			if(usr.client.my_hand_active == "left")
				if(istype(O, usr.client.lhand_items[1]))
					O.Move(src)
					usr << "\bold Вы суете [O] в [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(O, usr.client.rhand_items[1]))
					O.Move(src)
					usr << "\bold Вы суете [O] в [src]"
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()
			myseed = O
			health = myseed.endurance
			lastcycle = world.time

		else
			usr << "\red The [src] already has seeds in it!"

/obj/machinery/hydroponics/process()

	spawn while(1)
		sleep(5)

		if(myseed && (myseed.loc != src))
			myseed.loc = src

		if(planted && !dead)
				// Advance age
			age++

	//Nutrients//////////////////////////////////////////////////////////////
				// Nutrients deplete slowly
			if(prob(50))
				adjustNutri(-1)

				// Lack of nutrients hurts non-weeds
			if(nutrilevel <= 0 && myseed.plant_type != 1)
				adjustHealth(-rand(1,3))

	//Photosynthesis/////////////////////////////////////////////////////////
				// Lack of light hurts non-mushrooms
			if(isturf(loc))
				var/turf/currentTurf = loc
				var/lightAmt = currentTurf.sd_lumcount
				if(myseed.plant_type == 2) // Mushroom
					if(lightAmt < 2)
						adjustHealth(-1)
				else // Non-mushroom
					if(lightAmt < 4)
						adjustHealth(-2)

	//Water//////////////////////////////////////////////////////////////////
				// Drink random amount of water
			adjustWater(-rand(1,6))

				// If the plant is dry, it loses health pretty fast, unless mushroom
			if(waterlevel <= 10 && myseed.plant_type != 2)
				adjustHealth(-rand(0,1))
				if(waterlevel <= 0)
					adjustHealth(-rand(0,2))

				// Sufficient water level and nutrient level = plant healthy
			else if(waterlevel > 10 && nutrilevel > 0)
				adjustHealth(rand(1,2))
				if(prob(5))  //5 percent chance the weed population will increase
					adjustWeeds(1)

	//Toxins/////////////////////////////////////////////////////////////////

				// Too much toxins cause harm, but when the plant drinks the contaiminated water, the toxins disappear slowly
			if(toxic >= 40 && toxic < 80)
				adjustHealth(-1)
				adjustToxic(-rand(1,10))
			else if(toxic >= 80) // I don't think it ever gets here tbh unless above is commented out
				adjustHealth(-3)
				adjustToxic(-rand(1,10))

	//Pests & Weeds//////////////////////////////////////////////////////////

			else if(pestlevel >= 5)
				adjustHealth(-1)

				// If it's a weed, it doesn't stunt the growth
			if(weedlevel >= 5 && myseed.plant_type != 1 )
				adjustHealth(-1)

	//Health & Age///////////////////////////////////////////////////////////

				// Plant dies if health <= 0
			if(health <= 0)
				plantdies()
				adjustWeeds(1) // Weeds flourish

				// If the plant is too old, lose health fast
			if(age > myseed.lifespan)
				adjustHealth(-rand(1,5))

				// Harvest code
			if(age > myseed.production && (age - lastproduce) > myseed.production && (!harvest && !dead))
				if(myseed && myseed.yield != -1) // Unharvestable shouldn't be harvested
					harvest = 1
				else
					lastproduce = age
			if(prob(5))  // On each tick, there's a 5 percent chance the pest population will increase
				adjustPests(1)
		else
			if(waterlevel > 10 && nutrilevel > 0 && prob(10))  // If there's no plant, the percentage chance is 10%
				adjustWeeds(1)

			// Weeeeeeeeeeeeeeedddssss
	return

/obj/machinery/hydroponics/act(mob/user as mob)
	if(harvest)
		if(!user in range(1,src))
			return
		myseed.harvest()
		harvest = 0
	else if(dead)
		planted = 0
		dead = 0
		usr << text("You remove the dead plant from the [src].")
		del(myseed)
	else
		if(planted && !dead)
			usr << text("The [src] has \blue [myseed.plantname] \black planted.")
			if(health <= (myseed.endurance / 2))
				usr << text("The plant looks unhealthy")
		else
			usr << text("The [src] is empty.")
		usr << text("Water: [waterlevel]/100")
		usr << text("Nutrient: [nutrilevel]/10")
		if(weedlevel >= 5) // Visual aid for those blind
			usr << text("The [src] is filled with weeds!")
		if(pestlevel >= 5) // Visual aid for those blind
			usr << text("The [src] is filled with tiny worms!")
		usr << text ("") // Empty line for readability.

/obj/item/seeds/proc/harvest(mob/user = usr)
	var/obj/item/seeds/produce = product
	var/obj/machinery/hydroponics/parent = loc //for ease of access
	var/t_amount = 0


	var/num_of_harvest = rand(0,5)
	while(num_of_harvest > 0)
		new produce(user.loc, potency) // User gets a consumable
		num_of_harvest -= 1
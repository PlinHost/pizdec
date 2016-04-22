// ********************************************************
// Here's all the seeds (plants) that can be used in hydro
// ********************************************************

/obj/item/device/analyzer/plant_analyzer

/obj/item/seeds
	name = "pack of seeds"
	icon = 'icons/obj/item/seeds.dmi'
	icon_state = "seed"				//Unknown plant seed - these shouldn't exist in-game.
	var/plantname = "Plants"		//Name of plant when planted.
	var/product						//A type path. The thing that is created when the plant is harvested.
	var/species = ""				//Used to update icons. Should match the name in the sprites.
	var/lifespan = 0 				//How long before the plant begins to take damage from age.
	var/endurance = 0 				//Amount of health the plant has.
	var/maturation = 0 				//Used to determine which sprite to switch to when growing.
	var/production = 0 				//Changes the amount of time needed for a plant to become harvestable.
	var/yield = 0					//Amount of growns created per harvest. If is -1, the plant/shroom/weed is never meant to be harvested.
	var/oneharvest = 0				//If a plant is cleared from the tray after harvesting, e.g. a carrot.
	var/potency = -1				//The 'power' of a plant. Generally effects the amount of reagent in a plant, also used in other ways.
	var/growthstages = 0			//Amount of growth sprites the plant has.
	var/plant_type = 0				//0 = 'normal plant'; 1 = weed; 2 = shroom
	var/rarity = 0					//How rare the plant is. Used for giving points to cargo when shipping off to Centcom.
	var/list/mutatelist = list()	//The type of plants that this plant can mutate into.

/obj/item/seeds/act_by_item(var/obj/item/O)
	if (istype(O, /obj/item/device/analyzer/plant_analyzer))
		usr << "*** <B>[plantname]</B> ***"
		usr << "-Plant Endurance: <span class='notice'> [endurance]</span>"
		usr << "-Plant Lifespan: <span class='notice'> [lifespan]</span>"
		usr << "-Species Discovery Value: <span class='notice'> [rarity]</span>"
		if(yield != -1)
			usr << "-Plant Yield: <span class='notice'> [yield]</span>"
		usr << "-Plant Production: <span class='notice'> [production]</span>"
		if(potency != -1)
			usr << "-Plant Potency: <span class='notice'> [potency]</span>"
		return
	..() // Fallthrough to item/attackby() so that bags can pick seeds up


/obj/item/seeds/grapeseed
	name = "pack of grape seeds"
	desc = "These seeds grow into grape vines."
	icon_state = "seed-grapes"
	species = "grape"
	plantname = "Grape Vine"
	product = /obj/item/weapon/reagent_containers/food/snacks/grown/grapes
	lifespan = 50
	endurance = 25
	maturation = 3
	production = 5
	yield = 4
	potency = 10
	plant_type = 0
	growthstages = 2
	mutatelist = list(/obj/item/seeds/greengrapeseed)

/obj/item/seeds/greengrapeseed
	name = "pack of green grape seeds"
	desc = "These seeds grow into green-grape vines."
	icon_state = "seed-greengrapes"
	species = "greengrape"
	plantname = "Green-Grape Vine"
	product = /obj/item/weapon/reagent_containers/food/snacks/grown/greengrapes
	lifespan = 50
	endurance = 25
	maturation = 3
	production = 5
	yield = 4
	potency = 10
	plant_type = 0
	growthstages = 2
	rarity = 0 // Technically it's a beneficial mutant, but it's not exactly "new"...

/obj/item/seeds/bananaseed
	name = "pack of banana seeds"
	desc = "They're seeds that grow into banana trees. When grown, keep away from clown."
	icon_state = "seed-banana"
	species = "banana"
	plantname = "Banana Tree"
	product = /obj/item/weapon/reagent_containers/food/snacks/grown/banana
	lifespan = 50
	endurance = 30
	maturation = 6
	production = 6
	yield = 3
	potency = 10
	plant_type = 0
	growthstages = 6
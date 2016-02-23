#define SOLID 1
#define LIQUID 2
#define GAS 3

//The reaction procs must ALWAYS set src = null, this detaches the proc from the object (the reagent)
//so that it can continue working when the reagent is deleted while the proc is still active.

datum
	reagent
		var/name = "Reagent"
		var/id = "reagent"
		var/description = ""
		var/datum/reagents/holder = null
		var/reagent_state = SOLID
		var/data = null
		var/volume = 0

		proc
			reaction_mob(var/mob/human/M, var/volume) //By default we have a chance to transfer some
				var/datum/reagent/self = src
				src = null										  //of the reagent to the mob on TOUCHING it.

				var/chance = 1
				//for(var/obj/item/clothing/C in M.contents)
				//	if(C.permeability_coefficient < chance) chance = C.permeability_coefficient
				//chance = chance * 100

				if(prob(chance))
					if(M.reagents)
						M.reagents.add_reagent(self.id,self.volume/2)
					return

			reaction_obj(var/obj/O, var/volume) //By default we transfer a small part of the reagent to the object
				src = null						//if it can hold reagents. nope!
				//if(O.reagents)
				//	O.reagents.add_reagent(id,volume/3)
				return

			reaction_turf(var/turf/T, var/volume)
				src = null
				return

			on_mob_life(var/mob/M)
				holder.remove_reagent(src.id, 0.4) //By default it slowly disappears.
				return

		nothing
			name = "nothing"
			id = "nothing"
			reagent_state = GAS

		poison
			name = "poison"
			id = "poison"
			reagent_state = LIQUID

			reaction_mob(var/mob/M)
				if(!M) M = holder.my_atom
				usr << "\red Вы чувствуете головокружение"
				for(var/obj/item/organs/O in M)
					O.hit_points -= 10
				..()
				return
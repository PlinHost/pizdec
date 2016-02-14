/mob/human
	proc/organ_damage_calculate()
		var/sum
		var/burn_damage
		for(var/obj/item/organs/O in usr)
			sum += round(O.hit_points / 6)
			burn_damage += round(O.burn_points / 6)
		state_of_health = sum - burn_damage

		if(state_of_health < 3)
			signal = 1
			lying()
			usr << "\red Душа уходит прочь"
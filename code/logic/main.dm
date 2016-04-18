/obj/machinery/logic_elements
	icon = 'icons/obj/machine/logical.dmi'
	var/current_state = 0 //0 or 1

	proc/calculate(var/n, var/n_2)
		return

	proc/connect()
		var/turf/X_1 = locate(x+1, y, z)
		var/turf/X_2 = locate(x-1, y, z)

		var/turf/Y_1 = locate(x, y+1, z)
		var/turf/Y_2 = locate(x, y-1, z)

		var/count = 0
		var/list/nums = list(0,0)

		if(dir == 1)
			for(var/obj/machinery/logic_elements/LE in X_1)
				count += 1
				nums[1] = LE.current_state

			for(var/obj/machinery/logic_elements/LE in X_2)
				count += 1
				nums[2] = LE.current_state

			if(count == 2)
				current_state = calculate(nums[1], nums[2])

			for(var/obj/machinery/logic_elements/LE in Y_1)
				return LE



		if(dir == 2)
			for(var/obj/machinery/logic_elements/LE in X_1)
				count += 1
				nums[1] = LE.current_state

			for(var/obj/machinery/logic_elements/LE in X_2)
				count += 1
				nums[2] = LE.current_state

			if(count == 2)
				current_state = calculate(nums[1], nums[2])

			for(var/obj/machinery/logic_elements/LE in Y_2)
				return LE

		if(dir == 4)

			for(var/obj/machinery/logic_elements/LE in Y_1)
				count += 1
				nums[1] = LE.current_state

			for(var/obj/machinery/logic_elements/LE in Y_2)
				count += 1
				nums[2] = LE.current_state

			if(count == 2)
				current_state = calculate(nums[1], nums[2])

			for(var/obj/machinery/logic_elements/LE in X_1)
				return LE

		if(dir == 8)

			for(var/obj/machinery/logic_elements/LE in Y_1)
				count += 1
				nums[1] = LE.current_state

			for(var/obj/machinery/logic_elements/LE in Y_2)
				count += 1
				nums[2] = LE.current_state

			if(count == 2)
				current_state = calculate(nums[1], nums[2])

			for(var/obj/machinery/logic_elements/LE in X_2)
				return LE

		return 0

	proc/start()
		if(connect() != 0)
			var/obj/machinery/logic_elements/LE = connect()
			world << current_state
			LE.start()

	act()
		start()

/obj/machinery/logic_elements/negative
	icon_state = "no"

	calculate(var/n)

		if(n == 0)
			n = 1
			return n
		else
			n = 0
			return n

	connect()
		var/turf/X_1 = locate(x+1, y, z)
		var/turf/X_2 = locate(x-1, y, z)

		var/turf/Y_1 = locate(x, y+1, z)
		var/turf/Y_2 = locate(x, y-1, z)

		if(dir == 1)
			for(var/obj/machinery/logic_elements/LE in Y_1)
				current_state = calculate(LE.current_state)
				return LE

		if(dir == 2)
			for(var/obj/machinery/logic_elements/LE in Y_2)
				current_state = calculate(LE.current_state)
				return LE

		if(dir == 4)
			for(var/obj/machinery/logic_elements/LE in X_1)
				current_state = calculate(LE.current_state)
				return LE

		if(dir == 8)
			for(var/obj/machinery/logic_elements/LE in X_2)
				current_state = calculate(LE.current_state)
				return LE

		return 0

	start()
		if(connect() != 0)
			var/obj/machinery/logic_elements/LE = connect()
			world << current_state
			LE.start()

/obj/machinery/logic_elements/multiply
	icon_state = "logic_multiply"

	calculate(var/a, var/b)
		var/n
		if(a == 0 || b == 0)
			n = 0
			return n

		else if(a == 1 && b == 1)
			n = 1
			return n

		else
			return 0


/obj/machinery/logic_elements/addition
	icon_state = "logic_add"

	calculate(var/a, var/b)
		var/n
		if(a == 1 || b == 1)
			n = 1
			return n
		else
			n = 0
			return n

/obj/machinery/logic_elements/equal
	icon_state = "logic_equal"

	calculate(var/a, var/b)
		var/n
		if(a == b)
			n = 1
			return n
		else
			n = 0
			return n
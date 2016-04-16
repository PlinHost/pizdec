/obj/machinery/logic_elements
	icon = 'icons/obj/machine/logical.dmi'

	proc/calculate(var/n)
		return

/obj/machinery/logic_elements/negative
	icon_state = "no"

	calculate(var/n)

		if(n == 0)
			n = 1
			return n
		else
			n = 0
			return n

/obj/machinery/logic_elements/multiply
	icon_state = "logic_multiply"

	calculate(var/a, var/b)
		var/n
		if(a == 0 || b == 0)
			n = 0
			return n
		else
			n = 1
			return n

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
/obj/item
	var/medical_power = 0

/obj/item/medical
	icon = 'icons/obj/item/medbay.dmi'

/obj/item/medical/brute/gel
	icon_state = "medgel"
	name = "medgel"
	medical_power = 5

/obj/item/medical/brute/gel/advance
	icon_state = "medgel_advance"
	name = "medgel+"
	medical_power = 10

/obj/item/medical/brute/gel/super
	icon_state = "medgel_super"
	name = "medgel super"
	medical_power = 25

/obj/item/medical/burn/gel
	icon_state = "firegel"
	name = "firegel"
	medical_power = 25

/obj/item/medical/pill/force
	icon_state = "pill"
	name = "FORCE"
	medical_power = 10

	act_self()
		usr.client.can_get += 10
		usr << "\blue <b>¬ы чувствуете небывалый прилив силы!</b>"
		del_from_hand()

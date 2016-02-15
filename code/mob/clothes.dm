#define SUIT_LAYER 28
#define HEAD_LAYER 28
#define UNIFORM_LAYER 27
#define SHOES_LAYER 26

/obj/item/clothing
	icon = 'icons/clothes.dmi'
	var/on_mob_sprite
	var/on_mob_sprite_lying

	New()
		on_mob_sprite = "[icon_state]_onme"
		on_mob_sprite_lying = "[icon_state]_onme_l"

	act_self()
		world << "[on_mob_sprite]"

//// ÑÜÞÒÛ ////

/obj/item/clothing/suit
	layer = SUIT_LAYER

/obj/item/clothing/suit/SYN
	name = "space_suit"
	icon_state = "syndi"
	weight = 34

/obj/item/clothing/suit/SPACE
	name = "space_suit"
	icon_state = "space"
	weight = 34

//// ÃÎËÎÂÀ ////

/obj/item/clothing/head
	layer = HEAD_LAYER

/obj/item/clothing/head/HELMET
	name = "space_helmet"
	icon_state = "space_helm"

/obj/item/clothing/head/HELMET_SYN
	name = "space_helmet"
	icon_state = "syndi_helm"

//// ÓÍÈÔÎÐÌÀ ////

/obj/item/clothing/uniform
	layer = UNIFORM_LAYER

/obj/item/clothing/uniform/BLACK
	name = "blacksuit"
	icon_state = "blacksuit"

/obj/item/clothing/uniform/CHATERED
	name = "checkered"
	icon_state = "checkered"

//// ÎÁÓÂÜ ////

/obj/item/clothing/shoes
	layer = SHOES_LAYER

/obj/item/clothing/shoes/BLACK
	name = "black shoes"
	icon_state = "bl"

/obj/item/clothing/shoes/COOL
	name = "warmboots"
	icon_state = "wr"

//ON BODY, BITCH!

/obj/item/body
	icon = 'icons/clothes.dmi'

/obj/item/body/head
	layer = HEAD_LAYER

/obj/item/body/head/HELMET
	name = "space_helmet"
	icon_state = "space_h"

/obj/item/body/head/HELMET_SYN
	name = "space_helmet"
	icon_state = "syndi_h"

/obj/item/body/shoes
	layer = SHOES_LAYER

/obj/item/body/shoes/BLACK
	name = "black shoes"
	icon_state = "black"

/obj/item/body/shoes/COOL
	name = "warmboots"
	icon_state = "warmboots"
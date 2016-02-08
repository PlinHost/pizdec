#define SUIT_LAYER 28
#define HEAD_LAYER 28
#define UNIFORM_LAYER 27
#define SHOES_LAYER 26

/obj/items/clothes
	icon = 'icons/clothes.dmi'

//// —‹ﬁ“€ ////

/obj/items/clothes/suit
	layer = SUIT_LAYER

/obj/items/clothes/suit/SYN
	name = "space_suit"
	icon_state = "syndi"
	weight = 34

/obj/items/clothes/suit/SPACE
	name = "space_suit"
	icon_state = "space"
	weight = 34

//// √ŒÀŒ¬¿ ////

/obj/items/clothes/head
	layer = HEAD_LAYER

/obj/items/clothes/head/HELMET
	name = "space_helmet"
	icon_state = "space_helm"

/obj/items/clothes/head/HELMET_SYN
	name = "space_helmet"
	icon_state = "syndi_helm"

//// ”Õ»‘Œ–Ã¿ ////

/obj/items/clothes/uniform
	layer = UNIFORM_LAYER

/obj/items/clothes/uniform/BLACK
	name = "blacksuit"
	icon_state = "blacksuit"

/obj/items/clothes/uniform/CHATERED
	name = "checkered"
	icon_state = "checkered"

//// Œ¡”¬‹ ////

/obj/items/clothes/shoes
	layer = SHOES_LAYER

/obj/items/clothes/shoes/BLACK
	name = "black shoes"
	icon_state = "bl"

/obj/items/clothes/shoes/COOL
	name = "warmboots"
	icon_state = "wr"

//ON BODY, BITCH!

/obj/items/body
	icon = 'icons/clothes.dmi'

/obj/items/body/head
	layer = HEAD_LAYER

/obj/items/body/head/HELMET
	name = "space_helmet"
	icon_state = "space_h"

/obj/items/body/head/HELMET_SYN
	name = "space_helmet"
	icon_state = "syndi_h"

/obj/items/body/shoes
	layer = SHOES_LAYER

/obj/items/body/shoes/BLACK
	name = "black shoes"
	icon_state = "black"

/obj/items/body/shoes/COOL
	name = "warmboots"
	icon_state = "warmboots"
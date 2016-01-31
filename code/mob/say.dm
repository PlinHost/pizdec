/mob/human/verb/say(t as text)
	for(var/mob/M in range(15,src))
		M << "[usr] говорит, \"[t]\""

	for(var/obj/machinery/radio/intercom/I in range(5, src))
		I.send_message(t)

/mob/human/verb/me(t as text)
	for(var/mob/M in range(15,src))
		M << "[usr] [t]"

/mob/human/verb/ooc(t as text)
	 world << "\blue OOC [usr]: [t]"
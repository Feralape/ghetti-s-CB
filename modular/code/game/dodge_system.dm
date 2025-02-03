

//armor stiffness based dodge system by vide noir
//since armor defines are retarded here I gotta use stiffness to simplify.
/mob/living/carbon/human/bullet_act(obj/item/projectile/P, def_zone)
	if(stat == CONSCIOUS && !buckled) //are we awake and unbuckled?
		//dodge is good against single shots, but probably wont save you from an automatic.
		//i like to not rely shit too much on RNG although it might be good in this case.
		var/hitchance = rand(0,100)
		if(wear_suit)
			switch(wear_suit.stiffness)
				if(0 to LIGHT_STIFFNESS)
					hitchance -= 50 //+50% chance to dodge.
				if(MEDIUM_STIFFNESS to HEAVY_STIFFNESS)
					hitchance -= 25 //+25% chance to dodge.
				if(HEAVY_STIFFNESS to 3)
					hitchance -= 0 //+0% chance to dodge.
		else
			hitchance -= 50 //No armor, +60% chance to dodge.

		if(last_move_time > world.time - 1 SECONDS)
			hitchance -= rand(5,10) //You're harder to hit if you're moving.

		if(lying) //harder to hit if laying prone.
			hitchance -= rand(5,10)
		
		if(def_zone == BODY_ZONE_CHEST) //chest is easier to hit.
			hitchance += rand(5,10)

		hitchance = max(5, hitchance) //never below 5.

		if(!prob(hitchance))
			var/x_o = initial(pixel_x)
			var/y_o = initial(pixel_y)
			animate(src, pixel_x = x_o+rand(-4, 4), pixel_y = y_o+rand(-4, 4), time = 2, easing = ELASTIC_EASING|EASE_IN)
			animate(pixel_x = x_o, pixel_y = y_o, time = 2, easing = CIRCULAR_EASING|EASE_OUT)
			if(P.miss_sound)
				playsound_local(get_turf(src), P.miss_sound, 75, TRUE)
			handle_projectile_attack_redirection(P, REDIRECT_METHOD_PASSTHROUGH, TRUE)
			return BULLET_ACT_FORCE_PIERCE
	. = ..()

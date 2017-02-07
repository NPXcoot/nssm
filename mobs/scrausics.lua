mobs:register_mob("nssm:scrausics", {
	type = "monster",
	hp_max = 33,
	hp_min = 22,
	collisionbox = {-0.4, -0.3, -0.4, 0.4, 0.3, 0.4},
	visual = "mesh",
	mesh = "scrausics.x",
	textures = {{"scrausics.png"}},
	visual_size = {x=10, y=10},
	view_range = 35,
	walk_velocity = 2,
	run_velocity = 3,
	fall_speed = 0,
	stepheight = 3,
	floats=1,
	sounds = {
		random = "scrausics",
		distance = 40,
	},
	damage = 4,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 3,
		max = 4,},
		{name = "nssm:raw_scrausics_wing",
		chance = 1,
		min = 1,
		max = 2,},
	},
	armor = 80,
	drawtype = "front",
	water_damage = 5,
	lava_damage = 5,
	light_damage = 0,
	group_attack=true,
	attack_animals=true,
	follow = {"farming:wheat"},
	knock_back=2,
	blood_texture="nssm_blood.png",
	on_rightclick = nil,
	fly = true,
	attack_type = "dogfight",
	animation = {
		speed_normal = 25,
		speed_run = 25,
		speed_die = 20,
		stand_start = 220,
		stand_end = 280,
		walk_start = 140,
		walk_end = 180,
		run_start = 190,
		run_end = 210,
		punch_start = 20,
		punch_end = 50,
		die_start = 290,
		die_end = 310,
		punch2_start = 60,
		punch2_end = 100,
	},
	do_custom = function(self, dtime)

		-- set needed values if not already present
		if not self.v2 then
			self.v2 = 0
			self.max_speed_forward = 6
			self.max_speed_reverse = 2
			self.accel = 6
			self.terrain_type = 3
			self.driver_attach_at = {x = -0.05, y = 1, z = 0}
			self.driver_eye_offset = {x = 0, y = -2, z = 0}
			self.driver_scale = {x = 0.09, y = 0.09}
		end

		-- if driver present allow control of horse
		if self.driver then

			mobs.drive(self, "punch2", "stand", true, dtime)

			return false -- skip rest of mob functions
		end

		return true
	end,

	on_die = function(self, pos)

		-- drop saddle when horse is killed while riding
		-- also detach from horse properly
		if self.driver then
			minetest.add_item(pos, "mobs:saddle")
			mobs.detach(self.driver, {x = 1, y = 0, z = 1})
		end

	end,

	on_rightclick = function(self, clicker)

		-- make sure player is clicking
		if not clicker or not clicker:is_player() then
			return
		end

		-- feed, tame or heal horse
		if mobs:feed_tame(self, clicker, 10, true, true) then
			return
		end

		-- make sure tamed horse is being clicked by owner only
		if self.tamed and self.owner == clicker:get_player_name() then

			local inv = clicker:get_inventory()

			-- detatch player already riding horse
			if self.driver and clicker == self.driver then

				mobs.detach(clicker, {x = 1, y = 0, z = 1})

				-- add saddle back to inventory
				if inv:room_for_item("main", "mobs:saddle") then
					inv:add_item("main", "mobs:saddle")
				else
					minetest.add_item(clicker.getpos(), "mobs:saddle")
				end

			-- attach player to horse
			elseif not self.driver
			and clicker:get_wielded_item():get_name() == "mobs:saddle" then

				self.object:set_properties({stepheight = 1.1})
				mobs.attach(self, clicker)

				-- take saddle from inventory
				inv:remove_item("main", "mobs:saddle")
			end
		end

		-- used to capture horse with magic lasso
		mobs:capture_mob(self, clicker, 0, 0, 80, false, nil)
	end
})

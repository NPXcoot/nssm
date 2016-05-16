mobs:register_mob("nssm:morgut", {
	type = "monster",
	hp_max = 20,
	hp_min = 17,
	collisionbox = {-0.3, 0.00, -0.3, 0.3, 1.8, 0.3},
	visual = "mesh",
	rotate= 270,
	mesh = "morgut.x",
	textures = {{"morgut.png"}},
	visual_size = {x=5, y=5},
	makes_footstep_sound = true,
	view_range = 20,
	walk_velocity = 0.5,
	reach =2,
	run_velocity = 3.5,
	damage = 4,
	runaway = true,
	jump = true,
    --[[sounds = {
		random = "",
	},]]
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 1,
		max = 1,},
	},
	armor = 70,
	drawtype = "front",
	water_damage = 0,
	fear_height = 4,
	floats = 1,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 10,
		stand_end = 40,
		walk_start = 50,
		walk_end = 90,
		run_start = 100,
		run_end = 120,
		punch_start = 130,
		punch_end = 160,
	},

	do_custom = function (self)
		self.flag = (self.flag or 0)

		--[[if self.flag == 1 then
			local pyaw = self.curr_attack:get_look_yaw()
			self.object:setyaw(pyaw + self.rotate)
			set_velocity(self, run_velocity)
		end
		]]
	end,
	custom_attack = function (self)
		self.curr_attack = (self.curr_attack or self.attack)
		self.morgut_timer = (self.morgut_timer or os.time())
		if (os.time() - self.morgut_timer) > 1 then
			self.morgut_timer = os.time()

			local s = self.object:getpos()
			local p = self.attack:getpos()

			set_animation(self, "punch")

			self.flag = 1
			self.curr_attack = self.attack
			self.state = "runaway"
			local pyaw = self.curr_attack: get_look_yaw()
			self.object:setyaw(pyaw)
			set_velocity(self, self.run_velocity)

			minetest.chat_send_all("Stato = "..self.state)
		end
	end,
})

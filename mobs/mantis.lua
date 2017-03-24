mobs:register_mob("nssm:mantis", {
	type = "monster",
	hp_max = 26,
	hp_min = 24,
	collisionbox = {-0.5, 0.00, -0.5, 0.5, 2.30, 0.5},
	visual = "mesh",
	mesh = "mantis.x",
	rotate=270,
	textures = {{"mantis.png"}},
	visual_size = {x=4, y=4},
	makes_footstep_sound = true,
	view_range = 20,
	fear_height = 4,
	walk_velocity = 0,
	run_velocity = 3.5,
    sounds = {
		random = "manti",
	},
	damage = 4,
	jump = true,
	drops = {
		{name = "nssm:mantis_claw",
		chance = 2,
		min = 1,
		max = 4,},
		{name = "nssm:life_energy",
		chance = 1,
		min = 1,
		max = 2,},
		{name = "nssm:mantis_skin",
		chance = 3,
		min = 1,
		max = 2,},
		{name = "nssm:mantis_meat",
		chance = 2,
		min = 1,
		max = 2,},
	},
	armor = 70,
	drawtype = "front",
	water_damage = 2,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	group_attack=true,
	attack_animals=true,
	knock_back=2,
	blood_texture="nssm_blood_blue.png",
	stepheight=1.1,
	double_melee_attack = true,
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 25,
		stand_start = 40,
		stand_end = 40,
		walk_start = 40,
		walk_end = 40,
		run_start = 10,
		run_end = 30,
		punch_start = 40,
		punch_end = 70,
		speed_die = 10,
		die_start = 110,
		die_end = 130,
		punch2_start = 80,
		punch2_end = 110,
	},
--[[	do_custom = function (self)
		if self.state == "attack" then
			self.textures = {"mantis.png"}
			self.object:set_properties(self)
			--self.object:set_properties({textures = {{"mantis.png"}}})
		else
			self.textures = {"mantis-alfa.png"}
			self.object:set_properties(self)
		--	self.object:set_properties({textures = {{"mantis-alfa.png"}},})
		end
	end,]]
})

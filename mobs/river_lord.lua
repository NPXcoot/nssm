mobs:register_mob("nssm:river_lord", {
	type = "monster",
	hp_max = 36,
	hp_min = 27,
	collisionbox = {-0.6, 0, -0.6, 0.6, 3, 0.6},
	visual = "mesh",
	mesh = "river_lord.x",
	textures = {{"river_lord.png"}},
	visual_size = {x=4, y=4},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 0.6,
	rotate = 270,
	fear_height = 4,
	run_velocity = 5,
	--[[sounds = {
		random = "river_lord",
	},]]
	damage = 6,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 3,
		max = 4},
    },
	armor = 70,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 5,
	reach = 6,
	light_damage = 0,
	--group_attack=true,
	--attack_animals=true,
	knock_back=0,
	blood_texture="nssm_blood.png",
	stepheight=2.1,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 20,
		stand_start = 20,
		stand_end = 100,
		walk_start = 110,
		walk_end = 150,
		run_start = 160,
		run_end = 180,
		punch_start = 260,
		punch_end = 280,
		punch2_start = 230,	--charge_start
		punch2_end = 250,	--charge_end
		die_start = 290,
		die_end = 310,
		speed_die = 10,
		--Arena di fango inizio: 190
		--Arena di fango fine: 220
    },
	do_custom = function (self)
		if self.other_state and self.other_state == "charge" then
			do_charge(self)
		end
	end,
	custom_attack = function (self)
		charge_attack(self)
	end,
})

nssm:register_mob("nssm:kraken", {
	type = "monster",
	hp_max = 300,
	hp_min = 300,
	collisionbox = {-2, 0, -2, 2, 4, 2},
	visual = "mesh",
	mesh = "kraken.x",
	textures = {{"kraken.png"}, {"kraken2.png"}},
	visual_size = {x=15, y=15},
	lifetimer=500,
	inker = false,
	view_range = 50,
	fly = true,
	fly_in = "default:water_source",
	fall_speed = -1,
	walk_velocity = 3.5,
	run_velocity = 4.5,
	damage = 8,
	rotate = 270,
	jump = false,
	jump_chance = 0,
	jump_height = 0,
  sounds = {
		random = "kraken",
	},
	drops = {
                {name = "homedecor:coin",
                chance = 1,
                min = 5,
                max = 9,},
		{name = "nssm:tentacle",
		chance = 1,
		min = 30,
		max = 40,},
		{name = "default:mese_block",
		chance = 3,
		min = 1,
		max = 3,},
		{name = "default:diamond_block",
		chance = 3,
		min = 1,
		max = 3,},
		{name = "default:nyancat",
		chance = 3,
		min = 5,
		max = 9,},
	},
	armor = 45,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	reach=8,
	animation = {
		speed_normal = 20,
		speed_run = 30,
		stand_start = 1,
		stand_end = 40,
		walk_start = 60,
		walk_end = 100,
		run_start = 60,
		run_end = 100,
		punch_start = 120,
		punch_end = 150,
	}
})

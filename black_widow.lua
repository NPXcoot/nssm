nssm:register_mob("nssm:black_widow", {
	type = "monster",
	hp_max = 20,
	hp_min = 19,
	collisionbox = {-0.4, 0.00, -0.4, 0.4, 0.8, 0.4},
	visual = "mesh",
	mesh = "black_widow.x",
	textures = {{"black_widow.png"}},
	visual_size = {x=2, y=2},
	makes_footstep_sound = true,
	view_range = 15,
	fear_height = 4,
	walk_velocity = 1,
	run_velocity = 2.5,
    rotate = 270,
  sounds = {
		random = "black_widow",
	},
	damage = 3,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 1,
		max = 2,},
		{name = "nssm:spider_leg",
		chance = 2,
		min = 1,
		max = 8,},
		{name = "nssm:web",
		chance = 2,
		min = 1,
		max = 2,},
	},
	armor = 100,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 7,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 25,
		stand_start = 1,
		stand_end = 70,
		walk_start = 80,
		walk_end = 120,
		run_start = 120,
		run_end = 140,
		punch_start = 150,
		punch_end = 160,
	},
	do_custom = function(self)
		--Webber: puts web around himself
		local pos = self.object:getpos()
		if (math.random(1,75)==1) then
			local dx=math.random(1,3)
			local dz=math.random(1,3)
			local p = {x=pos.x+dx, y=pos.y-1, z=pos.z+dz}
			local t = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
			local n = minetest.env:get_node(p).name
			local k = minetest.env:get_node(t).name
			if ((n~="air")and(k=="air")) then
				minetest.env:set_node(t, {name="nssm:web"})
			end
		end
	end,
})

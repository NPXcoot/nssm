--[[nssm:register_mob("nssm:dahaka", {
	type = "monster",
	hp_max = 80,
	hp_min = 80,
	collisionbox = {-0.85, -0.30, -0.85, 0.85, 4.50, 0.85},
	visual = "mesh",
	mesh = "dahaka.x",
	textures = {{"dahaka.png", "dahaka_sand.png"}},
	visual_size = {x=4, y=4},
	lifetimer=500,
	makes_footstep_sound = true,
	view_range = 30,
	fear_height = 4,
	walk_velocity = 2,
	run_velocity = 2,
	damage = 8,
	reach = 3,
	jump = false,
	jump_chance = 0,
	drops = {
			{name = "nssm:life_energy",
		chance = 1,
		min = 7,
		max = 9,},
		{name = "nssm:black_sand",
	chance = 1,
	min = 1,
	max = 1,},
	},
	armor = 40,
	drawtype = "front",
    sounds = {
		random = "dakaka",
	},
	water_damage = 20,
	lava_damage = 0,
	light_damage = 0,
  rotate = 270,
	on_rightclick = nil,
  mele_number =2,
	attack_type = "dogfight",
	animation = {
		speed_normal = 25,
		speed_run = 40,
		stand_start = 230,
		stand_end = 290,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
		punch_start = 300,
		punch_end = 330,
		punch1_start = 120,
		punch1_end = 155,
	},
	do_custom = function (self)
		--Digging ability
		local v = self.object:getvelocity()
		local pos = self.object:getpos()
		local c=3
		for dx = -c*(math.abs(v.x))-1 , c*(math.abs(v.x))+1 do
			for dy=0,5 do
				for dz = -c*(math.abs(v.z))-1 , c*(math.abs(v.z))+1 do
					local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(p).name
					if (n~="default:water_source" and n~="default:water_flowing") then
							minetest.env:set_node(t, {name="air"})
					end
				end
			end
		end
	end,
})]]

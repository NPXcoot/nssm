nssm:register_mob("nssm:sandworm", {
	type = "monster",
	hp_max = 30,
	hp_min = 25,
	collisionbox = {-0.4, -0.2, -0.4, 0.4, 1.90, 0.4},
	visual = "mesh",
	mesh = "sandworm.x",
	textures = {{"sandworm.png"}},
	visual_size = {x=4, y=4},
	makes_footstep_sound = false,
	view_range = 17,
	rotate = 270,
	reach = 4,
	walk_velocity = 2,
	run_velocity = 2,
	damage = 4,
	jump = false,
	drops = {
        {name = "nssm:worm_flesh",
		chance = 2,
		min = 1,
		max = 3,},
		{name = "nssm:life_energy",
		chance = 1,
		min = 2,
		max = 3,},
	},
	armor = 90,
	drawtype = "front",
	water_damage = 5,
	lava_damage = 10,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 25,
		speed_run = 40,
		stand_start = 1,
		stand_end = 100,
		walk_start = 110,
		walk_end = 140,
		run_start = 110,
		run_end = 140,
		punch_start = 150,
		punch_end = 180,
	},
	do_custom = function(self)
		--Worm
		local c=2
		local pos = self.object:getpos()
		local v = self.object:getvelocity()
		for dx = -c*(math.abs(v.x))-1 , c*(math.abs(v.x))+1 do
			for dy=0,2 do
				for dz = -c*(math.abs(v.z))-1 , c*(math.abs(v.z))+1 do
					local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(p).name
					if (n~="default:water_source" and n~="default:water_flowing") then
						if n=="default:sand" or n=="default:desert_sand" then
							minetest.env:set_node(t, {name="air"})
						end
					end
				end
			end
		end
	end,
})

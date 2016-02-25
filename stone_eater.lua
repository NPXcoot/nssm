nssm:register_mob("nssm:stone_eater", {
	type = "monster",
	hp_max = 17,
	hp_min = 15,
	collisionbox = {-0.3, -0.05, -0.3, 0.3, 0.65, 0.3},
	visual = "mesh",
	mesh = "stone_eater.x",
	textures = {{"stone_eater.png"}},
	visual_size = {x=10, y=10},
	makes_footstep_sound = false,
	view_range = 16,
	rotate = 270,
	worm=true,
	jump = false,
	jump_height =0,
	walk_velocity = 1,
	run_velocity = 1.5,
	damage = 3,
	drops = {
        {name = "default:stone",
		chance = 2,
		min = 1,
		max = 3,},
		{name = "nssm:life_energy",
		chance = 1,
		min = 2,
		max = 3,},
		{name = "nssm:stoneater_mandible",
		chance = 2,
		min = 1,
		max = 4,},
	},
	armor = 50,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 20,
		stand_start = 1,
		stand_end = 60,
		walk_start = 70,
		walk_end = 110,
		run_start = 130,
		run_end = 150,
		punch_start = 160,
		punch_end = 185,
	},
	do_custom = function(self)
		--Remove stone around
		local pos = self.object:getpos()
		local c=3
		local v = self.object:getvelocity()
		for dx = -c*(math.abs(v.x))-1 , c*(math.abs(v.x))+1 do
			for dy=0,1 do
				for dz = -c*(math.abs(v.z))-1 , c*(math.abs(v.z))+1 do
					local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(t).name
						if (n~="default:water_source" and n~="default:water_flowing") then
              if n=="default:stone" or n=="default:sandstone" or n=="default:cobble" then
                  minetest.env:set_node(t, {name="air"})
              end
						end
				end
			end
		end
	end,
})

nssm:register_mob("nssm:icesnake", {
	type = "monster",
	hp_max = 17,
	hp_min = 13,
	collisionbox = {-0.7, 0, -0.7, 0.7, 0.50, 0.7},
	visual = "mesh",
	mesh = "icesnake.x",
	textures = {{"icesnake.png"}},
	visual_size = {x=7, y=7},
	makes_footstep_sound = false,
	view_range = 10,
  rotate = 270,
	walk_velocity = 1.2,
	run_velocity = 3,
  sounds = {
		random = "icesnake",
	},
	damage = 3,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 1,
		max = 2},
		{name = "nssm:frosted_amphibian_heart",
		chance = 1,
		min = 1,
		max = 1},
		{name = "nssm:little_ice_tooth",
		chance = 2,
		min = 0,
		max = 4},
    },
	armor = 100,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 20,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 170,
		stand_end = 220,
		walk_start = 1,
		walk_end = 60,
		run_start = 80,
		run_end = 120,
		punch_start = 130,
		punch_end = 160,
	},
	do_custom = function(self)
		--Froster
		local c=2
		local pos = self.object:getpos()
		local v = self.object:getvelocity()
		for dx = -c*(math.abs(v.x))-1 , c*(math.abs(v.x))+1 do
			for dy=-1,0 do
				for dz = -c*(math.abs(v.z))-1 , c*(math.abs(v.z))+1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(p).name
					if (n=="default:water_source" or n=="default:water_flowing") then
							minetest.env:set_node(t, {name="default:ice"})
					end
				end
			end
		end
	end,
})

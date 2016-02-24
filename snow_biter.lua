nssm:register_mob("nssm:snow_biter", {
	type = "monster",
	hp_max = 20,
	hp_min = 15,
	collisionbox = {-0.5, 0, -0.5, 0.5, 0.60, 0.5},
	visual = "mesh",
	mesh = "snow_biter.x",
	textures = {{"snow_biter.png"}},
	visual_size = {x=6, y=6},
	makes_footstep_sound = true,
	view_range = 18,
  rotate = 270,
	mele_number = 2,
	reach = 1.5,
	walk_velocity = 0.8,
	run_velocity = 3,
    sounds = {
		random = "snow_biter",
	},
	damage = 5,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 2,
		max = 3},
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
	lava_damage = 30,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 25,
		stand_start = 0,
		stand_end = 80,
		walk_start = 110,
		walk_end = 150,
		run_start = 80,
		run_end = 100,
		punch_start = 175,
		punch_end = 190,
		punch1_start = 200,
		punch1_end = 215
	},
	do_custom = function(self)
		--Froster
		local c=2
		local pos = self.object:getpos()
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

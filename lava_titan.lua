nssm:register_mob("nssm:lava_titan", {
	type = "monster",
	hp_max = 80,
	hp_min = 80,
	collisionbox = {-0.6, -0.05, -0.6, 0.6, 4.0, 0.6},
	visual = "mesh",
	mesh = "lava_titan.x",
	textures = {{"lava_titan.png"}},
	visual_size = {x=4, y=4},
	makes_footstep_sound = true,
	view_range = 20,
	fear_height = 4,
	lifetimer = 500,
	walk_velocity = 1,
	run_velocity = 2,
	floats = 1,
  sounds = {
		random = "lava_titan",
	},
	damage = 7,
	jump = false,
	jump_height=0,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 7,
		max = 9,},
		{name = "nssm:lava_titan_eye",
		chance = 1,
		min = 1,
		max = 1,},
		{name = "bucket:bucket_lava",
		chance = 2,
		min = 1,
		max = 3,},
	},
	armor = 40,
	drawtype = "front",
	water_damage = 4,
  rotate = 270,
	melter = true,
	light_damage = 0,
	lava_damage = 0,
	on_rightclick = nil,
	floats = 1,
	attack_type = "dogshoot",
	dogshoot_stop = true,
  arrow = "nssm:lava_arrow",
  reach = 3,
  shoot_interval = 2,
  shoot_offset = -1,
	true_dist_attack = true,
	on_dist_attack = function(self, player)
		local pos = player:getpos()
		for dy=-1, 6, 1 do
			for dx=-1, 1, 2 do
				for dz=-1, 1, 2 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(p).name
					if n~="default:lava_flowing" then
						minetest.set_node(p, {name="default:lava_flowing"})
					end
				end
			end
		end
	end,
	animation = {
		speed_normal = 25,
		speed_run = 25,
		stand_start = 120,
		stand_end = 300,
		walk_start = 10,
		walk_end = 110,
		run_start = 10,
		run_end = 110,
		punch_start = 301,
		punch_end = 340,
    dattack_start =340,
    dattack_end=400,
	},
	do_custom = function (self)

		--Digging ability:
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

		--Melting ability (puts lava where he passes)
		pos.y=pos.y-1
		local n = minetest.env:get_node(pos).name
		if n~="default:lava_source" then
			minetest.env:set_node(pos, {name="default:lava_source"})
		end

	end,
})

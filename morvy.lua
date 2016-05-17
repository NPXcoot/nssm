mobs:register_mob("nssm:morvy", {
	type = "monster",
	hp_max = 12,
	hp_min = 18,
	collisionbox = {-0.3, 0.00, -0.3, 0.3, 2.3, 0.3},
	visual = "mesh",
	mesh = "morvy.x",
	textures = {{"morvy.png"}},
	visual_size = {x=6, y=6},
	makes_footstep_sound = true,
	view_range = 30,
	fear_height = 5,
	walk_velocity = 1,
	run_velocity = 2,
  	rotate = 270,
	damage = 4,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 5,
		max = 7,},
	},
	reach = 8,
	armor = 70,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 25,
		stand_start = 10,
		stand_end = 40,
		walk_start = 50,
		walk_end = 90,
		run_start = 50,
		run_end = 90,
		punch_start = 100,
		punch_end = 130,
	},

	custom_attack = function(self)
		self.morvy_counter = (self.morvy_counter or 0) + 1
		if self.morvy_counter == 4 then
			self.morvy_counter = 0
			local counter = 0

			local s = self.object:getpos()
			local p = self.attack:getpos()

			p.y = p.y + 1.5
			s.y = s.y + 1.5
			if line_of_sight_water(self, p, s) == true then
				--[[play attack sound
				if self.sounds.attack then
					minetest.sound_play(self.sounds.attack, {
					object = self.object,
					max_hear_distance = self.sounds.distance
					})
				end]]
				local pos1 = {x=s.x, y=s.y+2, z=s.z}

				local objects = minetest.env:get_objects_inside_radius(s, 10)
			    for _,obj in ipairs(objects) do
			        if (obj:get_luaentity() and obj:get_luaentity().name == "nssm:morbat1" or obj:get_luaentity() and obj:get_luaentity().name == "nssm:morbat2" or obj:get_luaentity() and obj:get_luaentity().name == "nssm:morbat3") then
			        	counter = counter + 1
					end
			    end

				if 	((pos1.x~=s.x) and (pos1.z~=s.z))
				and (minetest.env:get_node(pos1).name == "air")
				and (counter < 4)
				then
					minetest.add_particlespawner(
						20, --amount
						0.1, --time
						{x=pos.x-exp_radius, y=pos.y-exp_radius, z=pos.z-exp_radius}, --minpos
						{x=pos.x+exp_radius, y=pos.y+exp_radius, z=pos.z+exp_radius}, --maxpos
						{x=0, y=0, z=0}, --minvel
						{x=0.1, y=0.3, z=0.1}, --maxvel
						{x=-0.5,y=1,z=-0.5}, --minacc
						{x=0.5,y=1,z=0.5}, --maxacc
						0.1, --minexptime
						4, --maxexptime
						2, --minsize
						6, --maxsize
						false, --collisiondetection
						"morparticle.png" --texture
					local bat = {"nssm:morbat1"}
					local which = math.random (1,3)
					if which == 1 then
						bat = {"nssm:morbat1"}
					elseif which == 2 then
						bat = {"nssm:morbat2"}
					elseif which == 3 then
						bat = {"nssm:morbat3"}
					end
					minetest.add_entity(pos1, bat)
				end
			end
		end
	end
})


--Morbats

mobs:register_mob("nssm:morbat1", {
	type = "monster",
	hp_max = 10,
	hp_min = 13,
	collisionbox = {-0.3, -0.2, -0.3, 0.3, 0.2, 0.3},
	visual = "mesh",
	mesh = "morbat.x",
	textures = {{"morbat1.png"}},
	visual_size = {x=1, y=1},
	view_range = 40,
	walk_velocity = 0.5,
	run_velocity = 3,
  	fall_speed = 0,
  	stepheight = 3,
--[[	sounds = {
		random = "duck",
	},]]
	damage = 4,
	reach = 2,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 1,
		max = 2,},
	},
	armor = 100,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
  	fly = true,
	attack_type = "dogfight",
	animation = {
		speed_normal = 25,
		speed_run = 35,
		stand_start = 60,
		stand_end = 90,
		walk_start = 10,
		walk_end = 50,
		run_start = 10,
		run_end = 50,
		punch_start = 100,
		punch_end = 115,
	}
})

mobs:register_mob("nssm:morbat2", {
	type = "monster",
	hp_max = 10,
	hp_min = 13,
	collisionbox = {-0.3, -0.2, -0.3, 0.3, 0.2, 0.3},
	visual = "mesh",
	mesh = "morbat.x",
	textures = {{"morbat2.png"}},
	visual_size = {x=1, y=1},
	view_range = 40,
	walk_velocity = 0.5,
	run_velocity = 3,
  	fall_speed = 0,
  	stepheight = 3,
--[[	sounds = {
		random = "duck",
	},]]
	damage = 4,
	reach = 1,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 1,
		max = 2,},
	},
	armor = 100,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
  	fly = true,
	attack_type = "explosion",
	explosion_radius = 3,
	animation = {
		speed_normal = 25,
		speed_run = 35,
		stand_start = 60,
		stand_end = 90,
		walk_start = 10,
		walk_end = 50,
		run_start = 10,
		run_end = 50,
		punch_start = 100,
		punch_end = 115,
	}
})


mobs:register_mob("nssm:morbat3", {
	type = "monster",
	hp_max = 10,
	hp_min = 13,
	collisionbox = {-0.3, -0.2, -0.3, 0.3, 0.2, 0.3},
	visual = "mesh",
	mesh = "morbat.x",
	textures = {{"morbat3.png"}},
	visual_size = {x=1, y=1},
	view_range = 40,
	walk_velocity = 0.5,
	run_velocity = 3,
  	fall_speed = 0,
  	stepheight = 3,
--[[	sounds = {
		random = "duck",
	},]]
	damage = 4,
	reach = 1,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 1,
		max = 2,},
	},
	armor = 100,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
  	fly = true,
	attack_type = "shoot",
	arrow = "nssm:spine",
	shoot_interval = 1,
	animation = {
		speed_normal = 25,
		speed_run = 35,
		stand_start = 60,
		stand_end = 90,
		walk_start = 10,
		walk_end = 50,
		run_start = 10,
		run_end = 50,
		punch_start = 100,
		punch_end = 115,
	}
})
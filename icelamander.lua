nssm:register_mob("nssm:icelamander", {
	type = "monster",
	hp_max = 90,
	hp_min = 90,
	collisionbox = {-0.5, 0, -0.5, 0.5, 2.3, 0.5},
	visual = "mesh",
	mesh = "icelamander.x",
	textures = {{"icelamander.png"}},
	visual_size = {x=4, y=4},
	makes_footstep_sound = true,
	view_range = 35,
	lifetimer = 500,
	fear_height = 4,
	walk_velocity = 2,
	run_velocity = 4,
    sounds = {
		random = "icelamander",
	},
	damage = 8,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 6,
		max = 8},
		{name = "nssm:frosted_amphibian_heart",
		chance = 1,
		min = 1,
		max = 1},
		{name = "nssm:ice_tooth",
		chance = 1,
		min = 1,
		max = 1},
		{name = "nssm:little_ice_tooth",
		chance = 1,
		min = 0,
		max = 20},
    },
	armor = 60,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 30,
	light_damage = 0,
	on_rightclick = nil,
	dogshoot_stop = true,
	attack_type = "dogshoot",
	arrow = "nssm:snow_arrow",
	reach = 3,
	shoot_interval = 2,
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 1,
		stand_end = 40,
		walk_start = 80,
		walk_end = 160,
		run_start = 40,
		run_end = 80,
		punch_start = 160,
		punch_end = 190,
		dattack_start = 190,
		dattack_end = 210,
	},
	do_custom = function(self)
		--Big_froster
		local pos = self.object:getpos()
		if minetest.is_protected(pos, "") then
			return
		end
		local c=3
		local v = self.object:getvelocity()
		for dx = -c*(math.abs(v.x))-1 , c*(math.abs(v.x))+1 do
			for dy=-1,3 do
				for dz = -c*(math.abs(v.z))-1 , c*(math.abs(v.z))+1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(p).name
					if (n~="air") and not minetest.is_protected(p, "") then
						minetest.env:set_node(p, {name="default:ice"})
					end
				end
			end
		end
	end,
})

nssm:register_mob("nssm:masticone", {
	type = "monster",
	hp_max = 15,
	hp_min = 14,
	collisionbox = {-0.45, 0.00, -0.45, 0.45, 0.40, 0.45},
	visual = "mesh",
	mesh = "masticone.x",
	textures = {{"masticone.png"}},
	visual_size = {x=4, y=4},
	makes_footstep_sound = true,
	view_range = 15,
	lifetimer = 500,
	fear_height = 4,
	rotate = 270,
	walk_velocity = 1.5,
	run_velocity = 2.5,
  sounds = {
		random = "masticone",
	},
	damage = 5,
	jump = true,
	drops = {
                {name = "homedecor:coin",
                chance = 8,
                min = 1,
                max = 3,},
	},
	armor = 60,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 5,
	floats=0,
	hydra = true,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	reach =1.5,
	animation = {
		speed_normal = 20,
		speed_run = 25,
		stand_start = 80,
		stand_end = 140,
		walk_start = 20,
		walk_end = 40,
		run_start = 20,
		run_end = 40,
		punch_start = 150,
		punch_end = 180,
	},
	on_die = function(self, pos)
			core.after(2, function()
				minetest.add_particlespawner(
					200, --amount
					0.1, --time
					{x=pos.x-1, y=pos.y-1, z=pos.z-1}, --minpos
					{x=pos.x+1, y=pos.y+1, z=pos.z+1}, --maxpos
					{x=-0, y=-0, z=-0}, --minvel
					{x=1, y=1, z=1}, --maxvel
					{x=-0.5,y=5,z=-0.5}, --minacc
					{x=0.5,y=5,z=0.5}, --maxacc
					0.1, --minexptime
					1, --maxexptime
					3, --minsize
					4, --maxsize
					false, --collisiondetection
					"tnt_smoke.png" --texture
				)
				local pos1 = {x=pos.x+math.random(-1,1), y=pos.y+0.5, z=pos.z+math.random(-1,1)}
				local pos2 = {x=pos.x+math.random(-1,1), y=pos.y+0.5, z=pos.z+math.random(-1,1)}
				if math.random(1,4) > 3 then -- too many of them crash the server. Give us a 1/4 chance of actually defeating one permanently...??
					minetest.add_entity(pos1, "nssm:masticone")
					minetest.add_entity(pos2, "nssm:masticone")
				end
    end)
	end,
	on_rightclick = function(self, clicker)
		capchance = math.random(1,100)
		if capchance < 20 then -- 20% chance to actually execute capture
			mobs:capture_mob(self, clicker, 50, 80, 100, false, nil) -- they don't drop enough to be worth it, captuing is the best solution	
		else -- the rest is for actual demise
			self.object:remove()
		end
	end,
})

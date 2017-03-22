mobs:register_mob("nssm:phoenix", {
	type = "monster",
	hp_max = 160,
	hp_min = 160,
	collisionbox = {-0.65, -0.4, -0.65, 0.65, 0.4, 0.65},
	visual = "mesh",
	mesh = "phoenix.x",
	textures = {{"phoenix.png"}},
	visual_size = {x=18, y=18},
	view_range = 40,
	lifetimer = 500,
	floats=1,
	rotate = 270,
	walk_velocity = 2,
	run_velocity = 2.5,
	fall_speed = 0,
	stepheight = 3,
	sounds = {
		random = "phoenix",
		distance = 45,
	},
	damage = 2,
	jump = false,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 7,
		max = 8,},
		{name = "nssm:sun_feather",
		chance = 1,
		min = 1,
		max = 1,},
		{name = "nssm:phoenix_tear",
		chance = 1,
		min = 5,
		max = 6,},
		{name = "nssm:phoenix_nuggets",
		chance = 6,
		min = 10,
		max = 20,},
	},
	armor = 40,
	drawtype = "front",
	water_damage = 5,
	lava_damage = 0,
	light_damage = 0,
	blood_texture="nssm_blood.png",
	blood_amount=50,
	on_rightclick = nil,
	fly = true,
	attack_type = "dogfight",
	reach = 15,
	shoot_interval = 4,
	animation = {
		speed_normal = 25,
		speed_run = 25,
		stand_start = 220,
		stand_end = 280,
		walk_start = 140,
		walk_end = 180,
		run_start = 190,
		run_end = 210,
		punch_start = 80,
		punch_end = 110,
		shoot_start = 80,
		shoot_end = 110,
	},
	custom_attack = function(self)
		local p = self.attack:getpos()
		local s = self.object:getpos()
		local vel = vector.subtract(p,s)

		minetest.add_particlespawner(
			125, --amount
			0.5, --time
			s, --minpos
			s, --maxpos
			vector.multiply(vel, 0.5), --minvel
			vector.multiply(vel, 1.4), --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=0,y=0,z=0}, --maxacc
			2, --minexptime
			4, --maxexptime
			10, --minsize
			20, --maxsize
			true, --collisiondetection
			"phoenix_fire.png" --texture
		)


		--local dir = placer:get_look_dir()
		--local playerpos = placer:getpos()
		local obj = minetest.add_entity(s, "nssm:phoenix_dart")
		local ran = math.random(7,14)/10
		local vec = vector.multiply(vel, ran)
		obj:setvelocity(vec)

		minetest.after(0.5, function()
			local p = self.attack:getpos()
			local vel = vector.subtract(p,s)
			local obj = minetest.add_entity(s, "nssm:phoenix_dart")
			local ran = math.random(7,14)/10
			local vec = vector.multiply(vel, ran)
			obj:setvelocity(vec)
		end)

	end,
})


minetest.register_entity("nssm:phoenix_dart", {
	textures = {"transparent.png"},
	on_step = function(self, dtime)
		self.timer = (self.timer) or os.time()
		self.attack = (self.attack) or os.time()
		if os.time() - self.timer > 4 then
			self.object:remove()
		end
		local all_objects = minetest.get_objects_inside_radius(self.object:getpos(), 1)
		local players = {}
		local _,obj
		for _,obj in ipairs(all_objects) do
			if obj:is_player() then
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups = {fleshy = 1}
				}, nil)
			end
		end
	end,
})

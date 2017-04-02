mobs:register_mob("nssm:mese_dragon", {
	type = "monster",
	hp_max = 666,
	hp_min = 666,
	collisionbox = {-0.8, 0, -0.8, 0.8, 4, 0.8},
	visual = "mesh",
	mesh = "mese_dragon.x",
	textures = {{"mese_dragon.png"}},
	visual_size = {x=8, y=8},
	makes_footstep_sound = true,
	view_range = 45,
	rotate = 270,
	fear_height = 5,
	walk_velocity = 2,
	run_velocity = 4,
    sounds = {
		shoot_attack = "mesed",
		attack = "mese_dragon",
		distance = 60,
	},
	damage = 18,
	jump = true,
	jump_height = 10,
	drops = {
		{name = "nssm:rainbow_staff",
		chance = 1,
		min = 1,
		max = 1},
		{name = "nssm:energy_globe",
		chance = 1,
		min = 99,
		max = 99},
    },
	armor = 30,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	blood_texture="mese_blood.png",
	blood_amount=30,
	stepheight=3.1,
	knock_back=0,
	jump_height=12,
	dogshoot_count_max = 9,
	arrow = "nssm:roar_of_the_dragon",
	reach = 25,
	shoot_interval = 3,
	shoot_offset = -1,
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 60,
		stand_end = 120,
		walk_start = 161,
		walk_end = 205,
		run_start = 206,
		run_end = 242,
		punch_start = 242,
		punch_end = 275,
		punch2_start = 330,
		punch2_end = 370,
    	shoot_start = 120,
    	shoot_end = 160,
	},
	--[[
	do_custom = function(self)
		--midas_ability(self, "default:mese_block", self.run_velocity,2, 3)
	end,


	custom_attack = function(self)
		if self.timer > 1 then
			self.timer = 0
			self.attack_rip = self.attack_rip+1

			local s = self.object:getpos()
			local p = self.attack:getpos()

			p.y = p.y + 1.5
			s.y = s.y + 1.5

			if minetest.line_of_sight(p, s) == true then
				-- play attack sound
				if self.sounds.attack then
					minetest.sound_play(self.sounds.attack, {
						object = self.object,
						max_hear_distance = self.sounds.distance
					})
				end
				-- punch player
				self.attack:punch(self.object, 1.0,  {
					full_punch_interval=1.0,
					damage_groups = {fleshy=self.damage}
				}, nil)
			end
			if self.attack_rip>=8 then
				self.attack_rip =0
				set_animation("punch1")
				for dx = -17,17 do
					for dz= -17,17 do
						local k = {x = s.x+dx, y=s.y+20, z=s.z+dz}
						local n = minetest.env:get_node(k).name
						if n=="air" and math.random(1,23)==1 then
							minetest.env:set_node(k, {name="nssm:mese_meteor"})
							nodeupdate(k)
						end
					end
				end
			end
		end
	end,
	]]
	custom_attack = function(self)
		local p = self.attack:getpos()
		local s = self.object:getpos()
		s.y = s.y + 5;
		local vel = vector.subtract(p,s)
		set_animation(self, "shoot")

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
			1, --minsize
			2, --maxsize
			true, --collisiondetection
			"phoenix_fire.png" --texture
		)


		local obj = minetest.add_entity(s, "nssm:mese_dart")
		local ran = math.random(7,14)/10
		local vec = vector.multiply(vel, ran)
		obj:setvelocity(vec)

		minetest.after(0.5, function()
			if self.attack then
				local p = self.attack:getpos()
				local vel = vector.subtract(p,s)
				local obj = minetest.add_entity(s, "nssm:mese_dart")
				local ran = math.random(7,14)/10
				local vec = vector.multiply(vel, ran)
				obj:setvelocity(vec)
			end
		end)
	end,
	--[[
	do_custom = function (self)
		--minetest.chat_send_all(s.y.."-"..p.y.."="..(s.y-p.y))
		if self.state == "attack" then
			if self.attack then
				local s = self.object:getpos()
				local p = self.attack:getpos()
				if (s.y - p.y ) < 10 then
					local v = self.object:getvelocity()
					v.y = 10
					self.object:setvelocity(v)
				end
			end
		end
	end,]]
})

minetest.register_entity("nssm:mese_dart", {
	textures = {"transparent.png"},
	on_step = function(self, dtime)
		self.timer = (self.timer) or os.time()
		self.attack = (self.attack) or os.time()
		if os.time() - self.timer > 4 then
			self.object:remove()
		end
		local p = self.object:getpos()
		local all_objects = minetest.get_objects_inside_radius(p, 1)
		local players = {}
		local _,obj
		for _,obj in ipairs(all_objects) do
			if obj:is_player() then
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups = {fleshy = 10}
				}, nil)
				self.object:remove()
			end
		end
		local n = minetest.get_node(p).name
		if n ~= "air" then
			minetest.set_node(p, {name="default:mese_block"})
			self.object:remove();
		end

		local node = minetest.get_node(p).name
		if node ~= "air" then
			self.object:remove()
		end
	end,
})

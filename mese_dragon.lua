nssm:register_mob("nssm:mese_dragon", {
	type = "monster",
	hp_max = 333,
	hp_min = 333,
	collisionbox = {-1, 0, -1, 1, 5, 1},
	visual = "mesh",
	mesh = "mese_dragon.x",
	textures = {{"mese_dragon.png"}},
	visual_size = {x=12, y=12},
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
	damage = 16,
	jump = true,
	jump_height = 10,
	drops = {
		{name = "default:mese_crystal",
		chance = 1,
		min = 3,
		max = 7},
		{name = "default:sword_mese",
		chance = 1,
		min = 1,
		max = 2},
    },
	armor = 60,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogshoot",
	dogshoot_stop = true,
	arrow = "nssm:roar_of_the_dragon",
	reach = 5,
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
		punch1_start = 330,
		punch1_end = 370,
    dattack_start = 120,
    dattack_end = 160,
	},
	do_custom = function(self)
		nssm:midas_ability(self, "default:coal_block", self.run_velocity,2, 3)
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
	end
})

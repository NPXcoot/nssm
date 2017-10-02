mobs:register_mob("nssm:river_lord", {
	type = "monster",
	hp_max = 210,
	hp_min = 210,
	collisionbox = {-0.6, 0, -0.6, 0.6, 3, 0.6},
	visual = "mesh",
	mesh = "river_lord.x",
	textures = {{"river_lord.png"}},
	visual_size = {x=4, y=4},
	makes_footstep_sound = true,
	view_range = 30,
	walk_velocity = 0.6,
	rotate = 270,
	fear_height = 4,
	run_velocity = 4,
	--[[sounds = {
		random = "river_lord",
	},]]
	damage = 10,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 70,
		max = 90},
    },
	armor = 50,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 2,
	reach = 8,
	light_damage = 0,
	--group_attack=true,
	--attack_animals=true,
	knock_back=0,
	blood_texture="nssm_blood.png",
	stepheight=2.1,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 20,
		stand_start = 20,
		stand_end = 100,
		walk_start = 110,
		walk_end = 150,
		run_start = 160,
		run_end = 180,
		punch_start = 260,
		punch_end = 280,
		punch2_start = 230,	--charge_start
		punch2_end = 250,	--charge_end
		die_start = 290,
		die_end = 310,
		speed_die = 10,
		shoot_start = 190, 	--Arena di fango inizio: 190
		shoot_end = 220,	--Arena di fango fine: 220
		speed_shoot = 20,
    },
	do_custom = function (self)
		if self.other_state and self.other_state == "charge" then
			do_charge(self)
		end
	end,
	custom_attack = function (self)
		if self.mud_timer then
			if os.time() - self.mud_timer > 15 then
				mud_attack(self)
			else
				local s = self.object:getpos()
				local p = self.attack:getpos()
				local l = vector.length(vector.subtract(p,s))
				charge_attack(self)
			end
		else
			mud_attack(self)
		end
	end,
})

function mud_attack (self) -- replace soil with mud
	self.mud_timer = os.time()
	local radius = 10
	set_animation(self, "shoot")
	local s = self.object:getpos()
	local vec = {x=radius,y=1,z=radius}
	minetest.after(0.5, function (self)
		local poslist = minetest.find_nodes_in_area(vector.subtract(s, vec), vector.add(s,vec), "group:crumbly")
		for _,v in pairs(poslist) do
			local l = vector.length(vector.subtract(v,s))
			if l <= radius and not minetest.is_protected(v, "") then
				minetest.set_node(v, {name="nssm:mud"})
			end
		end
	end, self)
end

mobs:register_mob("nssm:pupumolle", {
	type = "animal",
	hp_max = 15,
	hp_min = 14,
	collisionbox = {-0.56, -2.2, -0.56, 0.56, 1.2, 0.56},
	visual = "mesh",
	mesh = "pupumolle.x",
	textures = {{"pupumolle.png"}},
	visual_size = {x=4, y=4},
	makes_footstep_sound = true,
	view_range = 8,
	fear_height = 4,
	walk_velocity = 1,
	run_velocity = 2.5,
    rotate = 270,
    sounds = {
		random = "pupumolle",
	},
	damage = 2,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 1,
		max = 1,},
		{name = "default:stone",
		chance = 1,
		min = 2,
		max = 3,},
	},
	armor = 60,
	drawtype = "front",
	water_damage = 3,
	lava_damage = 1,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 20,
		stand_start = 90,
		stand_end = 110,
		walk_start = 1,
		walk_end = 80,
		run_start = 120,
		run_end = 160,
		punch_start = 170,
		punch_end = 190,
	},
    do_custom = function (self)

        local pos = self.object:getpos()

		--[[
		if self.inventory == nil then
			minetest.chat_send_all("Inventario non creato")
		else
			minetest.chat_send_all("Inventario creato")
		end
		]]--
		if self.flag ~= 1 then
			self.inventory = {}
			for i=1,32 do
				self.inventory[i]={name = '', num = 0}
			end
		end
		self.flag = (self.flag or 1)



        local objects = minetest.env:get_objects_inside_radius(pos, 10)
        local pl = nil
        for _,obj in ipairs(objects) do
            if (obj:is_player()) then
                pl = obj
            end
        end
		if pl ~= nil then
			local pname = pl:get_player_name()
			local player_inv = minetest.get_inventory({type='player', name = pname})

	        if player_inv:is_empty('main') then
				--minetest.chat_send_all("Inventario vuoto")
			else

				for i = 1,32 do
					--minetest.chat_send_all("Inventario non vuoto")
					--local items = ItemStack()
					local items = player_inv:get_stack('main', i)
					local n = items:get_name()
					--minetest.chat_send_all("Primo oggetto dell'inventario: "..n)
					if minetest.get_item_group(n, "eatable")==1 then
						--minetest.chat_send_all("L'oggetto si può mangiare, te lo rubo!")
						--local items2 = items
						--items2:set_count(1)
						local index
						local found = 0
						for j = 1,33 do
							if found == 0 then
								if self.inventory[j].num == 0 then
									found = 2
									index = j
								else
									if self.inventory[j].name == n then
										self.inventory[j].num = self.inventory[j].num +1
										found = 1
									end
								end
								if j == 33 then
									found = 4
								end
							end
						end
						minetest.chat_send_all("Found = "..found)
						if found == 2  then
							minetest.chat_send_all("Sto inserendo qualcosa di nuovo nell'iinventario")
							self.inventory[index].name = n
							self.inventory[index].num = 1
						end
						items:take_item()
						player_inv:set_stack('main', i, items)
					end
				end
			end
		end
    end,
	on_die = function(self)
		local pos = self.object:getpos()
		if (self.inventory ~= nil) then
			local elem
			for i = 1,32 do
				if self.inventory[i].num~=0 then
					local items = ItemStack(self.inventory[i].name.." "..self.inventory[i].num)
					local obj = minetest.add_item(pos, items)
						obj:setvelocity({
							x = math.random(-1, 1),
							y = 6,
							z = math.random(-1, 1)
						})
				end
			end
			if elem ~= nil then
				minetest.chat_send_all("Numero di cibi diversi nel mio inventario: "..elem)
			else
				minetest.chat_send_all("Non ti ho rubato nulla")
			end
		end
	end,
})

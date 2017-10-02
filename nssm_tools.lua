--tools

minetest.register_tool("nssm:masticone_fang_sword", {
	description = "Masticone Fang Sword",
	inventory_image = "masticone_fang_sword.png",
	tool_capabilities = {
		full_punch_interval =0.7 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=200, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=200, maxlevel=1}
		},
		damage_groups = {fleshy=8},
	},
})

minetest.register_tool("nssm:crab_light_mace", {
	description = "Light Crab Mace",
	inventory_image = "crab_light_mace.png",
	tool_capabilities = {
		full_punch_interval =2 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.4, [3]=1}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=8},
	},
})

minetest.register_tool("nssm:crab_heavy_mace", {
	description = "Heavy Crab Mace",
	inventory_image = "crab_heavy_mace.png",
	tool_capabilities = {
		full_punch_interval =4 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=2, [3]=1.4}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	},
})

minetest.register_tool("nssm:mantis_battleaxe", {
	description = "Mantis Battleaxe",
	inventory_image = "mantis_battleaxe.png",
	tool_capabilities = {
		full_punch_interval =3 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=2, [3]=1.4}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=10},
	},
})

minetest.register_node("nssm:rope", {
    description = "Rope",
    paramtype = "light",
	walkable = false,
    climbable = true,
    sunlight_propagates = true,
	drawtype = "plantlike",
    drops = "nssm:rope",
    tile_images = { "rope.png" },
    groups = {snappy=1},
})

minetest.register_node("nssm:cold_star", {
    description = "Cold Star",
		tile_images = { "cold_star.png" },
    paramtype = "light",
		walkable = false,
    climbable = false,
    sunlight_propagates = true,
		drawtype = "plantlike",
		on_timer = function(pos, elapsed)
			minetest.set_node(pos, {name="air"})
		end,
    drops = "",
		light_source = 15,
    groups = {},
})

minetest.register_tool("nssm:stoneater_pick", {
	description = "Stoneater Pickaxe",
	inventory_image = "stoneater_pick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=0.0}, uses=200, maxlevel=1},
		},
		damage_groups = {fleshy=5},
	},
})

minetest.register_tool("nssm:mantis_sword", {
	description = "Mantis Sword",
	inventory_image = "mantis_sword.png",
	tool_capabilities = {
		full_punch_interval =0.7 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.0, [3]=0.4}, uses=30, maxlevel=1},
			snappy={times={[2]=0.80, [3]=0.3}, uses=40, maxlevel=1},
		},
		damage_groups = {fleshy=7},
	},
})

minetest.register_tool("nssm:little_ice_tooth_knife", {
	description = "Little Ice Tooth Knife",
	inventory_image = "little_ice_tooth_knife.png",
	tool_capabilities = {
		full_punch_interval =0.3 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.0, [3]=0.4}, uses=4, maxlevel=1},
			snappy={times={[2]=0.80, [3]=0.3}, uses=7, maxlevel=1},
		},
		damage_groups = {fleshy=5},
	},
})

minetest.register_tool("nssm:manticore_spine_knife", {
	description = "Manticore Spine Knife",
	inventory_image = "manticore_spine_knife.png",
	tool_capabilities = {
		full_punch_interval =0.4 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.0, [3]=0.4}, uses=6, maxlevel=1},
			snappy={times={[2]=0.80, [3]=0.3}, uses=6, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("nssm:felucco_knife", {
	description = "Felucco Knife",
	inventory_image = "felucco_knife.png",
	tool_capabilities = {
		full_punch_interval =0.4 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.0, [3]=0.4}, uses=6, maxlevel=1},
			snappy={times={[2]=0.80, [3]=0.3}, uses=6, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	},
})

if minetest.get_modpath("farming") then

farming.register_hoe(":farming:felucco_hoe", {
	description = "Felucco Hoe",
	inventory_image = "felucco_hoe.png",
	max_uses = 290,
	material = "nssm:felucco_horn"
})

farming.register_hoe(":farming:ant_hoe", {
	description = "Ant Hoe",
	inventory_image = "ant_hoe.png",
	max_uses = 350,
	material = "nssm:ant_mandible"
})

minetest.register_craft({
	output = 'nssm:ant_hoe',
	recipe = {
		{'nssm:ant_mandible', 'nssm:ant_mandible'},
		{'', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:felucco_hoe',
	recipe = {
		{'nssm:felucco_horn', 'nssm:felucco_horn'},
		{'', 'group:stick'},
		{'', 'group:stick'},
	}
})

end

minetest.register_tool("nssm:ant_sword", {
	description = "Ant Sword",
	inventory_image = "ant_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.30, [2]=0.90, [3]=0.40}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
})



minetest.register_tool("nssm:ant_shovel", {
	description = "Ant Shovel",
	inventory_image = "ant_shovel.png",
	wield_image = "ant_shovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=35, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("nssm:duck_beak_shovel", {
	description = "Duck Beak Shovel",
	inventory_image = "duck_beak_shovel.png",
	wield_image = "duck_beak_shovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.80, [3]=0.20}, uses=5, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("nssm:mantis_axe", {
	description = "Mantis Axe",
	inventory_image = "mantis_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
		},
	})

minetest.register_tool("nssm:ant_billhook", {
	description = "Ant Billhook",
	inventory_image = "ant_billhook.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.40, [2]=1.00, [3]=0.60}, uses=30, maxlevel=3},
			snappy={times={[1]=1.40, [2]=1.00, [3]=0.60}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=6},
		},
	})

minetest.register_tool("nssm:duck_beak_pick",{
	description = "Duck Beak Pickaxe",
	inventory_image = "duck_beak_pick.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1.0, [2]=0.8, [3]=0.20}, uses=3, maxlevel=3},
		},
		damage_groups = {fleshy=5},
		},
})

minetest.register_tool("nssm:ant_pick", {
	description = "Ant Pickaxe",
	inventory_image = "ant_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=2.00, [2]=1.20, [3]=0.80}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("nssm:mantis_pick", {
	description = "Mantis Pickaxe",
	inventory_image = "mantis_pick.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=1.6, [2]=1.0, [3]=0.60}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("nssm:tarantula_warhammer", {
	description = "Tarantula Warhammer",
	inventory_image = "tarantula_warhammer.png",
	wield_scale= {x=2,y=2,z=1.5},
	tool_capabilities = {
		full_punch_interval =1,
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=80, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=200, maxlevel=1}
		},
		damage_groups = {fleshy=13},
	},
})

minetest.register_tool("nssm:axe_of_pride", {
	description = "Axe of Pride",
	inventory_image = "axe_of_pride.png",
	wield_scale= {x=2,y=2,z=1.5},
	tool_capabilities = {
		full_punch_interval =1.3 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=16},
	},
	on_drop = function(itemstack, dropper, pos)
		local objects = minetest.env:get_objects_inside_radius(pos, 10)
		local flag = 0
		local part = 0
		for _,obj in ipairs(objects) do
			part = 0
			if flag == 0 then
				local pname = dropper:get_player_name()
				local player_inv = minetest.get_inventory({type='player', name = pname})

				if player_inv:is_empty('main') then
					--minetest.chat_send_all("Inventory empty")
				else
					local found = 0
					for i = 1,32 do
						local items = player_inv:get_stack('main', i)
						local n = items:get_name()
						if n == "nssm:energy_globe" then
							found = i
							break
						end
					end
					if found == 0 then
						minetest.chat_send_player(pname, "You haven't got any Energy Globe!")
						return
					else
						if (obj:is_player()) then
							--minetest.chat_send_all("Giocatore")
							if (obj:get_player_name()~=dropper:get_player_name()) then
								obj:set_hp(obj:get_hp()-10)
								dropper:set_hp(dropper:get_hp()+10)
								--flag = 1

								local items = player_inv:get_stack('main', found)
								items:take_item()
								player_inv:set_stack('main', found, items)
								part = 1
							end
			            else
							if (obj:get_luaentity().health) then
								--minetest.chat_send_all("Entity")
								obj:get_luaentity().health = obj:get_luaentity().health -10
								check_for_death(obj:get_luaentity())

								dropper:set_hp(dropper:get_hp()+10)
								--flag = 1

								local items = player_inv:get_stack('main', found)
								items:take_item()
								player_inv:set_stack('main', found, items)
								part = 1
							end
			            end
						if part == 1 then
							local s = dropper:getpos()
							local p = obj:getpos()
							local m = 2

							minetest.add_particlespawner(
								3, --amount
								0.1, --time
								{x=p.x-0.5, y=p.y-0.5, z=p.z-0.5}, --minpos
								{x=p.x+0.5, y=p.y+0.5, z=p.z+0.5}, --maxpos
								{x=(s.x-p.x)*m, y=(s.y-p.y)*m, z=(s.z-p.z)*m}, --minvel
								{x=(s.x-p.x)*m, y=(s.y-p.y)*m, z=(s.z-p.z)*m}, --maxvel
								{x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}, --minacc
								{x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}, --maxacc
								0.5, --minexptime
								1, --maxexptime
								3, --minsize
								4, --maxsize
								false, --collisiondetection
								"heart.png" --texture
							)
						end
					end
				end
			end
        end
	end,
})

minetest.register_tool('nssm:sun_sword', {
	description = 'Sun Sword',
	inventory_image = 'sun_sword.png',
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.80, [2]=0.40, [3]=0.20}, uses=70, maxlevel=1},
			fleshy={times={[2]=0.6, [3]=0.2}, uses=70, maxlevel=1}
		},
		damage_groups = {fleshy=10},
	},
	on_drop = function(itemstack, dropper, pos)
		local conta = 0
		local pos = dropper:getpos()
		local vec = {x=4,y=4,z=4}
		local poslist = minetest.find_nodes_in_area(vector.subtract(pos, vec), vector.add(pos,vec), {"group:flammable"})
		for _,v in pairs(poslist) do
			--minetest.chat_send_all(minetest.pos_to_string(v))
			minetest.set_node(v, {name="fire:basic_flame"})
			conta = conta +1
		end
	dropper:set_hp(dropper:get_hp()+conta)
	end,
})

minetest.register_tool("nssm:night_sword", {
	description = "Night Sword",
	inventory_image = "night_sword.png",
	tool_capabilities = {
		full_punch_interval =0.4 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.4, [2]=0.3, [3]=0.2}, uses=300, maxlevel=1},
			fleshy={times={[2]=0.7, [3]=0.3}, uses=300, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	},
	on_drop = function(itemstack, dropper, pos)
		local conta = 0
		local pos = dropper:getpos()
		local vec = {x=4,y=4,z=4}
		local poslist = minetest.find_nodes_in_area(vector.subtract(pos, vec), vector.add(pos,vec), {"default:lava_source", "default:lava_flowing", "fire:basic_flame", "fire:permanent_flame", "nssm:phoenix_fire", "default:torch"})
		for _,v in pairs(poslist) do
			--minetest.chat_send_all(minetest.pos_to_string(v))
			minetest.set_node(v, {name="air"})
			conta = conta +1
		end
	dropper:set_hp(dropper:get_hp()+conta)
	end,
})

minetest.register_tool("nssm:ice_sword", {
	description = "Ice Sword",
	inventory_image = "ice_sword.png",
	tool_capabilities = {
		full_punch_interval =0.4 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.4, [2]=0.3, [3]=0.2}, uses=300, maxlevel=1},
			fleshy={times={[2]=0.7, [3]=0.3}, uses=300, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	},
	on_drop = function(itemstack, dropper, pos)
	    local objects = minetest.env:get_objects_inside_radius(pos, 10)
	    local flag = 0
		local vec = dropper:get_look_dir()
		local pos = dropper:getpos()
		--vec.y = 0

		for i=1,4 do
			pos = vector.add(pos, vec)
		end

		local pname = dropper:get_player_name()
		local player_inv = minetest.get_inventory({type='player', name = pname})
		local found = 0
		for i = 1,32 do
			local items = player_inv:get_stack('main', i)
			local n = items:get_name()
			if n == "nssm:life_energy" then
				found = i
				break
			end
		end
		if found == 0 then
			minetest.chat_send_player(pname, "You haven't got any Life Energy!")
			return
		else
			local items = player_inv:get_stack('main', found)
			items:take_item()
			player_inv:set_stack('main', found, items)
			for dx = -1,1 do
				for dz = -1,1 do
					local pos = {x = pos.x+dx, y=pos.y-1, z=pos.z+dz}
					if not minetest.is_protected(pos, "") or not minetest.get_item_group(minetest.get_node(pos).name, "unbreakable") == 1 then
						minetest.set_node(pos, {name="default:ice"})
					end
				end
			end
		end
	end,
})

minetest.register_tool("nssm:stone_club", {
	description = "Stone Club",
	inventory_image = "stone_club.png",
	tool_capabilities = {
		full_punch_interval =13 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.4, [2]=0.3, [3]=0.2}, uses=300, maxlevel=1},
			fleshy={times={[2]=0.7, [3]=0.3}, uses=300, maxlevel=1}
		},
		damage_groups = {fleshy=30},
	},
	on_drop = function(itemstack, dropper, pos)
	    local objects = minetest.env:get_objects_inside_radius(pos, 10)
	    local flag = 0
		local vec = dropper:get_look_dir()
		local pos = dropper:getpos()
		--vec.y = 0

		for i=1,4 do
			pos = vector.add(pos, vec)
		end

		local pname = dropper:get_player_name()
		local player_inv = minetest.get_inventory({type='player', name = pname})
		local found = 0
		for i = 1,32 do
			local items = player_inv:get_stack('main', i)
			local n = items:get_name()
			if n == "nssm:life_energy" then
				found = i
				break
			end
		end
		if found == 0 then
			minetest.chat_send_player(pname, "You haven't got any Life Energy!")
			return
		else
			local items = player_inv:get_stack('main', found)
			items:take_item()
			player_inv:set_stack('main', found, items)
			for dy = -2,4 do
					local pos = {x = pos.x, y=pos.y+dy, z=pos.z}
					if not minetest.is_protected(pos, "") or not minetest.get_item_group(minetest.get_node(pos).name, "unbreakable") == 1 then
						minetest.set_node(pos, {name="default:stone"})
					end
			end
		end
	end,
})

minetest.register_tool("nssm:lava_sword", {
	description = "Lava Sword",
	inventory_image = "lava_sword.png",
	tool_capabilities = {
		full_punch_interval =0.8 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.4, [2]=0.3, [3]=0.2}, uses=300, maxlevel=1},
			fleshy={times={[2]=0.7, [3]=0.3}, uses=300, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	},
	on_drop = function(itemstack, dropper, pos)
	    local objects = minetest.env:get_objects_inside_radius(pos, 10)
	    local flag = 0
		local vec = dropper:get_look_dir()
		local pos = dropper:getpos()
		--vec.y = 0

		for i=1,8 do
			pos = vector.add(pos, vec)
		end

		local pname = dropper:get_player_name()
		local player_inv = minetest.get_inventory({type='player', name = pname})
		local found = 0
		for i = 1,32 do
			local items = player_inv:get_stack('main', i)
			local n = items:get_name()
			if n == "nssm:energy_globe" then
				found = i
				break
			end
		end
		if found == 0 then
			minetest.chat_send_player(pname, "You haven't got any Energy Globe!")
			return
		else
			local items = player_inv:get_stack('main', found)
			items:take_item()
			player_inv:set_stack('main', found, items)
			for dx = -2,2 do
					for dy = -2,2 do
							for dz = -2,2 do
									local pos = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
									if not minetest.is_protected(pos, "") or not minetest.get_item_group(minetest.get_node(pos).name, "unbreakable") == 1 then
											minetest.set_node(pos, {name="default:lava_flowing"})
									end
							end
					end
			end
		end
	end,
})

minetest.register_tool("nssm:earth_warhammer", {
	description = "Earth Warhammer",
	inventory_image = "earth_warhammer.png",
	tool_capabilities = {
		full_punch_interval =0.4 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.4, [2]=0.3, [3]=0.2}, uses=300, maxlevel=1},
			fleshy={times={[2]=0.7, [3]=0.3}, uses=300, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	},
	on_drop = function(itemstack, dropper, pos)
	    local objects = minetest.env:get_objects_inside_radius(pos, 10)
	    local flag = 0
	    for _,obj in ipairs(objects) do
			local part = 0
	        if flag == 0 then
	            local pname = dropper:get_player_name()
	            local player_inv = minetest.get_inventory({type='player', name = pname})

	            if player_inv:is_empty('main') then
	                --minetest.chat_send_all("Inventory empty")
	            else
	                local found = 0
	                for i = 1,32 do
	                    local items = player_inv:get_stack('main', i)
	                    local n = items:get_name()
	                    if n == "nssm:energy_globe" then
	                        found = i
	                        break
	                    end
	                end
	                if found == 0 then
	                    minetest.chat_send_player(pname, "You haven't got any Energy Globe!")
	                    return
	                else
						local pos = obj:getpos()
						pos.y = pos.y - 3
	                    if (obj:is_player()) then
	                        if (obj:get_player_name()~=dropper:get_player_name()) then
								part=1
								obj:setpos(pos)
	                            --flag = 1

	                            local items = player_inv:get_stack('main', found)
	                            items:take_item()
	                            player_inv:set_stack('main', found, items)
	                        end
	                    else
	                        if (obj:get_luaentity().health) then
								obj:get_luaentity().old_y = pos.y
	                            obj:setpos(pos)
								part=1
	                            --flag = 1

	                            local items = player_inv:get_stack('main', found)
	                            items:take_item()
	                            player_inv:set_stack('main', found, items)
	                        end
	                    end
	                end
	            end
	        end
	    end
	end,
})

minetest.register_tool("nssm:earth_sword", {
	description = "Earth Sword",
	inventory_image = "earth_sword.png",
	tool_capabilities = {
		full_punch_interval =0.4 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.4, [2]=0.3, [3]=0.2}, uses=300, maxlevel=1},
			fleshy={times={[2]=0.7, [3]=0.3}, uses=300, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	},
	on_drop = function(itemstack, dropper, pos)
	    local objects = minetest.env:get_objects_inside_radius(pos, 10)
	    local flag = 0
		local vec = dropper:get_look_dir()
		local pos = dropper:getpos()
		--vec.y = 0

		for i=1,6 do
			pos = vector.add(pos, vec)
		end

		local pname = dropper:get_player_name()
		local player_inv = minetest.get_inventory({type='player', name = pname})
		local found = 0
		for i = 1,32 do
			local items = player_inv:get_stack('main', i)
			local n = items:get_name()
			if n == "nssm:energy_globe" then
				found = i
				break
			end
		end
		if found == 0 then
			minetest.chat_send_player(pname, "You haven't got any Energy Globe!")
			return
		else
			local items = player_inv:get_stack('main', found)
			items:take_item()
			player_inv:set_stack('main', found, items)
			for dx = -1,1 do
					for dy = -12,3 do
							for dz = -1,1 do
									local pos = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
									if not minetest.is_protected(pos, "") or not minetest.get_item_group(minetest.get_node(pos).name, "unbreakable") == 1 then
											minetest.set_node(pos, {name="air"})
									end
							end
					end
			end
		end
	end,
})

minetest.register_tool("nssm:gratuitousness_battleaxe", {
	description = "Gratuitousness Battleaxe",
	inventory_image = "gratuitousness_battleaxe.png",
	wield_scale= {x=2.2,y=2.2,z=1.5},
	tool_capabilities = {
		full_punch_interval =1.6 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=18},
	},
	on_drop = function(itemstack, dropper, pos)
	    local objects = minetest.env:get_objects_inside_radius(pos, 10)
	    local flag = 0
		local vec = dropper:get_look_dir()
		local pos = dropper:getpos()
		--vec.y = 0

		for i=1,10 do
			pos = vector.add(pos, vec)
		end

		local pname = dropper:get_player_name()
		local player_inv = minetest.get_inventory({type='player', name = pname})
		local found = 0
		for i = 1,32 do
				local items = player_inv:get_stack('main', i)
			local n = items:get_name()
			if n == "nssm:energy_globe" then
				found = i
				break
			end
		end
		if found == 0 then
			minetest.chat_send_player(pname, "You haven't got any Energy Globe!")
			return
		else
			local items = player_inv:get_stack('main', found)
			items:take_item()
			player_inv:set_stack('main', found, items)
			tnt.boom(pos, {damage_radius=5,radius=4,ignore_protection=false})
		end
	end,
})

minetest.register_tool("nssm:sword_of_eagerness", {
	description = "Sword of Eagerness",
	inventory_image = "sword_of_eagerness.png",
	wield_scale= {x=2,y=2,z=1},
	tool_capabilities = {
		full_punch_interval =0.7 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=14},
	},
	on_drop = function(itemstack, dropper, pos)
	    local objects = minetest.env:get_objects_inside_radius(pos, 10)
	    local flag = 0
	    for _,obj in ipairs(objects) do
			local part = 0
	        if flag == 0 then
	            local pname = dropper:get_player_name()
	            local player_inv = minetest.get_inventory({type='player', name = pname})

	            if player_inv:is_empty('main') then
	                --minetest.chat_send_all("Inventory empty")
	            else
	                local found = 0
	                for i = 1,32 do
	                    local items = player_inv:get_stack('main', i)
	                    local n = items:get_name()
	                    if n == "nssm:energy_globe" then
	                        found = i
	                        break
	                    end
	                end
	                if found == 0 then
	                    minetest.chat_send_player(pname, "You haven't got any Energy Globe!")
	                    return
	                else
						local pos = obj:getpos()
						pos.y = pos.y + 15
	                    if (obj:is_player()) then
	                        if (obj:get_player_name()~=dropper:get_player_name()) then
								part=1
								obj:setpos(pos)
	                            --flag = 1

	                            local items = player_inv:get_stack('main', found)
	                            items:take_item()
	                            player_inv:set_stack('main', found, items)
	                        end
	                    else
	                        if (obj:get_luaentity().health) then
								obj:get_luaentity().old_y = pos.y
	                            obj:setpos(pos)
								part=1
	                            --flag = 1

	                            local items = player_inv:get_stack('main', found)
	                            items:take_item()
	                            player_inv:set_stack('main', found, items)
	                        end
	                    end
						if part==1 then
							local s = pos
							s.y = s.y - 15
							minetest.add_particlespawner(
						    	25, --amount
						        0.3, --time
						        vector.subtract(s, 0.5), --minpos
						        vector.add(s, 0.5), --maxpos
						        {x=0, y=10, z=0}, --minvel
						        {x=0.1, y=11, z=0.1}, --maxvel
						        {x=0,y=1,z=0}, --minacc
						        {x=0,y=1,z=0}, --maxacc
						        0.5, --minexptime
						        1, --maxexptime
						        1, --minsize
						        2, --maxsize
						        false, --collisiondetection
						        "slothful_soul_fragment.png" --texture
						    )
						end
	                end
	            end
	        end
	    end
	end,
})

minetest.register_tool("nssm:falchion_of_eagerness", {
	description = "Falchion of Eagerness",
	inventory_image = "falchion_of_eagerness.png",
	wield_scale= {x=2,y=2,z=1},
	tool_capabilities = {
		full_punch_interval =1 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=16},
	},
	on_drop = function(itemstack, dropper, pos)
		local vec = dropper:get_look_dir()
		local pos = dropper:getpos()
		--vec.y = 0

		for i=1,16 do
			pos = vector.add(pos, vec)
		end

		local pname = dropper:get_player_name()
		local player_inv = minetest.get_inventory({type='player', name = pname})

		if player_inv:is_empty('main') then
			--minetest.chat_send_all("Inventory empty")
		else
			local found = 0
			for i = 1,32 do
				local items = player_inv:get_stack('main', i)
				local n = items:get_name()
				if n == "nssm:life_energy" then
					if items:get_count() >= 5 then
						found = i
						break
					end
				end
			end
			if found == 0 then
				minetest.chat_send_player(pname, "You haven't got enough life_energy!")
				return
			else
				local s = dropper:getpos()
				minetest.add_particlespawner(
					25, --amount
					0.3, --time
					vector.subtract(s, 0.5), --minpos
					vector.add(s, 0.5), --maxpos
					{x=0, y=10, z=0}, --minvel
					{x=0.1, y=11, z=0.1}, --maxvel
					{x=0,y=1,z=0}, --minacc
					{x=0,y=1,z=0}, --maxacc
					0.5, --minexptime
					1, --maxexptime
					1, --minsize
					2, --maxsize
					false, --collisiondetection
					"slothful_soul_fragment.png" --texture
				)
				minetest.remove_node(pos)
				pos.y=pos.y+1
				minetest.remove_node(pos)
				pos.y=pos.y-2
				minetest.remove_node(pos)
				dropper:setpos(pos)
				s = pos
				s.y = s.y+10
				minetest.add_particlespawner(
					25, --amount
					0.3, --time
					vector.subtract(s, 0.5), --minpos
					vector.add(s, 0.5), --maxpos
					{x=0, y=-10, z=0}, --minvel
					{x=0.1, y=-11, z=0.1}, --maxvel
					{x=0,y=-1,z=0}, --minacc
					{x=0,y=-1,z=0}, --maxacc
					0.5, --minexptime
					1, --maxexptime
					1, --minsize
					2, --maxsize
					false, --collisiondetection
					"slothful_soul_fragment.png" --texture
				)
				local items = player_inv:get_stack('main', found)
				items:set_count(items:get_count()-5)
				player_inv:set_stack('main', found, items)
			end
		end
	end,
})

minetest.register_tool("nssm:sword_of_envy", {
	description = "Sword of Envy",
	inventory_image = "sword_of_envy.png",
	wield_scale= {x=2,y=2,z=1},
	tool_capabilities = {
		full_punch_interval =0.9 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.5, [3]=0.2}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=14},
	},
	on_drop = function(itemstack, dropper, pos)
	    local objects = minetest.env:get_objects_inside_radius(pos, 10)
	    local flag = 0
	    for _,obj in ipairs(objects) do
	        if flag == 0 then
	            local pname = dropper:get_player_name()
	            local player_inv = minetest.get_inventory({type='player', name = pname})

	            if player_inv:is_empty('main') then
	                --minetest.chat_send_all("Inventory empty")
	            else
					local hp_num = nil
					if (obj:is_player()) and (obj:get_player_name()~=dropper:get_player_name()) then
						hp_num = obj:get_hp()
					else
						if obj:get_luaentity() and (obj:get_luaentity().health)  then
							hp_num = obj:get_luaentity().health
						end
					end
					if hp_num ~= nil then
						minetest.chat_send_all("hp_num = "..hp_num)
						local stack = {name="nssm:life_energy", count=hp_num, wear=0, metadata=""}
						if player_inv:contains_item("main", stack) then
							--minetest.chat_send_all("trovato!")

							if obj:is_player() and (obj:get_player_name()~=dropper:get_player_name()) then
								obj:set_hp(dropper:get_hp())
								dropper:set_hp(hp_num)
							else
								if obj:get_luaentity() and (obj:get_luaentity().health) then
									obj:get_luaentity().health = dropper:get_hp()
									if hp_num > 20 then
										dropper:set_hp(20)
									else
										dropper:set_hp(hp_num)
									end
								end
							end

							player_inv:remove_item("main", stack)
						else
							minetest.chat_send_player(dropper:get_player_name(), "You haven't enough life energy!")
						end
					end
	            end
	        end
	    end
	end,
})

minetest.register_tool("nssm:sword_of_gluttony", {
	description = "Sword of Gluttony",
	inventory_image = "sword_of_gluttony.png",
	wield_scale= {x=2,y=2,z=1},
	tool_capabilities = {
		full_punch_interval =1 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.9, [2]=0.7, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.6, [3]=0.2}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=14},
	},
	on_drop = function(itemstack, dropper, pos)
		local objects = minetest.env:get_objects_inside_radius(pos, 10)
		local flag = 0
		for _,obj in ipairs(objects) do
			if flag == 0 then
				local pname = dropper:get_player_name()
				local player_inv = minetest.get_inventory({type='player', name = pname})

				if player_inv:is_empty('main') then
					--minetest.chat_send_all("Inventory empty")
				else
					local found = 0
					for i = 1,32 do
						local items = player_inv:get_stack('main', i)
						local n = items:get_name()
						if n == "nssm:energy_globe" then
							found = i
							break
						end
					end
					if found == 0 then
						minetest.chat_send_player(pname, "You haven't got any Energy Globe!")
						return
					else
						if (obj:is_player()) then
							if (obj:get_player_name()~=dropper:get_player_name()) then
								obj:set_hp(obj:get_hp()-10)
								--flag = 1

								--take energy globe from inventory:
								local items = player_inv:get_stack('main', found)
								items:take_item()
								player_inv:set_stack('main', found, items)
							end
			            else
							if (obj:get_luaentity().health) then
								if obj:get_luaentity().health <= 32 then
									local pos = obj:getpos()
									obj:remove()

									--check_for_death(obj:get_luaentity())
									--flag = 1
									--take energy globe from inventory:
									local items = player_inv:get_stack('main', found)
									items:take_item()
									player_inv:set_stack('main', found, items)

									for i = 1,math.random(1,4) do
										drop = minetest.add_item(pos, "nssm:roasted_duck_legs 1")
										drops(drop)
									end

									local s = obj:getpos()
									local p = dropper:getpos()
									local m = 3

									minetest.add_particlespawner(
										10, --amount
										0.1, --time
										{x=p.x-0.5, y=p.y-0.5, z=p.z-0.5}, --minpos
										{x=p.x+0.5, y=p.y+0.5, z=p.z+0.5}, --maxpos
										{x=(s.x-p.x)*m, y=(s.y-p.y)*m, z=(s.z-p.z)*m}, --minvel
										{x=(s.x-p.x)*m, y=(s.y-p.y)*m, z=(s.z-p.z)*m}, --maxvel
										{x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}, --minacc
										{x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}, --maxacc
										0.5, --minexptime
										1, --maxexptime
										1, --minsize
										2, --maxsize
										false, --collisiondetection
										"gluttonous_soul_fragment.png" --texture
									)
								end
							end
			            end
					end
				end
			end
        end
	end,
})

minetest.register_tool("nssm:death_scythe", {
	description = "Death Scythe",
	wield_scale= {x=3,y=3,z=1.3},
	inventory_image = "death_scythe.png",
	tool_capabilities = {
		full_punch_interval =0 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.1, [2]=0.1, [3]=0.1}, uses=28000, maxlevel=1},
			fleshy={times={[2]=0.1, [3]=0.1}, uses=28000, maxlevel=1}
		},
		damage_groups = {fleshy=42},
	},
	--groups ={not_in_creative_inventory=1},
	on_drop = function(itemstack, dropper, pos)
	    local objects = minetest.env:get_objects_inside_radius(pos, 10)
	    local flag = 0
		dropper:set_hp(dropper:get_hp()-9)
	    for _,obj in ipairs(objects) do
			flag = 0
            if (obj:is_player()) then
                if (obj:get_player_name()~=dropper:get_player_name()) then
                    obj:set_hp(obj:get_hp()-55)
                    flag = 1
                end
            else
                if (obj:get_luaentity().health) then
                    obj:get_luaentity().health = obj:get_luaentity().health -40
                    check_for_death(obj:get_luaentity())
                    flag = 1
                end
            end
			if flag == 1 then
				for i = 1,math.random(1,2) do
					drop = minetest.add_item(pos, "nssm:energy_globe 1")

					if drop then
						drop:setvelocity({
							x = math.random(-10, 10) / 9,
							y = 5,
							z = math.random(-10, 10) / 9,
						})
					end
				end
			end
	    end
		local pos = dropper:getpos()
		local vec = {x=5,y=5,z=5}
		local poslist = minetest.find_nodes_in_area(vector.subtract(pos, vec), vector.add(pos,vec), "default:dirt_with_grass")
		for _,v in pairs(poslist) do
			--minetest.chat_send_all(minetest.pos_to_string(v))
			minetest.set_node(v, {name="default:dirt_with_dry_grass"})
			if math.random(1,3)==1 then
				v.y = v.y +2
				drop = minetest.add_item(v, "nssm:life_energy 1")
				drops(drop)
			end
		end

		local poslist = minetest.find_nodes_in_area_under_air(vector.subtract(pos, vec), vector.add(pos,vec), "group:flora")
		for _,v in pairs(poslist) do
			--minetest.chat_send_all(minetest.pos_to_string(v))
			minetest.set_node(v, {name="default:dry_shrub"})
			if math.random(1,3)==1 then
				v.y = v.y +2
				drop = minetest.add_item(v, "nssm:life_energy 1")
				drops(drop)
			end
		end

		local poslist = minetest.find_nodes_in_area(vector.subtract(pos, vec), vector.add(pos,vec), "group:leaves")
		for _,v in pairs(poslist) do
			--minetest.chat_send_all(minetest.pos_to_string(v))
			minetest.set_node(v, {name="nssm:dead_leaves"})
			if math.random(1,3)==1 then
				v.y = v.y +2
				drop = minetest.add_item(v, "nssm:life_energy 1")
				drops(drop)
			end
		end
	end,
})

minetest.register_tool("nssm:life_wand", {
	description = "Life Energy Wand",
	inventory_image = "life_wand.png",
	tool_capabilities = {
		full_punch_interval =4,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=0.7, [3]=0.3}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=1},
	},
	on_drop = function(itemstack, dropper, pos)
		local pname = dropper:get_player_name()
		local player_inv = minetest.get_inventory({type='player', name = pname})
		local found = 0
		for i = 1,32 do
			local items = player_inv:get_stack('main', i)
			local n = items:get_name()
			if n == "nssm:life_energy" then
				found = i
				break
			end
		end
		if found == 0 then
			minetest.chat_send_player(pname, "You haven't got any Life Energy!")
			return
		else
			local items = player_inv:get_stack('main', found)
			items:take_item()
			player_inv:set_stack('main', found, items)
			dropper:set_hp(dropper:get_hp()+2)
		end
	end,
})

--[[minetest.register_tool("nssm:nature_wand", {
	description = "Nature Wand",
	inventory_image = "nature_wand.png",
	tool_capabilities = {
		full_punch_interval =4,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=0.7, [3]=0.3}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=1},
	},
	on_drop = function(itemstack, dropper, pos)
		local pname = dropper:get_player_name()
		local player_inv = minetest.get_inventory({type='player', name = pname})
		local found = 0
		for i = 1,32 do
			local items = player_inv:get_stack('main', i)
			local n = minetest.get_node_group(items, {"group:flora"})
			minetest.chat_send_all (n)
			local m = minetest.get_node_group(items, {"group:sapling"})
			minetest.chat_send_all (m)
			local o = minetest.get_node_group(items, {"group:leaves"})
			minetest.chat_send_all (o)
			if n == 1 or m == 1 or o == 1 then
				found = i
				break
			end
		end
		if found == 0 then
			minetest.chat_send_player(pname, "You haven't got any Plant!")
			return
		else
			local items = player_inv:get_stack('main', found)
			items:take_item()
			player_inv:set_stack('main', found, items)
			dropper:set_hp(dropper:get_hp()+1)
		end
	end,
})]]

minetest.register_tool("nssm:stone_wand", {
	description = "Stone Wand",
	inventory_image = "stone_wand.png",
	tool_capabilities = {
		full_punch_interval =4,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=0.7, [3]=0.3}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=1},
	},
	on_drop = function(itemstack, dropper, pos)
		local pname = dropper:get_player_name()
		local player_inv = minetest.get_inventory({type='player', name = pname})
		local found = 0
		for i = 1,32 do
			local items = player_inv:get_stack('main', i)
			local n = items:get_name()
			if n == "default:stone" or n=="default:sandstone" or n=="default:desert_stone" or n=="default:desert_sandstone" or n=="default:silver_sandstone" then
				found = i
				break
			end
		end
		if found == 0 then
			minetest.chat_send_player(pname, "You haven't got any Stone Block!")
			return
		else
			local items = player_inv:get_stack('main', found)
			items:take_item()
			player_inv:set_stack('main', found, items)
			dropper:set_hp(dropper:get_hp()+1)
		end
	end,
})

minetest.register_tool("nssm:melting_knife", {
	description = "Melting Knife",
	wield_scale= {x=1,y=1,z=1},
	inventory_image = "melting_knife.png",
	tool_capabilities = {
		full_punch_interval =0.3,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.9, [2]=0.7, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.6, [3]=0.2}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=4},
	},
	on_drop = function(itemstack, dropper, pos)
		local pos = dropper:getpos()
		local vec = {x=2,y=3,z=2}
		local poslist = minetest.find_nodes_in_area(vector.subtract(pos, vec), vector.add(pos,vec), "default:ice")
		for _,v in pairs(poslist) do
			--vita = vita -1
			--if vita == 0 then return else
				minetest.set_node(v, {name="default:water_flowing"})
				dropper:set_hp(dropper:get_hp()+1)
		  --end
	 	end

		local poslist = minetest.find_nodes_in_area(vector.subtract(pos, vec), vector.add(pos,vec), "nssm:coldest_ice")
		--minetest.chat_send_all(vita)
		for _,v in pairs(poslist) do
			--vita = vita -1
			--if vita == 0 then return else
				minetest.set_node(v, {name="default:water_flowing"})
				dropper:set_hp(dropper:get_hp()+1)
			--end
		end
	end

})

minetest.register_tool("nssm:frozing_knife", {
	description = "Frozing Knife",
	wield_scale= {x=1,y=1,z=1},
	inventory_image = "frozing_knife.png",
	tool_capabilities = {
		full_punch_interval =0.3,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.9, [2]=0.7, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.6, [3]=0.2}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=4},
	},
	on_drop = function(itemstack, dropper, pos)
		local pos = dropper:getpos()
		local vec = {x=3,y=4,z=3}
		--local vita = 21 - dropper:get_hp()
		local poslist = minetest.find_nodes_in_area(vector.subtract(pos, vec), vector.add(pos,vec), "group:water")
		--minetest.chat_send_all(vita)
		for _,v in pairs(poslist) do
			--vita = vita -1
			--if vita == 0 then return else
				minetest.set_node(v, {name="default:ice"})
				--dropper:set_hp(dropper:get_hp()+1)
		  --end
	 	end
	end

})

minetest.register_tool("nssm:sand_sword", {
	description = "Sandeater Sword",
	wield_scale= {x=1,y=1,z=1},
	inventory_image = "sand_sword.png",
	tool_capabilities = {
		full_punch_interval =0.6,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.9, [2]=0.7, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.6, [3]=0.2}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=10},
	},
	on_drop = function(itemstack, dropper, pos)
		local pos = dropper:getpos()
		local vec = {x=2,y=1,z=2}
		local vita = 21 - dropper:get_hp()
		local poslist = minetest.find_nodes_in_area(vector.subtract(pos, vec), vector.add(pos,vec), "group:sand")
		for _,v in pairs(poslist) do
			vita = vita -1
			if vita == 0 then return else
				minetest.remove_node(v)
				dropper:set_hp(dropper:get_hp()+1)
		  end
	 	end
	end

})

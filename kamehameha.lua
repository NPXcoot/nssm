--Kamehameha!
kame_velocity = 30,
minetest.register_entity("nssm:kamehameha", {
	textures = {"kamehameha.png"},
	on_step = function (self, pos, node, dtime)
		local pos = self.object:getpos()
		local objs = minetest.env:get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
        for k, obj in pairs(objs) do
            if obj:is_player() then
    			return
            else
                obj:set_hp(obj:get_hp()-20)
					--[[
				    if obj:get_entity_name() ~= "nssm:kamehameha" then
						if obj:get_hp()<=0 then
							obj:remove()
						end
					end
					]]--
			end
        end

		local n = minetest.env:get_node(pos).name

		if n ~= "kamehameha:kame_entity" and n ~="default:stone" and n ~="default:desert_stone"  then
			if minetest.registered_nodes[n].groups.flammable --[[or math.random(1, 100) <= 1]] then
				minetest.env:set_node(pos, {name="fire:basic_flame"})
			else
				minetest.env:set_node(pos, {name="air"})

				local v = self.object:getvelocity()
				local c=1
				local c2=0

				--[[
				for dx = -c*(math.abs(v.x))-c2 , c*(math.abs(v.x))+c2 do
					for dy= -c*(math.abs(v.y))-c2, c*(math.abs(v.y))+c2 do
						for dz = -c*(math.abs(v.z))-c2 , c*(math.abs(v.z))+c2 do
							local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							minetest.env:remove_node(p)
						end
					end
				end
				]]--

				--[[
				for dx=-1,1 do
					for dy=-1,1 do
						for dz=-1,1 do
							local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							minetest.env:set_node(p, {name="air"})
						end
					end
				end

				]]--

			end
		elseif n == "default:stone" or n =="default:desert_stone" then
			self.hit_node(self, pos, node)
			self.object:remove()
			return
		end

		--[[
		for dx=-1,1 do
			for dy=-1,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(p).name
					if n ~= "kamehameha:kame_entity" and n ~="default:stone" and n ~="default:desert_stone"  then
						if minetest.registered_nodes[n].groups.flammable then --or math.random(1, 100) <= 1 then
							minetest.env:set_node(t, {name="fire:basic_flame"})
						else
							minetest.env:set_node(t, {name="air"})
						end
					elseif n == "default:stone" or n =="default:desert_stone" then
						self.hit_node(self, pos, node)
						self.object:remove()
						return
					end
				end
			end
		end
		]]--
	end,

	hit_node = function(self, pos, node)
		--[[
		                    --This is the particle spawner, but it will slow your pc. If you have a powerful pc you can uncomment this section
							minetest.add_particlespawner(
					1, --amount
					0.1, --time
					{x=pos.x-3, y=pos.y-3, z=pos.z-3}, --minpos
					{x=pos.x+3, y=pos.y+3, z=pos.z+3}, --maxpos
					{x=-0, y=-0, z=-0}, --minvel
					{x=0, y=0, z=0}, --maxvel
					{x=-0.5,y=5,z=-0.5}, --minacc
					{x=0.5,y=5,z=0.5}, --maxacc
					0.1, --minexptime
					1, --maxexptime
					8, --minsize
					15, --maxsize
					false, --collisiondetection
					"tnt_smoke.png" --texture
				)
		]]--
		local objects = minetest.env:get_objects_inside_radius(pos, 4)
		for _,obj in ipairs(objects) do
			if obj:is_player() or (obj:get_luaentity() and obj:get_luaentity().name ~= "__builtin:item") then
				local obj_p = obj:getpos()
				local vec = {x=obj_p.x-pos.x, y=obj_p.y-pos.y, z=obj_p.z-pos.z}
				local dist = (vec.x^2+vec.y^2+vec.z^2)^0.5
				local damage = (80*0.5^dist)*2
				obj:punch(obj, 1.0, {
					full_punch_interval=1.0,
					damage_groups={fleshy=damage},
				}, vec)
			end
		end
		minetest.sound_play("boom", {max_hear_distance = 100})
		for dx=-4,4 do
			for dy=-4,4 do
				for dz=-4,4 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(p).name
					if math.random(1, 50) <= 35 then
						minetest.env:remove_node(p)
					end
					if minetest.registered_nodes[n].groups.flammable or math.random(1, 100) <=5 then
						minetest.env:set_node(p, {name="fire:basic_flame"})
					end
				end
			end
		end
	end
})

minetest.register_tool("nssm:kamehameha_hand", {
	description = "Kamehameha",
	inventory_image = "kamehameha_hand.png",
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "nssm:kamehameha")
			local vec = {x=dir.x*kame_velocity,y=dir.y*kame_velocity,z=dir.z*kame_velocity}
			obj:setvelocity(vec)
		return itemstack
	end,
	light_source = 12,
})

minetest.register_craft({
	output = 'nssm:kamehameha_hand',
	recipe = {
		{'nssm:great_energy_globe', 'nssm:great_energy_globe', 'nssm:great_energy_globe'},
		{'nssm:great_energy_globe', '', 'nssm:great_energy_globe'},
		{'nssm:great_energy_globe', 'nssm:great_energy_globe', 'nssm:great_energy_globe'},
	}
})

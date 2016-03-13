--Kamehameha!
kame_velocity = 30
exp_radius = 4

local function round(n)
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end


minetest.register_entity("nssm:kamehameha", {
	textures = {"kamehameha.png"},
	on_step = function (self, pos, node, dtime)
		local pos = self.object:getpos()

		--while going around it damages entities
		local objects = minetest.env:get_objects_inside_radius(pos, 2)
		for _,obj in ipairs(objects) do
			if (obj:is_player()) then
			elseif (obj:get_luaentity() and obj:get_luaentity().name ~= "__builtin:item") then
				obj:set_hp(obj:get_hp()-20)
				if (obj:get_hp() <= 0) then
                	if (not obj:is_player()) and obj:get_entity_name() ~= "nssm:kamehameha" then
                    	obj:remove()
                	end
            	end
			end
		end

		local n = minetest.env:get_node(pos).name

		if n ~="default:stone" and n ~="default:desert_stone" then
			if minetest.registered_nodes[n].groups.flammable --[[or math.random(1, 100) <= 1]] then
				minetest.env:set_node(pos, {name="fire:basic_flame"})
			else
				minetest.env:set_node(pos, {name="air"})

				local vec = self.object:getvelocity()
				local c=3

				--calculate how many blocks around the kamehameha need to be removed
				local i = round(math.abs(math.abs(vec.x)-kame_velocity)*0.01*c)
				local j = round(math.abs(math.abs(vec.y)-kame_velocity)*0.01*c)
				local k = round(math.abs(math.abs(vec.z)-kame_velocity)*0.01*c)

				for dx = -i,i do
					for dy= -j,j do
						for dz = -k,k do
							local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							minetest.env:remove_node(p)
						end
					end
				end
			end
		else
			self.hit_node(self, pos, node)
			self.object:remove()
			return
		end
	end,

	hit_node = function(self, pos, node)
		--This is the particle spawner, if it slows down your pc then comment this section
		minetest.add_particlespawner(
			100, --amount
			0.1, --time
			{x=pos.x-3, y=pos.y-3, z=pos.z-3}, --minpos
			{x=pos.x+3, y=pos.y+3, z=pos.z+3}, --maxpos
			{x=0, y=0, z=0}, --minvel
			{x=0.1, y=0.3, z=0.1}, --maxvel
			{x=-0.5,y=1,z=-0.5}, --minacc
			{x=0.5,y=1,z=0.5}, --maxacc
			0.1, --minexptime
			2, --maxexptime
			6, --minsize
			12, --maxsize
			false, --collisiondetection
			"tnt_smoke.png" --texture
		)
        --end of the particle spawner

		--Damages entities around (not the player)
		local objects = minetest.env:get_objects_inside_radius(pos, exp_radius)
		for _,obj in ipairs(objects) do
			if (obj:is_player()) then
			elseif (obj:get_luaentity() and obj:get_luaentity().name ~= "__builtin:item") then
				local obj_p = obj:getpos()
				local vec = {x=obj_p.x-pos.x, y=obj_p.y-pos.y, z=obj_p.z-pos.z}
				local dist = (vec.x^2+vec.y^2+vec.z^2)^0.5
				local damage = 21-dist*5
				obj:set_hp(obj:get_hp()-damage)
				if (obj:get_hp() <= 0) then
                	if (not obj:is_player()) and obj:get_entity_name() ~= "nssm:kamehameha" then
                    	obj:remove()
                	end
            	end
			end
		end

		minetest.sound_play("boom", {max_hear_distance = 100})

		for dx=-1,1 do
			for dy=-1,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
                    local n = minetest.env:get_node(p).name
                    if n~="air" then
					    minetest.env:remove_node(p)
                    end
				end
			end
		end


        local i, j, k
        local c=400
        for i=2,exp_radius do
            local max
            local num =4*((i*2)^3)
            if c/i<num then
                max = c/i
            else
                max = num
            end
            for j=1,max do
                local p = {x=pos.x+math.random(-i,i), y=pos.y+math.random(-i,i), z=pos.z+math.random(-i,i)}
                local n = minetest.env:get_node(p).name
                if n~="air" and ( math.abs(p.x-pos.x)==i ) or (math.abs(p.y-pos.y)==i) or (math.abs(p.y-pos.y)==i) then
                --if ( math.abs(p.x-pos.x)==i ) or (math.abs(p.y-pos.y)==i) or (math.abs(p.y-pos.y)==i) then
                    minetest.env:remove_node(p)
                end
            end
        end


        --old explosion function:
		--[[
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
		]]--
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

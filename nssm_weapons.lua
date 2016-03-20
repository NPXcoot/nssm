local default_dir = {
    x = 1,
    y = 1,
    z = 1,
}

local function node_ok(pos, fallback)

	fallback = fallback or "default:dirt"

	local node = minetest.get_node_or_nil(pos)

	if not node then
		return minetest.registered_nodes[fallback]
	end

	if minetest.registered_nodes[node.name] then
		return node
	end

	return minetest.registered_nodes[fallback]
end

function weapons_shot(itemstack, placer, pointed_thing, velocity, name)
    local dir = placer:get_look_dir();
    local playerpos = placer:getpos();
    local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "nssm:"..name)
    local vec = {x=dir.x*velocity,y=dir.y*velocity,z=dir.z*velocity}
    obj:setvelocity(vec)
    return itemstack
end

function search_on_step(self, dtime, name, max_time, damage, dir, radius, not_transparent, vel, timer)
    --local timer = 0
    local pos = self.object:getpos()
    local vel = self.object:getvelocity()
    minetest.register_globalstep(function(dtime)
        timer = timer + dtime
        --minetest.chat_send_all("Time: = "..timer.." Max_time: "..max_time)
        if timer>max_time then
            self.object:remove()
        end
    end)

    --while going around it damages entities
    local objects = minetest.env:get_objects_inside_radius(pos, 30)
    local min_dist = 100
    local obj_min = nil
    local obj_p = nil
    local vec_min = nil
    for _,obj in ipairs(objects) do
        if (obj:is_player()) then
        elseif (obj:get_luaentity() and obj:get_luaentity().name ~= "__builtin:item" and obj:get_luaentity().name ~= self.object:get_luaentity().name) then
            obj_p = obj:getpos()
            local vec = {x=obj_p.x-pos.x, y=obj_p.y-pos.y, z=obj_p.z-pos.z}
            local dist = (vec.x^2+vec.y^2+vec.z^2)^0.5
            if (dist<min_dist) then
                min_dist = dist
                obj_min = obj
                vec_min = vec
            end
        end
    end

    local new_vel = {x=0, y=0, z=0}

    local dir = 0
    local max_diff = 0

    if (max_diff<math.abs(vec_min.x)) then
        dir = 1
        max_diff = math.abs(vec_min.x)
    end
    if (max_diff<math.abs(vec_min.y)) then
        dir = 2
        max_diff = math.abs(vec_min.y)
    end
    if (max_diff<math.abs(vec_min.z)) then
        dir = 3
        max_diff = math.abs(vec_min.z)
    end

    vec_min.x = (vec_min.x/max_diff)*4
    vec_min.y = (vec_min.y/max_diff)*4
    vec_min.z = (vec_min.z/max_diff)*4
    obj_p = obj_min:getpos()
    if obj_min ~= nil then
        if min_dist == 0 then
            self.object:setvelocity(new_vel)
        else
            self.object:setvelocity(vec_min)
            --[[
            dir = 0
            max_diff = 0

            if (max_diff<math.abs(vec_min.x)) then
                dir = 1
                max_diff = math.abs(vec_min.x)
            end
            if (max_diff<math.abs(vec_min.y)) then
                dir = 2
                max_diff = math.abs(vec_min.y)
            end
            if (max_diff<math.abs(vec_min.z)) then
                dir = 3
                max_diff = math.abs(vec_min.z)
            end

            if dir==1 then
                new_vel.x = 1
            elseif dir==2 then
                new_vel.y = 1
            elseif dir==3 then
                new_vel.z = 1
            end
            self.object:setvelocity(new_vel)
            ]]--
        end
    end
end

function default_on_step(self, dtime, name, max_time, damage, dir, radius, not_transparent, vel, timer)
    --local timer = 0
    local pos = self.object:getpos()
    minetest.register_globalstep(function(dtime)
        timer = timer + dtime
        --minetest.chat_send_all("Time: = "..timer.." Max_time: "..max_time)
        if timer>max_time then
            self.object:remove()
        end
    end)

    --while going around it damages entities
    local objects = minetest.env:get_objects_inside_radius(pos, 2)
    for _,obj in ipairs(objects) do
        if (obj:is_player()) then
        elseif (obj:get_luaentity() and obj:get_luaentity().name ~= "__builtin:item") then
            obj:set_hp(obj:get_hp()-damage)
            if (obj:get_hp() <= 0) then
                if (not obj:is_player()) and obj:get_entity_name() ~= "nssm:"..name then
                    obj:remove()
                end
            end
        end
    end

    local n = minetest.env:get_node(pos).name

    if n ~=not_transparent or not_transparent==nil then
        --minetest.env:set_node(pos, {name="air"})
        local vec = self.object:getvelocity()
        local c=vel/10
        --calculate how many blocks around need to be removed
        local max = 0
        local posmax = 0
        if max<vec.x then
            max = math.abs(vec.x)
            posmax = 1
        end
        if max<vec.y then
            max = math.abs(vec.y)
            posmax = 2
        end
        if max<vec.z then
            max = math.abs(vec.z)
            posmax = 3
        end

        local i = radius
        local j = radius
        local k = radius
        if dir.x == 0 then
            i = 0
        end
        if dir.y == 0 then
            j = 0
        end
        if dir.z == 0 then
            k = 0
        end

        if posmax==1 then
            i = 0
        end

        if posmax==2 then
            j = 0
        end

        if posmax==3 then
            k = 0
        end

        --local i = nssm:round(math.abs(math.abs(vec.x)-vel)*0.01*c*dir.x)*radius
        --local j = nssm:round(math.abs(math.abs(vec.y)-vel)*0.01*c*dir.y)*radius
        --local k = nssm:round(math.abs(math.abs(vec.z)-vel)*0.01*c*dir.z)*radius

        for dx = -i,i do
            for dy= -j,j do
                for dz = -k,k do
                    local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
                    minetest.env:remove_node(p)
                end
            end
        end
    else
        local node = node_ok(pos).name
        self.hit_node(self, pos, node)
        self.object:remove()
        return
    end
end

--function default_on_step(self, pos, node, name, max_time, damage, dir, not_transparent, vel, dtime)
function nssm_register_weapon(name, def)
    minetest.register_entity("nssm:"..name, {
        textures = {name..".png"},
        on_step = function(self, dtime)
            def.on_step(self, dtime)
        end,
        hit_node = function(self, pos, node)
            def.hit_node(self, pos, node)
        end,
    })

    minetest.register_tool("nssm:"..name.."_hand", {
        description = def.description,
        inventory_image = name.."_hand.png",
        on_use = function(itemstack, placer, pointed_thing)
            weapons_shot(itemstack, placer, pointed_thing, def.velocity, name)
            return itemstack
        end,
    })

    minetest.register_craft({
		output = 'nssm:'..name.."_hand",
		recipe = {
			{'nssm:great_energy_globe', 'nssm:great_energy_globe', 'nssm:great_energy_globe'},
            {'nssm:great_energy_globe', def.material, 'nssm:great_energy_globe'},
            {'nssm:great_energy_globe', 'nssm:great_energy_globe', 'nssm:great_energy_globe'}
		}
	})
    --[[

    --this recipe doesn't work for a misterious reason
    minetest.register_craft({
        output = 'nssm:'..name.."_hand",
        recipe = {
            {
        		{'nssm:great_energy_globe', 'nssm:great_energy_globe', 'nssm:great_energy_globe'},
        		{'nssm:great_energy_globe', def.material, 'nssm:great_energy_globe'},
        		{'nssm:great_energy_globe', 'nssm:great_energy_globe', 'nssm:great_energy_globe'},
        	}
        }
    })
    ]]

end

--function default_on_step(self, pos, node, name, max_time, damage, dir, not_transparent, vel, dtime)
--function default_on_step(self, dtime, name, max_time, damage, dir, not_transparent, vel)
nssm_register_weapon("kamehameha", {
    on_step = function(self, dtime)
        default_on_step(self, dtime, "kamehameha", 10, 20, default_dir, 1, "group:cracky", 25,0)
    end,
    hit_node = function(self, pos, node)
        nssm:explosion(pos, 8, 1)
    end,
    material = "default:stick",
    description = "Kamehameha from DragonBall",
    velocity = 25,
})

--[[nssm_register_weapon("kienzan", {
    on_step = function(self, dtime)
        default_on_step(self, dtime, "kienzan", 3, 20, {x=1, y=0, z=1}, 1, nil, 25,0)
    end,
    hit_node = function(self, pos, node)
    end,
    material = "",
    description = "Kienzan from DragonBall",
    velocity = 25,
})
]]

nssm_register_weapon("kienzan", {
    on_step = function(self, dtime)
        search_on_step(self, dtime, "kienzan", 5, 20, {x=1, y=0, z=1}, 1, nil, 25,0)
    end,
    hit_node = function(self, pos, node)
    end,
    material = "",
    description = "Kienzan from DragonBall",
    velocity = 25,
})

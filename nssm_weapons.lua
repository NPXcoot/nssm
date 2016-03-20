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

function default_on_step(self, dtime, name, max_time, damage, dir, radius, not_transparent, vel)
    local timer = 0
    local pos = self.object:getpos()
    minetest.register_globalstep(function(dtime)
        timer = timer + dtime
        if (timer>max_time) then
            self.object:remove()
        end
    end)

    --while going around it damages entities
    local objects = minetest.env:get_objects_inside_radius(pos, 0)
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
        output = "nssm:caccamerda",
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
        default_on_step(self, dtime, "kamehameha", 10, 20, default_dir, 10, "group:cracky", 25)
    end,
    hit_node = function(self, pos, node)
        nssm:explosion(pos, 8, 1)
    end,
    material = "default:stick",
    description = "Kamehameha from DragonBall",
    velocity = 25,
})

nssm_register_weapon("kienzan", {
    on_step = function(self, dtime)
        default_on_step(self, dtime, "kienzan", 5, 20, {x=1, y=0, z=1}, 1, nil, 25)
    end,
    hit_node = function(self, pos, node)
    end,
    material = "",
    description = "Kienzan from DragonBall",
    velocity = 25,
})

--[[
minetest.register_craft({
    output = 'nssm:_hand',
    recipe = {
        {
            {'nssm:great_energy_globe', 'nssm:great_energy_globe', 'nssm:great_energy_globe'},
            {'nssm:great_energy_globe', 'default:stick', 'nssm:great_energy_globe'},
            {'nssm:great_energy_globe', 'nssm:great_energy_globe', 'nssm:great_energy_globe'},
        }
    }
})
]]--

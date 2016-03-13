-- set content id's
local c_air = minetest.get_content_id("air")
local c_ignore = minetest.get_content_id("ignore")
local c_obsidian = minetest.get_content_id("default:obsidian")
local c_brick = minetest.get_content_id("default:obsidianbrick")
local c_chest = minetest.get_content_id("default:chest_locked")

-- get node but use fallback for nil or unknown
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

function nssm:round(n)
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

function nssm:explosion_particles(exp_radius)
    minetest.add_particlespawner(
        100*exp_radius, --amount
        0.1, --time
        {x=pos.x-exp_radius, y=pos.y-exp_radius, z=pos.z-exp_radius}, --minpos
        {x=pos.x+exp_radius, y=pos.y+exp_radius, z=pos.z+exp_radius}, --maxpos
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
end

function nssm:explosion(pos, exp_radius, fire)
    local radius = exp_radius
    -- if area protected or near map limits then no blast damage
	if minetest.is_protected(pos, "")
	or not within_limits(pos, radius) then
		return
	end

    --sound
    minetest.sound_play("boom", {
        pos = pos,
        max_hear_distance = exp_radius*4,
    })

    --particles:
    nssm:explosion_particles(exp_radius)

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

    --damages blocks around and if necessary put some fire
    pos = vector.round(pos) -- voxelmanip doesn't work properly unless pos is rounded ?!?!
    local vm = VoxelManip()
    local minp, maxp = vm:read_from_map(vector.subtract(pos, radius), vector.add(pos, radius))
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	local p = {}
	local pr = PseudoRandom(os.time())

    --remove everything near the center of the explosion
    for dz=-radius,radius do
        for dy=-radius,radius do
        	local vi = a:index(pos.x + (-radius), pos.y + y, pos.z + z)
            for dx=-radius,radius do
                local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}

                if (x * x) + (y * y) + (z * z) <= (radius * radius) + pr:next(-radius, radius)
        		and data[vi] ~= c_air
        		and data[vi] ~= c_ignore
        		and data[vi] ~= c_obsidian
        		and data[vi] ~= c_brick
        		and data[vi] ~= c_chest then

                    local n = node_ok(p).name
        			local on_blast = minetest.registered_nodes[n].on_blast

        			if on_blast then
        				return on_blast(p)
        			end

        			if minetest.get_item_group(n, "unbreakable") ~= 1 then

        				-- if chest then drop items inside
        				if n == "default:chest"
        				or n == "3dchest:chest"
        				or n == "bones:bones" then

        					local meta = minetest.get_meta(p)
        					local inv  = meta:get_inventory()

        					for i = 1, inv:get_size("main") do

        						local m_stack = inv:get_stack("main", i)
        						local obj = minetest.add_item(p, m_stack)

        						if obj then

        							obj:setvelocity({
        								x = math.random(-2, 2),
        								y = 7,
        								z = math.random(-2, 2)
        							})
        						end
        					end
        				end

        				-- after effects
        				if fire > 0
        				and (minetest.registered_nodes[n].groups.flammable
        				or math.random(1, 100) <= 10) then
        					minetest.set_node(p, {name = "fire:basic_flame"})
        				else
                            local dist = nssm:round(((pos.x-p.x)^2 + (pos.y-p.y)^2 + (pos.z-p.z)^2)^1/2)
                            local prob = 1/dist
                            if math.random(1,100)<=prob*100 then
                                minetest.env:remove_node(p)
                            end
        				end
        			end
                end
                vi = vi+1
            end
        end
    end

end

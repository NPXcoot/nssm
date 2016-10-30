-- set content id's
local c_air = minetest.get_content_id("air")
local c_ignore = minetest.get_content_id("ignore")
local c_obsidian = minetest.get_content_id("default:obsidian")
local c_brick = minetest.get_content_id("default:obsidianbrick")
local c_chest = minetest.get_content_id("default:chest_locked")

nssm.lessvirulent = minetest.setting_getbool("nssm.lessvirulent") or false
nssm.safebones = minetest.setting_getbool("nssm.safebones") or false
nssm.cryosave = minetest.setting_getbool("nssm.cryosave") or false

function nssm:virulence(mobe)
	if not nssm.lessvirulent then
		return 0
	end
	return math.ceil(100 / mobe.hp_max)
end

function nssm:affectbones(mobe) -- as function for adaptable heuristic
	return not nssm.safebones
end

function perpendicular_vector(vec) --returns a vector rotated of 90° in 2D
	local ang = math.pi/2
	local c = math.cos(ang)
	local s = math.sin(ang)

	local i = vec.x*c - vec.z*s
	local k = vec.x*s + vec.z*c
	local j = vec.y

	vec = {x=i, y=j, z=k}
	return vec
end

function add_entity_and_particles(entity, pos, particles, multiplier)
	minetest.add_particlespawner({
		amount = 100*multiplier,
		time = 2,
		minpos = {x=pos.x-2, y=pos.y-1, z=pos.z-2},
		maxpos = {x=pos.x+2, y=pos.y+4, z=pos.z+2},
		minvel = {x=0, y=0, z=0},
		maxvel = {x=1, y=2, z=1},
		minacc = {x=-0.5,y=0.6,z=-0.5},
		maxacc = {x=0.5,y=0.7,z=0.5},
		minexptime = 2,
		maxexptime = 3,
		minsize = 3,
		maxsize = 5,
		collisiondetection = false,
		vertical = false,
		texture = particles,
	})
	minetest.add_entity(pos, entity)
end

-- get node but use fallback for nil or unknown
function node_ok(pos, fallback)
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

function dist_pos(p, s)
	local v = {x = math.abs(s.x-p.x), y = math.abs(s.y-p.y), z = math.abs(s.z-p.z)}
	local r = math.sqrt(v.x^2+v.y^2+v.z^2)
	return r
end

--check_for_death functions customized for monsters who respawns (Masticone)
function check_for_death_hydra(self)
	local hp = self.object:get_hp()
	if hp > 0 then
		self.health = hp
		if self.sounds.damage ~= nil then
			minetest.sound_play(self.sounds.damage,{
				object = self.object,
				max_hear_distance = self.sounds.distance
			})
		end
		return false
	end
	local pos = self.object:getpos()
	local obj = nil
	if self.sounds.death ~= nil then
		minetest.sound_play(self.sounds.death,{
			object = self.object,
			max_hear_distance = self.sounds.distance
		})
	end
		self.object:remove()
	return true
end


function round(n)
	if (n>0) then
		return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
	else
		n=-n
		local t = n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
		return -t
	end
end

function explosion_particles(pos, exp_radius)
    minetest.add_particlespawner(
        100*exp_radius/2, --amount
        0.1, --time
        {x=pos.x-exp_radius, y=pos.y-exp_radius, z=pos.z-exp_radius}, --minpos
        {x=pos.x+exp_radius, y=pos.y+exp_radius, z=pos.z+exp_radius}, --maxpos
        {x=0, y=0, z=0}, --minvel
        {x=0.1, y=0.3, z=0.1}, --maxvel
        {x=-0.5,y=1,z=-0.5}, --minacc
        {x=0.5,y=1,z=0.5}, --maxacc
        0.1, --minexptime
        4, --maxexptime
        6, --minsize
        12, --maxsize
        false, --collisiondetection
        "tnt_smoke.png" --texture
    )
end

function explosion(pos, exp_radius, fire, kamehameha_bad)
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
    explosion_particles(pos, exp_radius)

    --Damages entities around (not the player)
    local objects = minetest.env:get_objects_inside_radius(pos, exp_radius)
    for _,obj in ipairs(objects) do
        local obj_p = obj:getpos()
        local vec = {x=obj_p.x-pos.x, y=obj_p.y-pos.y, z=obj_p.z-pos.z}
        local dist = (vec.x^2+vec.y^2+vec.z^2)^0.5
		local damage = (-exp_radius*dist+exp_radius^2)*2
		if not kamehameha_bad then
			obj:set_hp(obj:get_hp()-damage)
	        if (obj:get_hp() <= 0) then
	            if (not obj:is_player()) then
	                obj:remove()
	            end
	        end
		else
			if (obj:get_luaentity()) then
				local name = obj:get_luaentity().name
				if (name~="nssm:morvalarr0") and (name~="nssm:morvalarr5") then
					obj:set_hp(obj:get_hp()-(damage*3))
			        if (obj:get_hp() <= 0) then
			            if (not obj:is_player()) then
			                obj:remove()
			            end
			        end
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
        	local vi = a:index(pos.x + (-radius), pos.y + dy, pos.z + dz)
            for dx=-radius,radius do
                local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}

                if (dx * dx) + (dy * dy) + (dz * dz) <= (radius * radius) + pr:next(-radius, radius)
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
        				or math.random(1, 100) <= 3) then
        					minetest.set_node(p, {name = "fire:basic_flame"})
        				else
                            local dist = round(((pos.x-p.x)^2 + (pos.y-p.y)^2 + (pos.z-p.z)^2)^1/2)
                            local prob = 2/dist
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

--			SPECIAL ABILITIES OF SOME MOBS
function digging_ability(
	self,		--the entity of the mob
	group,		--group of the blocks the mob can dig: nil=everything
	max_vel,	--max velocity of the mob
	dim 		--vector representing the dimensions of the mob
	)

	--if math.random(1,nssm:virulence(self)) ~= 1 then return end

	local v = self.object:getvelocity()
	local pos = self.object:getpos()

	if minetest.is_protected(pos, "") then
		return
	end

	local h = dim.y

	local max = 0
	--local posmax = 0 --			1 = x, -1=-x, 2 = z, -2 = -z
	local yaw = (self.object:getyaw() + self.rotate) or 0
	local x = math.sin(yaw)*-1
	local z = math.cos(yaw)

	local i = 1
	local i1 = -1
	local k = 1
	local k1 = -1

	local multiplier = 2

	if x>0 then
		i = round(x*max_vel)*multiplier
	else
		i1 = round(x*max_vel)*multiplier
	end

	if z>0 then
		k = round(z*max_vel)*multiplier
	else
		k1 = round(z*max_vel)*multiplier
	end

	for dx = i1, i do
		for dy = 0, h do
			for dz = k1, k do
				local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}

				local n = minetest.env:get_node(p).name
				--local up = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
				if group == nil then
					if minetest.get_item_group(n, "unbreakable") == 1 or minetest.is_protected(p, "") or (n == "bones:bones" and not nssm:affectbones(self) ) then
					else
						--minetest.env:set_node(p, {name="air"})
						minetest.remove_node(p)
					end
				else
					if (minetest.get_item_group(n, group)==1) and (minetest.get_item_group(n, "unbreakable") ~= 1) and (n == "bones:bones" and not (minetest.is_protected(p, "")) ) then
						--minetest.env:set_node(p, {name="air"})
						minetest.remove_node(p)
					end
				end
			end
		end
	end
end

function digging_attack(
	self,		--the entity of the mob
	group,		--group of the blocks the mob can dig: nil=everything
	max_vel,	--max velocity of the mob
	dim 		--vector representing the dimensions of the mob
	)

	--if math.random(1,nssm:virulence(self)) ~= 1 then return end
	if self.attack and self.attack:is_player() then
		local s = self.object:getpos()
		local p = self.attack:getpos()

		local dir = vector.subtract(p,s)
		dir = vector.normalize(dir)

		pos = vector.add(s,dir)
		if minetest.is_protected(pos, "") then
			return
		end

		for i = 0,dim.y do
			local pos1 = pos
			pos1.y = pos1.y+i

			local n = minetest.env:get_node(pos1).name
			--local up = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			if group == nil then
				if minetest.get_item_group(n, "unbreakable") == 1 or minetest.is_protected(pos1, "") or (n == "bones:bones" and not nssm:affectbones(self) ) then
				else
					--minetest.env:set_node(p, {name="air"})
					minetest.remove_node(pos1)
				end
			else
				if (minetest.get_item_group(n, group)==1) and (minetest.get_item_group(n, "unbreakable") ~= 1) and (n == "bones:bones" and not (minetest.is_protected(pos1, "")) ) then
					--minetest.env:set_node(p, {name="air"})
					minetest.remove_node(pos1)
				end
			end
		end
	end
end


function putting_ability(		--puts under the mob the block defined as 'p_block'
	self,		--the entity of the mob
	p_block, 	--definition of the block to use
	max_vel	--max velocity of the mob
	)
	--if math.random(1,nssm:virulence(self)) ~= 1 then return end

	local v = self.object:getvelocity()

	local dx = 0
	local dz = 0

	if (math.abs(v.x)>math.abs(v.z)) then
		if (v.x)>0 then
			dx = 1
		else
			dx = -1
		end
	else
		if (v.z)>0 then
			dz = 1
		else
			dz = -1
		end
	end

	local pos = self.object:getpos()
	local pos1
	pos.y=pos.y-1
	pos1 = {x = pos.x+dx, y = pos.y, z = pos.z+dz}
	local n = minetest.env:get_node(pos).name
	local n1 = minetest.env:get_node(pos1).name
	local oldmetainf = {minetest.get_meta(pos):to_table(),minetest.get_meta(pos1):to_table() }
	if n~=p_block and not minetest.is_protected(pos, "") and (n == "bones:bones" and nssm:affectbones(self) ) and n~="air" then
		minetest.env:set_node(pos, {name=p_block})
		if nssm.cryosave then
			local metai = minetest.get_meta(pos)
			metai:from_table(oldmetainf[1]) -- this is enough to save the meta
			metai:set_string("nssm",n)
		end
	end
	if n1~=p_block and not minetest.is_protected(pos1, "") and (n == "bones:bones" and nssm:affectbones(self) ) and n~="air" then
		minetest.env:set_node(pos1, {name=p_block})
		if nssm.cryosave then
			local metai = minetest.get_meta(pos1)
			metai:from_table(oldmetainf[2]) -- this is enough to save the meta
			metai:set_string("nssm",n1)
		end
	end
end


function webber_ability(		--puts randomly around the block defined as w_block
	self,		--the entity of the mob
	w_block, 	--definition of the block to use
	radius		--max distance the block can be put
	)

	if (nssm:virulence(self)~=0) and (math.random(1,nssm:virulence(self)) ~= 1) then return end

	local pos = self.object:getpos()
	if (math.random(1,55)==1) then
		local dx=math.random(1,radius)
		local dz=math.random(1,radius)
		local p = {x=pos.x+dx, y=pos.y-1, z=pos.z+dz}
		local t = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
		local n = minetest.env:get_node(p).name
		local k = minetest.env:get_node(t).name
		if ((n~="air")and(k=="air")) and not minetest.is_protected(t, "") then
			minetest.env:set_node(t, {name=w_block})
		end
	end
end

function midas_ability(		--ability to transform every blocks it touches in the m_block block
	self,		--the entity of the mob
	m_block,
	max_vel,	--max velocity of the mob
	mult, 		--multiplier of the dimensions of the area around that need the transformation
	height 		--height of the mob
	)
	--if math.random(1,nssm:virulence(self)) ~= 1 then return end

	local v = self.object:getvelocity()
	local pos = self.object:getpos()

	if minetest.is_protected(pos, "") then
		return
	end

	local max = 0
	local yaw = (self.object:getyaw() + self.rotate) or 0
	local x = math.sin(yaw)*-1
	local z = math.cos(yaw)

	local i = 1
	local i1 = -1
	local k = 1
	local k1 = -1

	local multiplier = mult

	if x>0 then
		i = round(x*max_vel)*multiplier
	else
		i1 = round(x*max_vel)*multiplier
	end

	if z>0 then
		k = round(z*max_vel)*multiplier
	else
		k1 = round(z*max_vel)*multiplier
	end

	for dx = i1, i do
		for dy = -1, height do
			for dz = k1, k do
				local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
				local n = minetest.env:get_node(p).name

				if minetest.get_item_group(n, "unbreakable") == 1 or minetest.is_protected(p, "") or n=="air" or (n == "bones:bones" and not nssm:affectbones(self)) then
				else
					minetest.env:set_node(p, {name=m_block})
				end
			end
		end
	end
end

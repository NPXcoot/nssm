-- arrow (duck_arrow)
nssm:register_arrow("nssm:duck_father", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"duck_egg.png"},
	velocity = 8,
	-- direct hit
	hit_player = function(self, player)
		nssm:duck_explosion_direct(pos, player)
	end,

	hit_mob = function(self, player)
		nssm:duck_explosion_direct(pos, player)
	end,

	hit_node = function(self, pos, node)
		nssm:duck_explosion(pos)
	end,

})

function nssm:duck_explosion_direct(pos, player)
		pos = player:getpos()
		pos.y = pos.y+1;
		minetest.add_particlespawner({
			amount = 10,
			time = 0.2,
			minpos = {x=pos.x-1, y=pos.y-1, z=pos.z-1},
			maxpos = {x=pos.x+1, y=pos.y+4, z=pos.z+1},
			minvel = {x=0, y=0, z=0},
			maxvel = {x=1, y=1, z=1},
			minacc = {x=-0.5,y=5,z=-0.5},
			maxacc = {x=0.5,y=5,z=0.5},
			minexptime = 1,
			maxexptime = 3,
			minsize = 4,
			maxsize = 6,
			collisiondetection = false,
			vertical = false,
			texture = "duck_egg_fragments.png",
		})
		core.after(0.4, function()
			for dx = -2,2 do
				pos = {x = pos.x+dx, y=pos.y; z=pos.z+dx}
				minetest.add_particlespawner({
					amount = 100,
					time = 0.2,
					minpos = {x=pos.x-1, y=pos.y-1, z=pos.z-1},
					maxpos = {x=pos.x+1, y=pos.y+4, z=pos.z+1},
					minvel = {x=0, y=0, z=0},
					maxvel = {x=1, y=5, z=1},
					minacc = {x=-0.5,y=5,z=-0.5},
					maxacc = {x=0.5,y=5,z=0.5},
					minexptime = 1,
					maxexptime = 3,
					minsize = 2,
					maxsize = 4,
					collisiondetection = false,
					vertical = false,
					texture = "tnt_smoke.png",
				})
				minetest.add_entity(pos, "nssm:duck")
			end
		end)
end
function nssm:duck_explosion(pos)
	pos.y = pos.y+1;
	minetest.add_particlespawner({
		amount = 10,
		time = 0.2,
		minpos = {x=pos.x-1, y=pos.y-1, z=pos.z-1},
		maxpos = {x=pos.x+1, y=pos.y+4, z=pos.z+1},
		minvel = {x=0, y=0, z=0},
		maxvel = {x=1, y=1, z=1},
		minacc = {x=-0.5,y=5,z=-0.5},
		maxacc = {x=0.5,y=5,z=0.5},
		minexptime = 1,
		maxexptime = 3,
		minsize = 4,
		maxsize = 6,
		collisiondetection = false,
		vertical = false,
		texture = "duck_egg_fragments.png",
	})
	core.after(0.4, function()
		for dx = -2,2 do
			pos = {x = pos.x+dx, y=pos.y; z=pos.z+dx}
			minetest.add_particlespawner({
				amount = 100,
				time = 0.2,
				minpos = {x=pos.x-1, y=pos.y-1, z=pos.z-1},
				maxpos = {x=pos.x+1, y=pos.y+4, z=pos.z+1},
				minvel = {x=0, y=0, z=0},
				maxvel = {x=1, y=5, z=1},
				minacc = {x=-0.5,y=5,z=-0.5},
				maxacc = {x=0.5,y=5,z=0.5},
				minexptime = 1,
				maxexptime = 3,
				minsize = 2,
				maxsize = 4,
				collisiondetection = false,
				vertical = false,
				texture = "tnt_smoke.png",
			})
			minetest.add_entity(pos, "nssm:duck")
		end
	end)
end

-- snow_arrow
nssm:register_arrow("nssm:snow_arrow", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"transparent.png"},
	velocity =20,
	-- direct hit
	hit_player = function(self, player)
		nssm:ice_explosion1(pos, player)
	end,

	hit_mob = function(self, player)
		nssm:ice_explosion1(pos, player)
	end,
	hit_node = function(self, pos, node)
		nssm:ice_explosion(pos)
	end,
})

function nssm:ice_explosion(pos)
		--pos = player:getpos()
	for i=pos.x-math.random(0, 1), pos.x+math.random(0, 1), 1 do
		for j=pos.y-1, pos.y+4, 1 do
			for k=pos.z-math.random(0, 1), pos.z+math.random(0, 1), 1 do
			minetest.set_node({x=i, y=j, z=k}, {name="default:ice"})
		end
		end
	end
end

function nssm:ice_explosion1(pos, player)
		pos = player:getpos()
	for i=pos.x-math.random(0, 1), pos.x+math.random(0, 1), 1 do
		for j=pos.y-1, pos.y+4, 1 do
			for k=pos.z-math.random(0, 1), pos.z+math.random(0, 1), 1 do
			minetest.set_node({x=i, y=j, z=k}, {name="default:ice"})
		end
		end
	end
end


-- arrow manticore
nssm:register_arrow("nssm:spine", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"manticore_spine_flying.png"},
	velocity = 10,
	-- direct hit
	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,
})


-- web arrow
nssm:register_arrow("nssm:webball", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"web_ball.png"},
	velocity = 8,
	-- direct hit
	hit_player = function(self, player)
		local p = player:getpos()
		nssm:explosion_web(p)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

	hit_node = function(self, pos, node)
		nssm:explosion_web(pos)
	end
})

function nssm:explosion_web(pos)
    for i=pos.x-1, pos.x+1, 1 do
		for j=pos.y-1, pos.y+1, 1 do
		for k=pos.z-1, pos.z+1, 1 do
			local current = minetest.get_node({x=i,y=j,z=k})
			local ontop  = minetest.get_node({x=i,y=j+1,z=k})
			if (current.name ~= "air") and
				(current.name ~= "nssm:web") and
				(ontop.name == "air") then
				minetest.set_node({x=i,y=j+1,z=k}, {name="nssm:web"})
			end
		end
		end
		end
end


-- arrow=>phoenix arrow
nssm:register_arrow("nssm:phoenix_arrow", {
	visual = "sprite",
	phoenix_fire = true,
	visual_size = {x = 1, y = 1},
	textures = {"transparent.png"},
	velocity = 8,
	-- direct hit
	hit_player = function(self, player)
	end,

	hit_mob = function(self, player)
	end,

	hit_node = function(self, pos, node)
	end
})

nssm:register_arrow("nssm:super_gas", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"transparent.png"},
	velocity = 8,
	-- direct hit
	hit_player = function(self, player)
		local p = player:getpos()
		nssm:puzzetton_explosion(p)
	end,

	hit_mob = function(self, player)
	end,

	hit_node = function(self, pos, node)
		nssm:puzzetton_explosion(pos)
	end
})


function nssm:puzzetton_explosion(pos)
	for dx=-2,2 do
		for dy=-1,4 do
			for dz=-2,2 do
				local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
				local n = minetest.env:get_node(p).name
				if n== "air" then
					minetest.set_node(p, {name="nssm:venomous_gas"})
				end
			end
		end
	end
end

--
nssm:register_arrow("nssm:roar_of_the_dragon", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"transparent.png"},
	velocity = 10,
	remover = true,
	-- direct hit
	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 3},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 3},
		}, nil)
	end,
})

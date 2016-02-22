minetest.register_craftitem("nssm:sky_feather", {
	description = "Sky Feather",
	image = "sky_feather.png",
})

minetest.register_craftitem("nssm:snake_scute", {
	description = "Snake Scute",
	image = "snake_scute.png",
})

minetest.register_craftitem("nssm:eyed_tentacle", {
	description = "Eyed Tentacle",
	image = "eyed_tentacle.png",
})

minetest.register_craftitem("nssm:king_duck_crown", {
	description = "King Duck Crown",
	image = "king_duck_crown.png",
})

minetest.register_craftitem("nssm:great_energy_globe", {
	description = "Great Energy Globe",
	image = "great_energy_globe.png",
})

minetest.register_craftitem("nssm:superior_energy_globe", {
	description = "Superior Energy Globe",
	image = "superior_energy_globe.png",
})

minetest.register_craftitem("nssm:ant_queen_abdomen", {
	description = "Ant Queen Abdomen",
	image = "ant_queen_abdomen.png",
})

minetest.register_craftitem("nssm:masticone_skull", {
	description = "Masticone Skull",
	image = "masticone_skull.png",
})

minetest.register_craftitem("nssm:masticone_skull_fragments", {
	description = "Masticone Skull fragments",
	image = "masticone_skull_fragments.png",
})

minetest.register_craftitem("nssm:masticone_skull_crowned", {
	description = "Masticone Skull Crowned",
	image = "masticone_skull_crowned.png",
})

minetest.register_craftitem("nssm:kraken_tentacle", {
	description = "Kraken Tentacle",
	image = "tentacle_curly.png",
})

minetest.register_craftitem("nssm:lava_titan_eye", {
	description = "Lava Titan Eye",
	image = "lava_titan_eye.png",
})

minetest.register_craftitem("nssm:duck_beak", {
	description = "Duck Beak",
	image = "duck_beak.png",
})

minetest.register_craftitem("nssm:ice_tooth", {
	description = "Ice Tooth",
	image = "ice_tooth.png",
})

minetest.register_craftitem("nssm:little_ice_tooth", {
	description = "Little Ice Tooth",
	image = "little_ice_tooth.png",
})

minetest.register_craftitem("nssm:black_sand", {
	description = "Dahaka's black sand",
	image = "black_sand.png",
})

minetest.register_craftitem("nssm:black_ice_tooth", {
	description = "Black Ice Tooth",
	image = "black_ice_tooth.png",
})

minetest.register_craftitem("nssm:tarantula_chelicerae", {
	description = "Tarantula Chelicerae",
	image = "tarantula_chelicerae.png",
})

minetest.register_craftitem("nssm:crab_chela", {
	description = "Crab Chela",
	image = "crab_chela.png",
})

minetest.register_craftitem("nssm:cursed_pumpkin_seed", {
	description = "Cursed Pumpkin Seed",
	image = "cursed_pumpkin_seed.png",
})

minetest.register_craftitem("nssm:mese_egg", {
	description = "Mese Egg",
	image = "mese_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		minetest.add_particlespawner({
			amount = 1000,
			time = 0.2,
			minpos = {x=pos1.x-1, y=pos1.y-1, z=pos1.z-1},
			maxpos = {x=pos1.x+1, y=pos1.y+4, z=pos1.z+1},
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
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:mese_dragon")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:werewolf_leg", {
	description = "Werewolf Leg",
	image = "werewolf_leg.png",
	on_use = minetest.item_eat(3),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:heron_leg", {
	description = "Moonheron Leg",
	image = "heron_leg.png",
	on_use = minetest.item_eat(2),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:chichibios_heron_leg", {
	description = "Chichibio's Moonheron Leg",
	image = "chichibios_heron_leg.png",
	on_use = minetest.item_eat(4),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:croco_tail", {
	description = "Crocodile Tail",
	image = "crocodile_tail.png",
	on_use = minetest.item_eat(3),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:roasted_croco_tail", {
	description = "Roasted Crocodile Tail",
	image = "roasted_crocodile_tail.png",
	on_use = minetest.item_eat(10),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:roasted_werewolf_leg", {
	description = "Roasted_Werewolf Leg",
	image = "roasted_werewolf_leg.png",
	on_use = minetest.item_eat(6),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:duck_legs", {
	description = "Duck Legs",
	image = "duck_legs.png",
	on_use = minetest.item_eat(1),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:roasted_duck_legs", {
	description = "Roasted Duck Leg",
	image = "roasted_duck_legs.png",
	on_use = minetest.item_eat(3),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:ant_leg", {
	description = "Ant Leg",
	image = "ant_leg.png",
	on_use = minetest.item_eat(2),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:roasted_ant_leg", {
	description = "Roasted Ant Leg",
	image = "roasted_ant_leg.png",
	on_use = minetest.item_eat(4),
	groups = { meat=1, eatable=1 },
})


minetest.register_craftitem("nssm:spider_leg", {
	description = "Spider Leg",
	image = "spider_leg.png",
	on_use = minetest.item_eat(2),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:roasted_spider_leg", {
	description = "Roasted Spider Leg",
	image = "roasted_spider_leg.png",
	on_use = minetest.item_eat(4),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:brain", {
	description = "Brain",
	image = "brain.png",
	on_use = minetest.item_eat(3),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:roasted_brain", {
	description = "Roasted Brain",
	image = "roasted_brain.png",
	on_use = minetest.item_eat(8),
	groups = { meat=1, eatable=1 },
})


minetest.register_craftitem("nssm:tentacle", {
	description = "Tentacle",
	image = "tentacle.png",
	on_use = minetest.item_eat(2),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:roasted_tentacle", {
	description = "Roasted Tentacle",
	image = "roasted_tentacle.png",
	on_use = minetest.item_eat(5),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:worm_flesh", {
	description = "Worm Flesh",
	image = "worm_flesh.png",
	on_use = minetest.item_eat(-1),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:roasted_worm_flesh", {
	description = "Roasted Worm Flesh",
	image = "roasted_worm_flesh.png",
	on_use = minetest.item_eat(3),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:mantis_claw", {
	description = "Mantis Claw",
	image = "mantis_claw.png",
})

--[[minetest.register_craftitem("nssm:manticore_fur", {
	description = "Manticore Fur",
	image = "manticore_fur.png",
})]]

minetest.register_craftitem("nssm:manticore_spine", {
	description = "Manticore Spine",
	image = "manticore_spine.png",
})

minetest.register_craftitem("nssm:moon_feather", {
	description = "Moon Feather",
	image = "night_feather.png",
})


minetest.register_craftitem("nssm:sun_feather", {
	description = "Sun Feather",
	image = "sun_feather.png",
})

minetest.register_craftitem("nssm:amphibian_heart", {
	description = "Amphibian Heart",
	image = "amphibian_heart.png",
	on_use = minetest.item_eat(1),
	groups = { meat=1, eatable=1 },
})


minetest.register_craftitem("nssm:roasted_amphibian_heart", {
	description = "Roasted Amphibian Heart",
	image = "roasted_amphibian_heart.png",
	on_use = minetest.item_eat(8),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:raw_scrausics_wing", {
	description = "Raw Scrausics Wing",
	image = "raw_scrausics_wing.png",
	on_use = minetest.item_eat(1),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:spicy_scrausics_wing", {
	description = "Spicy Scrausics Wing",
	image = "spicy_scrausics_wing.png",
	on_use = minetest.item_eat(6),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:phoenix_nuggets", {
	description = "Phoenix Nuggets",
	image = "phoenix_nuggets.png",
	on_use = minetest.item_eat(20),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:phoenix_tear", {
	description = "Phoenix Tear",
	image = "phoenix_tear.png",
	on_use = minetest.item_eat(20),
	groups = {eatable=1 },
})

minetest.register_craftitem("nssm:frosted_amphibian_heart", {
	description = "Frosted Amphibian Heart",
	image = "frosted_amphibian_heart.png",
	on_use = minetest.item_eat(-1),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:surimi", {
	description = "Surimi",
	image = "surimi.png",
	on_use = minetest.item_eat(4),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("nssm:white_wolf_fur", {
	description = "White Wolf Fur",
	image = "white_wolf_fur.png",
})

minetest.register_craftitem("nssm:masticone_fang", {
	description = "Masticone Fang",
	image = "masticone_fang.png",
})

minetest.register_tool("nssm:mantis_sword", {
	description = "Mantis Sword",
	inventory_image = "mantis_sword.png",
	tool_capabilities = {
		full_punch_interval =0.7 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.0, [3]=0.4}, uses=50, maxlevel=1},
			snappy={times={[2]=0.80, [3]=0.3}, uses=100, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_node("nssm:venomous_gas", {
	description = "Venomous Gas",
	inventory_image = minetest.inventorycube("venomous_gas.png"),
	drawtype = "airlike",
	tiles = {
		{name="venomous_gas_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	},
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 1,
	damage_per_second = 1,
	post_effect_color = {a=100, r=1, g=100, b=1},
	groups = {flammable = 2},
})

minetest.register_node("nssm:ant_dirt", {
	description = "Ant Dirt",
	tiles = {"ant_dirt.png"},
	groups = {crumbly=3},
})

minetest.register_node("nssm:modders_block", {
	description = "Modders Block",
	tiles = {"modders_block.png"},
	is_ground_content = true,
	groups = {crumbly=3, not_in_creative_inventory =1},
})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:modders_block",
		wherein        = "default:stone",
		clust_scarcity = 50*50*50,
		clust_num_ores = 1,
		clust_size     = 1,
		height_min     = -115,
		height_max     = -95,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "default:cobble",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		height_min     = -1,
		height_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "default:mossycobble",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		height_min     = -1000,
		height_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "default:sandstonebrick",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		height_min     = -1000,
		height_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "stairs:stair_sandstonebrick",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		height_min     = -1000,
		height_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "stairs:stair_cobble",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		height_min     = -1000,
		height_max     = 40,
			})

minetest.register_craftitem("nssm:life_energy", {
	description = "Life Energy",
	inventory_image = "life_energy.png",
})

minetest.register_craftitem("nssm:wolf_fur", {
	description = "Wolf Fur",
	inventory_image = "wolf_fur.png",
})

minetest.register_craftitem("nssm:energy_globe", {
	description = "Energy Globe",
	inventory_image = "energy_globe.png",
})

minetest.register_node("nssm:web", {
	description = "Web",
	inventory_image = "web.png",
	tile_images = {"web.png"} ,
    drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	pointable = true,
	diggable = true,
	buildable_to = false,
	drop = "",
	drowning = 0,
	liquid_renewable = false,
	liquidtype = "source",
	liquid_range= 0,
	liquid_alternative_flowing = "nssm:web",
	liquid_alternative_source = "nssm:web",
	liquid_viscosity = 20,
	groups = {flammable=2, snappy=1, liquid=1},
})


minetest.register_node("nssm:ink", {
	description = "Ink",
	inventory_image = minetest.inventorycube("ink.png"),
	drawtype = "liquid",
	tiles = {
		{
			name = "ink_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	--alpha = 420,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	liquid_range= 0,
	drowning = 1,
	liquid_renewable = false,
	liquidtype = "source",
	liquid_alternative_flowing = "nssm:ink",
	liquid_alternative_source = "nssm:ink",
	liquid_viscosity = 1,
	post_effect_color = {a=2000, r=30, g=30, b=30},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

minetest.register_node("nssm:mese_meteor", {
	description = "Mese Meteor",
	tile_images = {"mese_meteor.png"} ,
	paramtype = "light",
	drop = "",
	groups = {crumbly=1, falling_node=1, flammable = 2},
})

minetest.register_node("nssm:pumpbomb", {
	tiles = {"pumpbomb_top.png","pumpbomb_bottom.png", "pumpbomb_side.png", "pumpbomb_side.png", "pumpbomb_side.png", "pumpbomb_front.png"},
	light_source = 5,
	groups = {not_in_creative_inventory =1},
	drop = "",
	on_timer = function(pos, elapsed)
		nssm:pumpbomb_explosion(pos)
	end,
})

minetest.register_abm({
	nodenames = {"nssm:mese_meteor"},
	neighbors = {"air"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		--local under = {x=pos.x, y=pos.y-1, z=pos.z}
		--local n = minetest.env:get_node(under).name
		--if n~= "air" then
						minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name = "fire:basic_flame"})
						minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name = "fire:basic_flame"})
						minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name = "fire:basic_flame"})
						minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name = "fire:basic_flame"})

						minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "fire:basic_flame"})

	end
})

minetest.register_abm({
	nodenames = {"nssm:web"},
	neighbors = {"default:junglegrass"},
	interval = 20.0,
	chance = 20,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local n = minetest.env:get_node(pos).name
		if n== "air" then
			minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z}, {name = "nssm:web"})
		end
	end
})

minetest.register_abm({
	nodenames = {"nssm:web"},
	neighbors = {"default:junglegrass"},
	interval = 20.0,
	chance = 20,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local n = minetest.env:get_node(pos).name
		if n== "air" then
			minetest.set_node({x = pos.x + 1, y = pos.y, z = pos.z}, {name = "nssm:web"})
		end
	end
})

minetest.register_abm({
	nodenames = {"nssm:web"},
	neighbors = {"default:junglegrass"},
	interval = 20.0,
	chance = 20,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local n = minetest.env:get_node(pos).name
		if n== "air" then
			minetest.set_node({x = pos.x - 1, y = pos.y, z = pos.z}, {name = "nssm:web"})
		end
	end
})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:web",
		wherein        = "default:junglegrass",
		clust_scarcity = 2*2*2,
		clust_num_ores = 2,
		clust_size     = 2,
		height_min     = -20,
		height_max     = 200,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:web",
		wherein        = "default:jungleleaves",
		clust_scarcity = 4*4*4,
		clust_num_ores = 5,
		clust_size     = 5,
		height_min     = -20,
		height_max     = 200,
			}
)


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
	minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
		if puncher:get_wielded_item():get_name() == 'nssm:sun_sword' then
			if node.name ~= "air" then
				minetest.add_node(pointed_thing.above, {name = "fire:basic_flame"})
			end
		end
	end)
})

minetest.register_tool("nssm:masticone_fang_sword", {
	description = "Masticone Fang Sword",
	inventory_image = "masticone_fang_sword.png",
	tool_capabilities = {
		full_punch_interval =0.7 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.90, [2]=0.8, [3]=0.4}, uses=200, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=200, maxlevel=1}
		},
		damage_groups = {fleshy=8},
	},
})

minetest.register_tool("nssm:night_sword", {
	description = "Night Sword",
	inventory_image = "night_sword.png",
	tool_capabilities = {
		full_punch_interval =0.4 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.80, [2]=0.4, [3]=0.2}, uses=300, maxlevel=1},
			fleshy={times={[2]=0.7, [3]=0.3}, uses=300, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	},
})

minetest.register_tool("nssm:crab_light_mace", {
	description = "Light Crab Mace",
	inventory_image = "crab_light_mace.png",
	tool_capabilities = {
		full_punch_interval =2 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.4, [3]=1}, uses=120, maxlevel=1}
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
			fleshy={times={[2]=2, [3]=1.4}, uses=120, maxlevel=1}
		},
		damage_groups = {fleshy=12},
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
	
minetest.register_craftitem("nssm:stoneater_mandible", {
	description = "Stoneater Mandible",
	image = "stoneater_mandible.png",
})

minetest.register_craftitem("nssm:ant_mandible", {
	description = "Ant Mandible",
	image = "ant_mandible.png",
})
	



--ricette


minetest.register_craft({
	output = 'nssm:mantis_sword',
	recipe = {
		{'', 'nssm:mantis_claw', ''},
		{'', 'nssm:mantis_claw', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:masticone_fang_sword',
	recipe = {
		{'', 'nssm:masticone_fang', 'nssm:masticone_fang'},
		{'', 'nssm:masticone_fang', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:black_ice_tooth',
	recipe = {
		{'', 'nssm:black_sand', ''},
		{'', 'nssm:ice_tooth', ''},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'nssm:crab_light_mace',
	recipe = {
		{'', 'nssm:crab_chela', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:crab_heavy_mace',
	recipe = {
		{'', 'nssm:crab_chela', ''},
		{'nssm:crab_chela', 'nssm:crab_chela', 'nssm:crab_chela'},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:energy_globe',
	recipe = {
		{'nssm:life_energy', 'nssm:life_energy', 'nssm:life_energy'},
		{'nssm:life_energy', 'nssm:life_energy', 'nssm:life_energy'},
		{'nssm:life_energy', 'nssm:life_energy', 'nssm:life_energy'},
	}
})

minetest.register_craft({
	output = 'nssm:great_energy_globe',
	recipe = {
		{'nssm:energy_globe', 'nssm:energy_globe', 'nssm:energy_globe'},
		{'nssm:energy_globe', 'nssm:energy_globe', 'nssm:energy_globe'},
		{'nssm:energy_globe', 'nssm:energy_globe', 'nssm:energy_globe'},
	}
})

minetest.register_craft({
	output = 'nssm:superior_energy_globe',
	recipe = {
		{'nssm:great_energy_globe', 'nssm:great_energy_globe', 'nssm:great_energy_globe'},
		{'nssm:great_energy_globe', 'nssm:great_energy_globe', 'nssm:great_energy_globe'},
		{'nssm:great_energy_globe', 'nssm:great_energy_globe', 'nssm:great_energy_globe'},
	}
})


minetest.register_craft({
	output = 'nssm:mese_egg',
	recipe = {
		{'nssm:tarantula_chelicerae', 'nssm:masticone_skull_crowned', 'nssm:eyed_tentacle'},
		{'nssm:black_ice_tooth', 'nssm:superior_energy_globe', 'nssm:sky_feather'},
		{'nssm:cursed_pumpkin_seed', 'nssm:ant_queen_abdomen', 'nssm:snake_scute'},
	}
})

minetest.register_craft({
	output = 'nssm:masticone_skull_crowned',
	recipe = {
		{'', 'nssm:king_duck_crown', ''},
		{'', 'nssm:masticone_skull', ''},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'nssm:eyed_tentacle',
	recipe = {
		{'', 'nssm:lava_titan_eye', ''},
		{'', 'nssm:kraken_tentacle', ''},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'nssm:masticone_skull',
	recipe = {
		{'nssm:masticone_skull_fragments', 'nssm:masticone_skull_fragments', 'nssm:masticone_skull_fragments'},
		{'nssm:masticone_skull_fragments', 'nssm:masticone_skull_fragments', 'nssm:masticone_skull_fragments'},
		{'nssm:masticone_skull_fragments', 'nssm:masticone_skull_fragments', 'nssm:masticone_skull_fragments'},
	}
})

minetest.register_craft({
	output = 'nssm:rope 16',
	recipe = {
		{'', 'nssm:wolf_fur', ''},
		{'', 'nssm:wolf_fur', ''},
		{'', 'nssm:wolf_fur', ''},
	}
})


minetest.register_craft({
	output = 'nssm:rope 16',
	recipe = {
		{'', 'nssm:white_wolf_fur', ''},
		{'', 'nssm:white_wolf_fur', ''},
		{'', 'nssm:white_wolf_fur', ''},
	}
})

minetest.register_craft({
	output = 'nssm:sky_feather',
	recipe = {
		{'', '', ''},
		{'nssm:sun_feather', '', 'nssm:moon_feather'},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'nssm:sun_sword',
	recipe = {
		{'', 'default:diamond', ''},
		{'', 'nssm:sun_feather', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:night_sword',
	recipe = {
		{'', 'default:diamond', ''},
		{'', 'nssm:moon_feather', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "nssm:roasted_worm_flesh",
	recipe = "nssm:worm_flesh",
	cooktime = 12,
})

minetest.register_craft({
	type = "cooking",
	output = "nssm:roasted_duck_legs",
	recipe = "nssm:duck_legs",
	cooktime = 6,
})

minetest.register_craft({
	type = "cooking",
	output = "nssm:roasted_spider_leg",
	recipe = "nssm:spider_leg",
	cooktime = 6,
})

minetest.register_craft({
	type = "cooking",
	output = "nssm:roasted_werewolf_leg",
	recipe = "nssm:werewolf_leg",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "nssm:roasted_brain",
	recipe = "nssm:brain",
	cooktime = 6,
})

minetest.register_craft({
	type = "cooking",
	output = "nssm:roasted_amphibian_heart",
	recipe = "nssm:amphibian_heart",
	cooktime = 5,
})

minetest.register_craft({
	type = "cooking",
	output = "nssm:roasted_tentacle",
	recipe = "nssm:tentacle",
	cooktime = 5,
})

minetest.register_craft({
	type = "cooking",
	output = "nssm:amphibian_heart",
	recipe = "nssm:frosted_amphibian_heart",
	cooktime = 8,
})

minetest.register_craft({
	type = "cooking",
	output = "nssm:chichibios_heron_leg",
	recipe = "nssm:heron_leg",
	cooktime = 20,
})

minetest.register_craft({
	type = "cooking",
	output = "nssm:spicy_scrausics_wing",
	recipe = "nssm:raw_scrausics_wing",
	cooktime = 12,
})

minetest.register_craft({
	type = "cooking",
	output = "nssm:roasted_ant_leg",
	recipe = "nssm:ant_leg",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "nssm:roasted_croco_tail",
	recipe = "nssm:croco_tail",
	cooktime = 16,
})

	
minetest.register_craft({
	output = 'nssm:ant_sword',
	recipe = {
		{'', 'nssm:ant_mandible', ''},
		{'', 'nssm:ant_mandible', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:stoneater_pick',
	recipe = {
		{'nssm:stoneater_mandible', 'nssm:stoneater_mandible', 'nssm:stoneater_mandible'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

--Eggs

minetest.register_craftitem("nssm:tarantula_egg", {
	description = "Tarantula Egg",
	image = "tarantula_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:tarantula")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:daddy_egg", {
	description = "Daddy Long Legs Egg",
	image = "daddy_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:daddy_long_legs")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:uloboros_egg", {
	description = "Uloboros Egg",
	image = "uloboros_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:uloboros")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:black_widow_egg", {
	description = "Black Widow Egg",
	image = "black_widow_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:black_widow")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:black_widow_egg", {
	description = "Black Widow Egg",
	image = "black_widow_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:black_widow")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:pumpboom_egg", {
	description = "Small Pumpboom Egg",
	image = "pumpboom_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:pumpboom_small")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:medium_pumpboom_egg", {
	description = "Medium Pumpboom Egg",
	image = "medium_pumpboom_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:pumpboom_medium")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:big_pumpboom_egg", {
	description = "Large Pumpboom Egg",
	image = "big_pumpboom_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:pumpboom_large")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:pumpking_egg", {
	description = "Pumpking Egg",
	image = "pumpking_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:pumpking")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:manticore_egg", {
	description = "Manticore Egg",
	image = "manticore_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:manticore")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:kraken_egg", {
	description = "Kraken Egg",
	image = "kraken_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:kraken")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:crab_egg", {
	description = "Crab Egg",
	image = "crab_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:crab")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:octopus_egg", {
	description = "Octopus Egg",
	image = "octopus_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:octopus")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:dolidorsaurus_egg", {
	description = "Dolidrosaurus Egg",
	image = "dolidrosaurus_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:dolidrosaurus")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:crocodile_egg", {
	description = "Crocodile Egg",
	image = "crocodile_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:crocodile")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:ant_soldier_egg", {
	description = "Ant Soldier Egg",
	image = "ant_soldier_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:ant_soldier")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:ant_queen_egg", {
	description = "Ant Queen Egg",
	image = "ant_queen_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:ant_queen")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:ant_worker_egg", {
	description = "Ant Worker Egg",
	image = "ant_worker_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:ant_worker")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:dahaka_egg", {
	description = "Dahaka Egg",
	image = "dahaka_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:dahaka")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:sandworm_egg", {
	description = "Sandworm Egg",
	image = "sandworm_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:sandworm")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:night_master_egg", {
	description = "Night Master Egg",
	image = "night_master_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:night_master")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:moonheron_egg", {
	description = "Moonheron Egg",
	image = "moonheron_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:moonheron")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:srausics_egg", {
	description = "Scrausics Egg",
	image = "scrausics_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:scrausics")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:phoenix_egg", {
	description = "Phoenix Egg",
	image = "phoenix_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:phoenix")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:larva_egg", {
	description = "Larva Egg",
	image = "larva_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:larva")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:mantis_egg", {
	description = "Mantis Egg",
	image = "mantis_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:mantis")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:mantis_beast_egg", {
	description = "Mantis Beast Egg",
	image = "mantis_beast_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:mantis_beast")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:masticone_egg", {
	description = "Masticone Egg",
	image = "masticone_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:masticone")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:lava_titan_egg", {
	description = "Lava Titan Egg",
	image = "lava_titan_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:lava_titan")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:icelamander_egg", {
	description = "Icelamander Egg",
	image = "icelamander_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:icelamander")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:icesnake_egg", {
	description = "Ice Snake Egg",
	image = "icesnake_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:icesnake")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:snow_biter_egg", {
	description = "Snowbiter Egg",
	image = "snow_biter_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:snow_biter")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:white_werewolf_egg", {
	description = "White Werewolf Egg",
	image = "white_werewolf_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:white_werewolf")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:werewolf_egg", {
	description = "Werewolf Egg",
	image = "werewolf_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:werewolf")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:echidna_egg", {
	description = "Echidna Egg",
	image = "echidna_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:echidna")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:spiderduck_egg", {
	description = "Spiderduck Egg",
	image = "spiderduck_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:spiderduck")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:enderduck_egg", {
	description = "Enderduck Egg",
	image = "enderduck_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:enderduck")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:duckking_egg", {
	description = "Duckking Egg",
	image = "duckking_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:duckking")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:duck_egg", {
	description = "Duck Egg",
	image = "duck_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:duck")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:swimming_duck_egg", {
	description = "Swimming Duck Egg",
	image = "swimming_duck_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:swimming_duck")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:bloco_egg", {
	description = "Bloco Egg",
	image = "bloco_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:bloco")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:signosigno_egg", {
	description = "Signosigno Egg",
	image = "signo_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:signosigno")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:stone_eater_egg", {
	description = "Stoneater Egg",
	image = "stone_eater_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:stone_eater")
		end)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("nssm:flying_duck_egg", {
	description = "Flying Duck Egg",
	image = "flying_duck_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.4, function()
			minetest.add_entity(pos1, "nssm:flying_duck")
		end)
		itemstack:take_item()
		return itemstack
	end,
})
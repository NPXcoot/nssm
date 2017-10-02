--non eatable craftitems


function nssm_register_noneatcraftitems (name, descr)

minetest.register_craftitem("nssm:"..name, {
	description = descr,
	image = name..".png",
})

end

nssm_register_noneatcraftitems ('sky_feather','Sky Feather')
nssm_register_noneatcraftitems ('snake_scute','Snake Scute')
nssm_register_noneatcraftitems ('eyed_tentacle','Eyed Tentacle')
--nssm_register_noneatcraftitems ('king_duck_crown','King Duck Crown')
nssm_register_noneatcraftitems ('great_energy_globe','Great Energy Globe')
nssm_register_noneatcraftitems ('superior_energy_globe','Superior Energy Globe')
nssm_register_noneatcraftitems ('ant_queen_abdomen','Ant Queen Abdomen')
--nssm_register_noneatcraftitems ('masticone_skull','Masticone Skull')
nssm_register_noneatcraftitems ('masticone_skull_fragments','Masticone Skull Fragments')
--nssm_register_noneatcraftitems ('masticone_skull_crowned','Masticone Skull Crowned')
nssm_register_noneatcraftitems ('tentacle_curly','Kraken Tentacle')
nssm_register_noneatcraftitems ('lava_titan_eye','Lava Titan Eye')
nssm_register_noneatcraftitems ('duck_beak','Duck Beak')
nssm_register_noneatcraftitems ('ice_tooth','Ice Tooth')
nssm_register_noneatcraftitems ('little_ice_tooth','Little Ice Tooth')
nssm_register_noneatcraftitems ('digested_sand',"Digested Sand")
nssm_register_noneatcraftitems ('black_ice_tooth','Black Ice Tooth')
nssm_register_noneatcraftitems ('tarantula_chelicerae','Tarantula Chelicerae')
nssm_register_noneatcraftitems ('crab_chela','Crab Chela')
nssm_register_noneatcraftitems ('cursed_pumpkin_seed','Cursed Pumpkin Seed')
nssm_register_noneatcraftitems ('mantis_claw','Mantis Claw')
nssm_register_noneatcraftitems ('manticore_fur','Manticore Fur')
nssm_register_noneatcraftitems ('ant_hard_skin','Ant Hard Skin')
nssm_register_noneatcraftitems ('bloco_skin','Bloco Skin')
nssm_register_noneatcraftitems ('crab_carapace_fragment','Crab Carapace Fragment')
nssm_register_noneatcraftitems ('crocodile_skin','Crocodile Skin')
nssm_register_noneatcraftitems ('manticore_spine','Manticore Spine')
nssm_register_noneatcraftitems ('night_feather','Night Feather')
nssm_register_noneatcraftitems ('sun_feather','Sun Feather')
nssm_register_noneatcraftitems ('duck_feather','Duck Feather')
nssm_register_noneatcraftitems ('black_duck_feather','Black Duck Feather')
nssm_register_noneatcraftitems ('masticone_fang','Masticone Fang')
nssm_register_noneatcraftitems ('masticone_core','Masticone Core')
nssm_register_noneatcraftitems ('white_wolf_fur','White Wolf Fur')
nssm_register_noneatcraftitems ('stoneater_mandible','Stoneater Mandible')
nssm_register_noneatcraftitems ('ant_mandible','Ant Mandible')
nssm_register_noneatcraftitems ('life_energy','Life Energy')
nssm_register_noneatcraftitems ('wolf_fur','Wolf Fur')
nssm_register_noneatcraftitems ('felucco_fur','Felucco Fur')
nssm_register_noneatcraftitems ('felucco_horn','Felucco Horn')
nssm_register_noneatcraftitems ('energy_globe','Energy Globe')
nssm_register_noneatcraftitems ('greedy_soul_fragment','Greedy Soul Fragment')
nssm_register_noneatcraftitems ('lustful_soul_fragment','Lustful Soul Fragment')
nssm_register_noneatcraftitems ('wrathful_soul_fragment','Wrathful Soul Fragment')
nssm_register_noneatcraftitems ('proud_soul_fragment','Proud Soul Fragment')
nssm_register_noneatcraftitems ('slothful_soul_fragment','Slothful Soul Fragment')
nssm_register_noneatcraftitems ('envious_soul_fragment','Envious Soul Fragment')
nssm_register_noneatcraftitems ('gluttonous_soul_fragment','Gluttonous Soul Fragment')
nssm_register_noneatcraftitems ('gluttonous_moranga','Gluttonous Moranga')
nssm_register_noneatcraftitems ('envious_moranga','Envious Moranga')
nssm_register_noneatcraftitems ('proud_moranga','Proud Moranga')
nssm_register_noneatcraftitems ('slothful_moranga','Slothful Moranga')
nssm_register_noneatcraftitems ('lustful_moranga','Lustful Moranga')
nssm_register_noneatcraftitems ('wrathful_moranga','Wrathful Moranga')
nssm_register_noneatcraftitems ('greedy_moranga','Greedy Moranga')
nssm_register_noneatcraftitems ('mantis_skin','Mantis_skin')
nssm_register_noneatcraftitems ('sand_bloco_skin','Sand Bloco Skin')
nssm_register_noneatcraftitems ('sandworm_skin','Sandworm Skin')
nssm_register_noneatcraftitems ('sky_iron','Sky Iron')
nssm_register_noneatcraftitems ('web_string','Cobweb String')
nssm_register_noneatcraftitems ('dense_web_string','Dense Cobweb String')
nssm_register_noneatcraftitems ('black_powder','Black Powder')
nssm_register_noneatcraftitems ('berinhog_horn','Berinhog Horn')
nssm_register_noneatcraftitems ('morelentir_dust','Dark Starred Stone Dust')
nssm_register_noneatcraftitems ('earth_heart','Earth Heart')

function nssm_register_eatcraftitems (name, descr, gnam)

minetest.register_craftitem("nssm:"..name, {
	description = descr,
	image =name..".png",
	on_use = minetest.item_eat(gnam),
	groups = { meat=1, eatable=1 },
})

end

nssm_register_eatcraftitems ('werewolf_leg','Werewolf Leg',3)
nssm_register_eatcraftitems ('felucco_steak','Felucco Steak',3)
nssm_register_eatcraftitems ('roasted_felucco_steak','Roasted Felucco Steak',6)
nssm_register_eatcraftitems ('heron_leg','Moonheron Leg',2)
nssm_register_eatcraftitems ('chichibios_heron_leg',"Chichibio's Moonheron Leg",4)
nssm_register_eatcraftitems ('crocodile_tail','Crocodile Tail',3)
nssm_register_eatcraftitems ('roasted_crocodile_tail','Roasted Crocodile Tail',6)
nssm_register_eatcraftitems ('roasted_werewolf_leg','Roasted_Werewolf Leg',6)
nssm_register_eatcraftitems ('duck_legs','Duck Legs',1)
nssm_register_eatcraftitems ('roasted_duck_legs','Roasted Duck Leg',3)
nssm_register_eatcraftitems ('ant_leg','Ant Leg',-1)
nssm_register_eatcraftitems ('roasted_ant_leg','Roasted Ant Leg',4)
nssm_register_eatcraftitems ('spider_leg','Spider Leg',-1)
nssm_register_eatcraftitems ('roasted_spider_leg','Roasted Spider Leg',4)
--nssm_register_eatcraftitems ('brain','Brain',3)
--nssm_register_eatcraftitems ('roasted_brain','Roasted Brain',8)
nssm_register_eatcraftitems ('tentacle','Tentacle',2)
nssm_register_eatcraftitems ('roasted_tentacle','Roasted Tentacle',5)
nssm_register_eatcraftitems ('worm_flesh','Worm Flesh',-2)
nssm_register_eatcraftitems ('roasted_worm_flesh','Roasted Worm Flesh',4)
nssm_register_eatcraftitems ('amphibian_heart','Amphibian Heart',1)
nssm_register_eatcraftitems ('roasted_amphibian_heart','Roasted Amphibian Heart',8)
nssm_register_eatcraftitems ('raw_scrausics_wing','Raw Scrausics Wing',1)
nssm_register_eatcraftitems ('spicy_scrausics_wing','Spicy Scrausics Wing',6)
nssm_register_eatcraftitems ('phoenix_nuggets','Phoenix Nuggets',20)
nssm_register_eatcraftitems ('phoenix_tear','Phoenix Tear',20)
nssm_register_eatcraftitems ('frosted_amphibian_heart','Frosted Amphibian Heart',-1)
nssm_register_eatcraftitems ('surimi','Surimi',4)
nssm_register_eatcraftitems ('amphibian_ribs','Amphibian Ribs',2)
nssm_register_eatcraftitems ('roasted_amphibian_ribs','Roasted Amphibian Ribs',6)
nssm_register_eatcraftitems ('dolidrosaurus_fin','Dolidrosaurus Fin',-2)
nssm_register_eatcraftitems ('roasted_dolidrosaurus_fin','Roasted Dolidrosaurus Fin',4)
nssm_register_eatcraftitems ('larva_meat','Larva Meat',-1)
nssm_register_eatcraftitems ('larva_juice','Larva Juice',-3)
nssm_register_eatcraftitems ('larva_soup','Larva Soup',10)
nssm_register_eatcraftitems ('mantis_meat','Mantis Meat',1)
nssm_register_eatcraftitems ('roasted_mantis_meat','Roasted Mantis Meat',4)
nssm_register_eatcraftitems ('spider_meat','Spider Meat',-1)
nssm_register_eatcraftitems ('roasted_spider_meat','Roasted Spider Meat',3)
nssm_register_eatcraftitems ('silk_gland','Silk Gland',-1)
nssm_register_eatcraftitems ('roasted_silk_gland','Roasted Silk Gland',3)
nssm_register_eatcraftitems ('super_silk_gland','Super Silk Gland',-8)
nssm_register_eatcraftitems ('roasted_super_silk_gland','Roasted Super Silk Gland',2)

minetest.register_craftitem("nssm:cold_stars", {
	description = "Cold Stars",
	image = "cold_stars.png",
	on_place = function(itemstack, placer, pointed_thing)
		for i=1,33 do
			local pos1 = minetest.get_pointed_thing_position(pointed_thing, true)
			local dx = math.random(-20,20)
			local	dy = math.random(-3,20)
			local	dz = math.random(-20,20)
			local pos1 = {x = pos1.x+dx, y=pos1.y+dy, z=pos1.z+dz}
			if not minetest.is_protected(pos, "") or not minetest.get_item_group(minetest.get_node(pos).name, "unbreakable") == 1 then
				minetest.set_node(pos1, {name="nssm:cold_star"})
				minetest.get_node_timer(pos1):start(400)
			end
		end
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end
})



--ore generation

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
for i=1,9 do
minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "default:cobble",
		clust_scarcity = 1,
		clust_num_ores = 1,
		clust_size     = 1,
		height_min     = -1,
		height_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "default:mossycobble",
		clust_scarcity = 1,
		clust_num_ores = 1,
		clust_size     = 1,
		height_min     = -1000,
		height_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "default:sandstonebrick",
		clust_scarcity = 1,
		clust_num_ores = 1,
		clust_size     = 1,
		height_min     = -1000,
		height_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "stairs:stair_sandstonebrick",
		clust_scarcity = 1,
		clust_num_ores = 1,
		clust_size     = 1,
		height_min     = -1000,
		height_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "stairs:stair_cobble",
		clust_scarcity = 1,
		clust_num_ores = 1,
		clust_size     = 1,
		height_min     = -1000,
		height_max     = 40,
			})
end

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

--nodes

minetest.register_node("nssm:ant_dirt", {
	description = "Ant Dirt",
	tiles = {"ant_dirt.png"},
	groups = {crumbly=3},
})

minetest.register_node("nssm:dead_leaves", {
	description = "Dead leaves",
	tiles = {"dead_leaves.png"},
	groups = {snappy=3,leaves=1, not_in_creative_inventory =1},
})

minetest.register_node("nssm:invisible_light", {
	description = "Invisible light source",
	tiles = {"transparent.png"},
	paramtype = "light",
	drawtype = "airlike",
	walkable = false,
	sunlight_propagates = true,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	groups = {unbreakable=1, not_in_creative_inventory =1},
	drop = "",
	light_source = 15,
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
	drowning = 9,
	damage_per_second = 1,
	post_effect_color = {a=100, r=1, g=100, b=1},
	groups = {flammable = 2, not_in_creative_inventory =1},
})

minetest.register_node("nssm:crystal_gas", {
	description = "Crystal Gas",
	--inventory_image = minetest.inventorycube("venomous_gas.png"),
	drawtype = "airlike",
	--tiles = {
		--{name="venomous_gas_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	--},
	paramtype = "light",
	walkable = false,
	--sunlight_propagates = true,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 2,
	post_effect_color = {a=1000, r=1000, g=1000, b=1000},
	groups = {flammable = 2, not_in_creative_inventory =1},
})

minetest.register_node("nssm:slug_crystal", {
	description = "Slug Crystal",
	tile_images = {"slug_crystal.png"} ,
	paramtype = "light",
	drawtype = "glasslike",
	drowning = 10,
	damage_per_second = 1,
	drop = "",
	post_effect_color = {a=1000, r=1000, g=1000, b=1000},
	light_source = 2,
	groups = {cracky=1, not_in_creative_inventory =1},
})

minetest.register_node("nssm:coldest_ice", {
	description = "Coldest Ice",
	tile_images = {"coldest_ice.png"} ,
	paramtype = "light",
	drowning = 2,
	damage_per_second = 1,
	drop = "",
	light_source = 3,
	groups = {cracky=1, not_in_creative_inventory =1},
})

minetest.register_node("nssm:modders_block", {
	description = "Modders Block",
	tiles = {"modders_block.png"},
	is_ground_content = true,
	groups = {crumbly=3, not_in_creative_inventory =1},
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

minetest.register_node("nssm:mud", {
	description = "Mud",
	inventory_image = "mude.png",
	tiles = {
		{name="mud_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=16.0}}
	},
	walkable = false,
	paramtype = "light",
	pointable = true,
	buildable_to = false,
	drop = "",
	drowning = 0,
	liquid_renewable = false,
	liquidtype = "source",
	liquid_range= 0,
	liquid_alternative_flowing = "nssm:mud",
	liquid_alternative_source = "nssm:mud",
	liquid_viscosity = 10,
	groups = {crumbly=1, liquid=1},
})

minetest.register_abm({
	nodenames = {"nssm:mud"},
	neighbors = {"air"},
	interval = 15,
	chance = 10,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local vec={x=1, y=1, z=1}
		local poslist = minetest.find_nodes_in_area(vector.subtract(pos, vec), vector.add(pos,vec), "group:water")
		if #poslist == 0 then
			minetest.set_node(pos, {name="default:dirt"})
		end
	end
})

minetest.register_node("nssm:thick_web", {
	description = "Thick Web",
	inventory_image = "thick_web.png",
	tile_images = {"thick_web.png"} ,
    drawtype = "firelike",
	paramtype = "light",
	walkable = false,
	pointable = true,
	diggable = true,
	buildable_to = false,
	drop = "",
	drowning = 2,
	liquid_renewable = false,
	liquidtype = "source",
	liquid_range= 0,
	liquid_alternative_flowing = "nssm:thick_web",
	liquid_alternative_source = "nssm:thick_web",
	liquid_viscosity = 30,
	groups = {flammable=2, liquid=1},
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
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory =1},
})

minetest.register_node("nssm:mese_meteor", {
	description = "Mese Meteor",
	tile_images = {"mese_meteor.png"} ,
	paramtype = "light",
	drop = "",
	groups = {crumbly=1, falling_node=1, flammable = 2, not_in_creative_inventory =1},
})

minetest.register_node("nssm:pumpbomb", {
	tiles = {"pumpbomb_top.png","pumpbomb_bottom.png", "pumpbomb_side.png", "pumpbomb_side.png", "pumpbomb_side.png", "pumpbomb_front.png"},
	light_source = 5,
	groups = {not_in_creative_inventory =1},
	drop = "",
	on_timer = function(pos, elapsed)
		tnt_boom_nssm(pos, {damage_radius=4,radius=3,ignore_protection=false})
		minetest.env:set_node(pos, {name="air"})
	end,
})

--abms

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
	nodenames = {"nssm:crystal_gas"},
	interval = 1,
	chance = 4,
	action = function(pos, node, active_object_count, active_object_count_wider)
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "nssm:slug_crystal"})
	end
})

minetest.register_abm({
	nodenames = {"nssm:slug_crystal"},
	interval = 20,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "air"})
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

minetest.register_node("nssm:phoenix_fire", {
	description = "Phoenix Fire",
	drawtype = "firelike",
	tiles = {{
		name = "phoenix_fire_animated.png",
		animation = {type = "vertical_frames",
			aspect_w = 16, aspect_h = 16, length = 1},
	}},
	inventory_image = "phoenix_fire.png",
	light_source = 15,
	groups = {igniter = 1, snappy=1},
	drop = '',
	walkable = false,
	buildable_to = false,
	damage_per_second = 4,
	})

minetest.register_abm({
	nodenames = {"nssm:phoenix_fire"},
	neighbors = {"air"},
	interval = 3,
	chance = 2,
	action = function(pos, node)
			minetest.set_node({x = pos.x, y = pos.y , z = pos.z}, {name = "air"})
		end
})

minetest.register_abm({
	nodenames = {"nssm:dead_leaves"},
	neighbors = {"air"},
	interval = 15,
	chance = 3,
	action = function(pos, node)
			minetest.set_node({x = pos.x, y = pos.y , z = pos.z}, {name = "air"})
		end
})


--Eggs

function nssm_register_egg (name, descr)
	minetest.register_craftitem("nssm:".. name, {
		description = descr .. " Egg",
		image = name.."_egg.png",
		on_place = function(itemstack, placer, pointed_thing)
			local pos1=minetest.get_pointed_thing_position(pointed_thing, true)
			pos1.y=pos1.y+1.5
			core.after(0.1, function()
				minetest.add_entity(pos1, "nssm:".. name)
			end)
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end,
	})
end

function nssm_register_egg2 (name, descr)				--mobs you can't catch
	minetest.register_craftitem("nssm:".. name.."_egg", {
		description = descr .. " Egg",
		image = name.."_egg.png",
		on_place = function(itemstack, placer, pointed_thing)
			local pos1=minetest.get_pointed_thing_position(pointed_thing, true)
			pos1.y=pos1.y+1.5
			core.after(0.1, function()
				minetest.add_entity(pos1, "nssm:".. name)
			end)
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end,
	})
end

nssm_register_egg ('albino_spider', 'Albino Spider')
nssm_register_egg ('flying_duck', 'Flying Duck')
nssm_register_egg ('chog', 'Chog')
nssm_register_egg ('stone_eater', 'Stoneater')
nssm_register_egg ('signosigno', 'Signosigno')
nssm_register_egg ('bloco', 'Bloco')
nssm_register_egg ('sand_bloco', 'Sand Bloco')
nssm_register_egg ('swimming_duck', 'Swimming Duck')
nssm_register_egg ('duck', 'Duck')
nssm_register_egg2 ('duckking', 'Duckking')
nssm_register_egg2 ('silversand_dragon', 'Silversand Dragon')
nssm_register_egg2 ('tartacacia', 'Tartacacia')
nssm_register_egg2 ('river_lord', 'River Lord')
nssm_register_egg2 ('icelamander', 'Icelamander')
nssm_register_egg ('icesnake', 'Icesnake')
nssm_register_egg ('icelizard', 'Icelizard')
nssm_register_egg2 ('lava_titan', 'Lava Titan')
nssm_register_egg ('kele', 'Kele')
nssm_register_egg ('crystal_slug', 'Crystal Slug')
nssm_register_egg2 ('masticone', 'Masticone')
nssm_register_egg ('mantis', 'Mantis')
nssm_register_egg ('larva', 'Larva')
nssm_register_egg ('berinhog', 'Berinhog')
nssm_register_egg2 ('phoenix', 'Phoenix')
nssm_register_egg2 ('night_master', 'Night Master')
nssm_register_egg ('scrausics', 'Scrausics')
nssm_register_egg ('moonheron', 'Moonheron')
nssm_register_egg ('sandworm', 'Sandworm')
nssm_register_egg ('black_scorpion', 'Black Scorpion')
nssm_register_egg2 ('giant_sandworm', 'Giant Sandworm')
nssm_register_egg2 ('ant_queen', 'Ant Queen')
nssm_register_egg ('ant_soldier', 'Ant Soldier')
nssm_register_egg ('ant_worker', 'Ant Worker')
nssm_register_egg ('crab', 'Crab')
nssm_register_egg ('octopus', 'Octopus')
nssm_register_egg ('xgaloctopus', 'Xgaloctopus')
nssm_register_egg ('black_widow', 'Black Widow')
nssm_register_egg ('uloboros', 'Uloboros')
nssm_register_egg2 ('tarantula', 'Tarantula')
nssm_register_egg ('daddy_long_legs', 'Daddy Long Legs')
nssm_register_egg2 ('kraken', 'Kraken')
nssm_register_egg2 ('pumpking', 'Pumpking')
nssm_register_egg ('manticore', 'Manticore')
nssm_register_egg ('felucco', 'Felucco')
nssm_register_egg ('pumpkid', 'Pumpkid')
nssm_register_egg ('pumpboom_large', 'Large Pumpboom')
nssm_register_egg ('pumpboom_small', 'Small Pumpboom')
nssm_register_egg ('pumpboom_medium', 'Medium Pumpboom')
nssm_register_egg2 ('mordain', 'Mordain')
nssm_register_egg2 ('morgre', 'Morgre')
nssm_register_egg2 ('morvy', 'Morvy')
nssm_register_egg2 ('morgut', 'Morgut')
nssm_register_egg2 ('morde', 'Morde')
nssm_register_egg2 ('morlu', 'Morlu')
nssm_register_egg2 ('morwa', 'Morwa')
nssm_register_egg ('salamander', 'Salamander')
nssm_register_egg ('flust', 'Flust')
nssm_register_egg ('pelagia', 'Pelagia')
--nssm_register_egg ('morvalar', 'Morvalar')

minetest.register_craftitem("nssm:mese_egg", {
	description = "Mese Egg",
	image = "mese_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, true)
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
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end,
})


--experimental morwa statue
minetest.register_node("nssm:morwa_statue", {
   description = 'Morwa Statue',
   drawtype = 'mesh',
   mesh = 'morwa_statue.b3d',
   tiles = {'morwa_statue.png'},
   inventory_image = 'morwa_statue.png',
   groups = {not_in_creative_inventory=1},
   paramtype = 'light',
   paramtype2 = 'facedir',
   selection_box = {
      type = 'fixed',
      fixed = {-1, -0.5, -1, 1, 3, 1}, -- Right, Bottom, Back, Left, Top, Front
      },
   collision_box = {
      type = 'fixed',
      fixed = {-1, -0.5, -1, 1, 3, 1}, -- Right, Bottom, Back, Left, Top, Front
      },
})
--Abm to make the conversion between statue and the entity, caused by light

minetest.register_abm({
	nodenames = {"nssm:morwa_statue"},
	neighbors = {"air"},
	interval = 1,
	chance = 1,
	action =
	function(pos, node)
		local pos1 = {x=pos.x, y=pos.y+1, z=pos.z}
		local n = minetest.env:get_node(pos1).name
		if n ~= "air" then
			return
		end
		if (minetest.get_node_light(pos1) > 8)
		then
		minetest.add_entity(pos1, "nssm:morwa")
		minetest.remove_node(pos)
		end
	end
})

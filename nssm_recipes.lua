--recipes

minetest.register_craft({
	output = 'nssm:web_string',
	recipe = {
		{'nssm:web', 'nssm:web'},
		{'nssm:web', 'nssm:web'},
	}
})

minetest.register_craft({
	output = 'nssm:dense_web_string',
	recipe = {
		{'nssm:web_string', 'nssm:web_string', 'nssm:web_string'},
		{'nssm:web_string', 'nssm:web_string', 'nssm:web_string'},
		{'nssm:web_string', 'nssm:web_string', 'nssm:web_string'},
	}
})

minetest.register_craft({
	output = 'nssm:mantis_sword',
	recipe = {
		{'nssm:mantis_claw'},
		{'nssm:mantis_claw'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:masticone_fang_sword',
	recipe = {
		{'nssm:masticone_fang', 'nssm:masticone_fang'},
		{'nssm:masticone_fang', ''},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:black_ice_tooth',
	type = "shapeless",
	recipe = {'nssm:digested_sand', 'nssm:ice_tooth'},
})

minetest.register_craft({
	output = 'nssm:web 4',
	type = "shapeless",
	recipe = {'nssm:silk_gland'},
})

minetest.register_craft({
	output = 'nssm:crab_light_mace',
	recipe = {
		{'nssm:crab_chela'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:crab_heavy_mace',
	recipe = {
		{'', 'nssm:crab_chela', ''},
		{'nssm:crab_chela', 'nssm:crab_chela', 'nssm:crab_chela'},
		{'', 'group:stick', ''},
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
	type = "shapeless",
	recipe = {'nssm:tarantula_chelicerae', 'nssm:helmet_masticone_crowned', 'nssm:eyed_tentacle','nssm:black_ice_tooth', 'nssm:superior_energy_globe', 'nssm:sky_feather','nssm:cursed_pumpkin_seed', 'nssm:ant_queen_abdomen', 'nssm:snake_scute'}
})

--[[minetest.register_craft({
	output = 'nssm:masticone_skull_crowned',
	recipe = {
		{'', 'nssm:king_duck_crown', ''},
		{'', 'nssm:masticone_skull', ''},
		{'', '', ''},
	}
})]]

minetest.register_craft({
	output = 'nssm:eyed_tentacle',
	type = "shapeless",
	recipe = {'nssm:lava_titan_eye','nssm:tentacle_curly'}
})

minetest.register_craft({
	type = "shapeless",
	output = "nssm:life_energy 2",
	recipe = {"nssm:life_energy", "nssm:masticone_core"},
	replacements = {{ "nssm:masticone_core", "nssm:masticone_core"}},
})

minetest.register_craft({
	output = 'nssm:energy_globe 9',
	type = "shapeless",
	recipe = {'nssm:great_energy_globe'}
})

minetest.register_craft({
	output = 'nssm:great_energy_globe 9',
	type = "shapeless",
	recipe = {'nssm:superior_energy_globe'}
})
--[[
minetest.register_craft({
	output = 'nssm:masticone_skull',
	recipe = {
		{'nssm:masticone_skull_fragments', 'nssm:masticone_skull_fragments', 'nssm:masticone_skull_fragments'},
		{'nssm:masticone_skull_fragments', 'nssm:masticone_skull_fragments', 'nssm:masticone_skull_fragments'},
		{'nssm:masticone_skull_fragments', 'nssm:masticone_skull_fragments', 'nssm:masticone_skull_fragments'},
	}
})]]

minetest.register_craft({
	output = 'nssm:rope 12',
	recipe = {
		{'nssm:web_string'},
		{'nssm:web_string'},
		{'nssm:web_string'},
	}
})

minetest.register_craft({
	output = 'nssm:sky_feather',
	type = "shapeless",
	recipe = {'nssm:sun_feather','nssm:night_feather'}
})

minetest.register_craft({
	output = 'nssm:sun_sword',
	recipe = {
		{'default:diamond'},
		{'nssm:sun_feather'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:night_sword',
	recipe = {
		{'default:diamond'},
		{'nssm:night_feather'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:sand_sword',
	recipe = {
		{'nssm:digested_sand'},
		{'default:desert_stone'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:frozing_knife',
	recipe = {
		{'bucket:bucket_water'},
		{'nssm:ice_tooth'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:melting_knife',
	recipe = {
		{'bucket:bucket_lava'},
		{'nssm:ice_tooth'},
		{'group:stick'},
	}
})

function nssm_register_recip (ingredient, dish, tictac)

minetest.register_craft({
	type = "cooking",
	output = "nssm:"..dish,
	recipe = "nssm:"..ingredient,
	cooktime = tictac,
})

end

nssm_register_recip ('worm_flesh', 'roasted_worm_flesh', 12)
nssm_register_recip ('duck_legs', 'roasted_duck_legs', 6)
nssm_register_recip ('spider_leg', 'roasted_spider_leg', 6)
nssm_register_recip ('felucco_steak', 'roasted_felucco_steak', 10)
nssm_register_recip ('werewolf_leg', 'roasted_werewolf_leg', 10)
nssm_register_recip ('brain', 'roasted_brain', 6)
nssm_register_recip ('amphibian_heart', 'roasted_amphibian_heart', 6)
nssm_register_recip ('tentacle', 'roasted_tentacle', 6)
nssm_register_recip ('frosted_amphibian_heart', 'amphibian_heart', 8)
nssm_register_recip ('heron_leg', 'chichibios_heron_leg', 20)
nssm_register_recip ('raw_scrausics_wing', 'spicy_scrausics_wing', 12)
nssm_register_recip ('ant_leg', 'roasted_ant_leg', 6)
nssm_register_recip ('crocodile_tail', 'roasted_crocodile_tail', 16)
nssm_register_recip ('dolidrosaurus_fin', 'roasted_dolidrosaurus_fin', 8)
nssm_register_recip ('amphibian_ribs', 'roasted_amphibian_ribs', 12)
nssm_register_recip ('mantis_meat', 'roasted_mantis_meat', 6)
nssm_register_recip ('spider_meat', 'roasted_spider_meat', 6)
nssm_register_recip ('silk_gland', 'roasted_silk_gland', 4)
nssm_register_recip ('larva_juice', 'larva_soup', 20)



minetest.register_craft({
	output = 'nssm:larva_juice',
	type = "shapeless",
	recipe = {'nssm:larva_meat','bucket:bucket_empty'}
})

minetest.register_craft({
	output = 'nssm:ant_sword',
	recipe = {
		{'nssm:ant_mandible'},
		{'nssm:ant_mandible'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:ant_billhook',
	recipe = {
		{'nssm:ant_mandible', 'nssm:ant_mandible'},
		{'nssm:ant_mandible', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:ant_shovel',
	recipe = {
		{'nssm:ant_mandible'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:duck_beak_shovel',
	recipe = {
		{'nssm:duck_beak'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:duck_beak_pick',
	recipe = {
		{'nssm:duck_beak', 'nssm:duck_beak', 'nssm:duck_beak'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:stone_club',
	recipe = {
		{'nssm:bloco_skin', 'nssm:lava_titan_eye', 'nssm:bloco_skin'},
		{'nssm:bloco_skin', 'nssm:tentacle_curly', 'nssm:bloco_skin'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:lava_sword',
	recipe = {
		{'', 'default:obsidianWow', ''},
		{'', 'nssm:lava_titan_eye', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:earth_sword',
	recipe = {
		{'', 'nssm:earth_heart', ''},
		{'', 'default:dirt', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:ice_sword',
	recipe = {
		{'', 'nssm:ice_tooth', ''},
		{'', 'nssm:little_ice_tooth', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:earth_warhammer',
	recipe = {
		{'nssm:earth_heart', 'default:dirt', 'nssm:earth_heart'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})


minetest.register_craft({
	output = 'nssm:sky_iron 30',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'nssm:sky_feather', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
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

minetest.register_craft({
	output = 'nssm:felucco_knife',
	recipe = {
		{'nssm:felucco_horn'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:little_ice_tooth_knife',
	recipe = {
		{'nssm:little_ice_tooth'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:manticore_spine_knife',
	recipe = {
		{'nssm:manticore_spine'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:ant_pick',
	recipe = {
		{'nssm:ant_mandible', 'nssm:ant_mandible', 'nssm:ant_mandible'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:mantis_pick',
	recipe = {
		{'nssm:mantis_claw', 'nssm:mantis_claw', 'nssm:mantis_claw'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:mantis_axe',
	recipe = {
		{'nssm:mantis_claw', 'nssm:mantis_claw'},
		{'nssm:mantis_claw', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:tarantula_warhammer',
	recipe = {
		{'nssm:tarantula_chelicerae'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'nssm:mantis_battleaxe',
	recipe = {
		{'nssm:mantis_claw', 'nssm:mantis_claw', 'nssm:mantis_claw'},
		{'nssm:mantis_claw', 'group:stick', 'nssm:mantis_claw'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:life_wand',
	recipe = {
		{'nssm:life_energy', 'nssm:energy_globe', 'nssm:life_energy'},
		{'group:wood', 'group:stick', 'group:wood'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'nssm:stone_wand',
	recipe = {
		{'group:stone', 'nssm:energy_globe', 'group:stone'},
		{'group:wood', 'group:stick', 'group:wood'},
		{'', 'group:stick', ''},
	}
})

--[[minetest.register_craft({
	output = 'nssm:nature_wand',
	recipe = {
		{'group:leaves', 'nssm:energy_globe', 'group:leaves'},
		{'group:wood', 'group:stick', 'group:wood'},
		{'', 'group:stick', ''},
	}
})]]

if minetest.get_modpath("nssb") then
	minetest.register_craft({
		output = 'nssm:axe_of_pride',
		recipe = {
			{'nssm:proud_moranga', 'nssm:proud_moranga', 'nssm:proud_moranga'},
			{'nssm:proud_moranga', 'nssb:moranga_ingot', ''},
			{'', 'nssb:moranga_ingot', ''},
		}
	})

	minetest.register_craft({
		output = 'nssm:cold_stars',
		recipe = {
			{'nssm:morelentir_dust', 'nssm:morelentir_dust', 'nssm:morelentir_dust'},
			{'nssm:morelentir_dust', 'default:mese_block', 'nssm:morelentir_dust'},
			{'nssm:morelentir_dust', 'nssm:morelentir_dust', 'nssm:morelentir_dust'},
		}
	})

	minetest.register_craft({
		output = 'nssm:gratuitousness_battleaxe',
		recipe = {
			{'nssm:greedy_moranga', 'nssm:greedy_moranga', 'nssm:greedy_moranga'},
			{'nssm:greedy_moranga', 'nssb:moranga_ingot', 'nssm:greedy_moranga'},
			{'', 'nssb:moranga_ingot', ''},
		}
	})

	minetest.register_craft({
		output = 'nssm:sword_of_envy',
		recipe = {
			{'nssm:envious_moranga'},
			{'nssm:envious_moranga'},
			{'nssb:moranga_ingot'},
		}
	})

	minetest.register_craft({
		output = 'nssm:sword_of_eagerness',
		recipe = {
			{'nssm:slothful_moranga'},
			{'nssm:slothful_moranga'},
			{'nssb:moranga_ingot'},
		}
	})

	minetest.register_craft({
		output = 'nssm:falchion_of_eagerness',
		recipe = {
			{'nssm:slothful_moranga','nssm:slothful_moranga'},
			{'nssm:slothful_moranga', ''},
			{'nssb:moranga_ingot',''},
		}
	})

	minetest.register_craft({
		output = 'nssm:sword_of_gluttony',
		recipe = {
			{'nssm:gluttonous_moranga', 'nssm:gluttonous_moranga', 'nssm:gluttonous_moranga'},
			{'', 'nssm:gluttonous_moranga', ''},
			{'', 'nssb:moranga_ingot', ''},
		}
	})

	function nssm_register_moranga (viz)
	minetest.register_craft({
		output = 'nssm:'.. viz ..'_moranga',
		recipe = {
			{'nssm:'.. viz ..'_soul_fragment', 'nssb:moranga_ingot', 'nssm:'.. viz ..'_soul_fragment'},
			{'nssb:moranga_ingot', 'nssm:'.. viz ..'_soul_fragment', 'nssb:moranga_ingot'},
			{'nssm:'.. viz ..'_soul_fragment', 'nssb:moranga_ingot', 'nssm:'.. viz ..'_soul_fragment'},
		}
	})
	end
	nssm_register_moranga ("lustful")
	nssm_register_moranga ("greedy")
	nssm_register_moranga ("slothful")
	nssm_register_moranga ("wrathful")
	nssm_register_moranga ("gluttonous")
	nssm_register_moranga ("envious")
	nssm_register_moranga ("proud")
end

--Eggs recipes



minetest.register_craft({
	output = 'nssm:duck',
	recipe = {
		{'', 'nssm:duck_beak', ''},
		{'nssm:duck_feather', 'nssm:energy_globe', 'nssm:duck_feather'},
		{'nssm:duck_legs', 'nssm:duck_feather', 'nssm:duck_legs'},
	}
})

minetest.register_craft({
	output = 'nssm:flying_duck',
	recipe = {
		{'nssm:duck_feather', 'nssm:duck_beak', 'nssm:duck_feather'},
		{'nssm:duck_feather', 'nssm:energy_globe', 'nssm:duck_feather'},
		{'nssm:duck_legs', 'nssm:duck_feather', 'nssm:duck_legs'},
	}
})

minetest.register_craft({
	output = 'nssm:enderduck',
	recipe = {
		{'nssm:black_duck_feather', 'nssm:duck_beak', 'nssm:black_duck_feather'},
		{'nssm:duck_legs', 'nssm:energy_globe', 'nssm:duck_legs'},
		{'nssm:duck_legs', '', 'nssm:duck_legs'},
	}
})

minetest.register_craft({
	output = 'nssm:swimming_duck',
	recipe = {
		{'nssm:duck_feather', 'nssm:duck_beak', 'nssm:duck_feather'},
		{'nssm:duck_legs', 'nssm:energy_globe', 'nssm:duck_legs'},
		{'nssm:duck_feather', 'nssm:duck_feather', 'nssm:duck_feather'},
	}
})

minetest.register_craft({
	output = 'nssm:spiderduck',
	recipe = {
		{'nssm:duck_legs', 'nssm:duck_beak', 'nssm:duck_legs'},
		{'nssm:black_duck_feather', 'nssm:energy_globe', 'nssm:black_duck_feather'},
		{'nssm:duck_legs', 'nssm:black_duck_feather', 'nssm:duck_legs'},
	}
})

minetest.register_craft({
	output = 'nssm:duckking_egg',
	recipe = {
		{'', 'nssm:helmet_crown', ''},
		{'nssm:duck_feather', 'nssm:duck_beak', 'nssm:duck_feather'},
		{'nssm:duck_legs', 'nssm:superior_energy_globe', 'nssm:duck_legs'},
	}
})

minetest.register_craft({
	output = 'nssm:bloco',
	recipe = {
		{'nssm:bloco_skin', 'nssm:bloco_skin', 'nssm:bloco_skin'},
		{'nssm:bloco_skin', 'nssm:energy_globe', 'nssm:bloco_skin'},
		{'nssm:bloco_skin', 'nssm:bloco_skin', 'nssm:bloco_skin'},
	}
})

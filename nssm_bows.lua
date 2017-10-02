if minetest.get_modpath("bows") then

	bows.register_arrow("arrow_duck",{
	description="Duck Arrow",
	texture="arrow_duck.png",
	damage=10,
	craft_count=4,
	craft={
		{"","",""},
		{"nssm:duck_beak","group:stick","nssm:duck_feather"},
		{"","",""},
	}
	})

	bows.register_bow("bow_felucco",{
		description="Felucco Bow",
		texture="bow_felucco.png",
		texture_loaded="bow_felucco_loaded.png",
		uses=350,
		level=12,
		shots=2,
		craft={
			{"","nssm:felucco_horn","nssm:web_string"},
			{"group:stick","","nssm:web_string"},
			{"","nssm:felucco_horn","nssm:web_string"}
		},
	})

	bows.register_bow("bow_ant",{
		description="Ant Bow",
		texture="bow_ant.png",
		texture_loaded="bow_ant_loaded.png",
		uses=200,
		level=10,
		shots=1,
		craft={
			{"","nssm:ant_mandible","nssm:web_string"},
			{"group:stick","","nssm:web_string"},
			{"","nssm:ant_mandible","nssm:web_string"}
		},
	})

	bows.register_bow("bow_berinhog",{
		description="Berinhog Bow",
		texture="bow_berinhog.png",
		texture_loaded="bow_berinhog_loaded.png",
		uses=400,
		level=16,
		shots=1,
		craft={
			{"","nssm:berinhog_horn","nssm:web_string"},
			{"group:stick","","nssm:web_string"},
			{"","nssm:berinhog_horn","nssm:web_string"}
		},
	})

	bows.register_arrow("arrow_ice",{
	description="Ice Arrow",
	texture="arrow_ice.png",
	damage=12,
	craft_count=4,
	craft={
			{"","",""},
			{"nssm:little_ice_tooth","group:stick","nssm:duck_feather"},
			{"","",""},
		}
	})

	bows.register_arrow("arrow_manticore",{
	description="Manticore Arrow",
	texture="arrow_manticore.png",
	damage=15,
	craft_count=4,
	craft={
		{"","",""},
		{"nssm:manticore_spine","group:stick","nssm:duck_feather"},
		{"","",""},
	}
})



end

-- Spawning parameters

-- ANTS
nssm:spawn_specific("nssm:ant_queen", {"nssm:ant_dirt"}, {"air"}, 0, 20, 60, 200, 1, -31000, 31000)
nssm:spawn_specific("nssm:ant_soldier", {"nssm:ant_dirt"}, {"air"}, 0, 20, 7, 30, 4, -31000, 31000)
nssm:spawn_specific("nssm:ant_worker", {"nssm:ant_dirt"}, {"air"}, 0, 20, 5, 10, 5, -31000, 31000)

-- SPIDERS
nssm:spawn_specific("nssm:black_widow", {"default:jungle_grass", "default:jungletree", "nssm:web" }, {"air"}, 0, 20, 20, 1200, 2, -31000, 31000)
nssm:spawn_specific("nssm:daddy_long_legs", {"default:jungle_grass", "default:jungletree", "nssm:web" }, {"air"}, 0, 20, 10, 1200, 2, -31000, 31000)
nssm:spawn_specific("nssm:tarantula", {"default:jungle_grass", "default:jungletree", "nssm:web" }, {"air"}, 0, 14, 120, 5000, 1, -31000, 31000)
nssm:spawn_specific("nssm:uloboros", {"default:jungle_grass", "default:jungletree", "nssm:web" }, {"air"}, 0, 20, 20, 1200, 1, -31000, 31000)

-- CAVES
nssm:spawn_specific("nssm:bloco", {"default:stone"}, {"default:stone"}, 0, 20, 30, 500, 3, -31000, -20)
nssm:spawn_specific("nssm:lava_titan", {"default:stone"}, {"air"}, 0, 120, 12, 22000, 1, -31000, -100)
nssm:spawn_specific("nssm:stone_eater", {"default:stone"}, {"default:stone"}, 0, 20, 40, 700, 2, -31000, -20)
nssm:spawn_specific("nssm:signosigno", {"default:stone"}, {"default:stone"}, 0, 10, 20, 400, 2, -31000, -20)
nssm:spawn_specific("nssm:signosigno", {"bones:bones"}, {"air"}, 0, 15, 3, 1, 5, -31000, 31000)

-- SEA
nssm:spawn_specific("nssm:crab", {"default:sand"}, {"default:water_source"}, 0, 20, 20, 3000, 1, -31000, 31000)
nssm:spawn_specific("nssm:crocodile", {"default:sand","default:water_source"}, {"default:water_source"}, 0, 20, 60, 35000, 1, -31000, 31000)
nssm:spawn_specific("nssm:dolidrosaurus", {"default:water_source"}, {"default:water_source"}, 0, 20, 60, 35000, 1, -31000, -1)
nssm:spawn_specific("nssm:kraken", {"default:water_source"}, {"default:water_source"}, 0, 20, 120, 120000, 1, -31000, 0)
nssm:spawn_specific("nssm:octopus", {"default:water_source"}, {"default:water_source"}, 0, 20, 60, 38000, 1, -31000, 0)

-- DESERT
nssm:spawn_specific("nssm:sandworm", {"default:desert_sand", "default:desert_stone"}, {"air"}, 0, 20, 20, 20000, 1, -31000, 31000)
nssm:spawn_specific("nssm:giant_sandworm", {"default:desert_sand", "default:desert_stone"}, {"air"}, 0, 20, 1200, 40000, 1, -31000, 31000)
nssm:spawn_specific("nssm:sand_bloco", {"default:desert_sand", "default:desert_stone"}, {"air"}, 0, 20, 20, 5000, 1, -31000, 31000)

-- DUCKS
nssm:spawn_specific("nssm:duck", {"default:dirt_with_grass"}, {"group:flora"}, 10, 20, 20, 250, 1, -31000, 31000)
nssm:spawn_specific("nssm:duckking", {"default:dirt_with_grass"}, {"group:flora"}, 10, 20, 120, 3000, 1, -31000, 31000)
nssm:spawn_specific("nssm:enderduck", {"default:dirt_with_grass"}, {"group:flora"}, 0, 10, 45, 900, 1, -31000, 31000)
nssm:spawn_specific("nssm:flying_duck", {"air"}, {"group:flora"}, 10, 20, 60, 700, 1, 1, 31000)
nssm:spawn_specific("nssm:spiderduck", {"default:dirt_with_grass"}, {"group:flora"}, 0, 10, 45, 850, 1, -31000, 31000)
nssm:spawn_specific("nssm:swimming_duck", {"default:water_source"}, {"default:water_source"}, 0, 20, 60, 45000, 1, -31000, 31000)

-- MOUNTAINS
nssm:spawn_specific("nssm:echidna", {"default:dirt_with_grass"}, {"default:dirt_with_grass"}, 0, 20, 120, 50000, 1, 22, 31000)
nssm:spawn_specific("nssm:manticore", {"default:dirt_with_grass"}, {"default:dirt_with_grass"}, 10, 20, 30, 12000, 1, 20, 31000)
nssm:spawn_specific("nssm:werewolf", {"default:dirt_with_grass"}, {"default:dirt_with_grass"}, 0, 10, 30, 12000, 1, 20, 31000)

-- ICE
nssm:spawn_specific("nssm:icelamander", {"default:snowblock", "default:ice"}, {"default:snowblock", "default:ice"}, 0, 20, 120, 15000, 1, -31000, 31000)
nssm:spawn_specific("nssm:icesnake", {"default:snowblock", "default:ice", "default:dirt_with_snow"}, {"default:snowblock", "default:ice", "default:dirt_with_snow"}, 0, 20, 30, 6000, 1, -31000, 31000)
nssm:spawn_specific("nssm:white_werewolf", {"default:dirt_with_snow","default:snowblock"}, {"air"}, 0, 20, 60, 9000, 1, -31000, 31000)
nssm:spawn_specific("nssm:snow_biter", {"default:snowblock", "default:ice", "default:dirt_with_snow"}, {"default:snowblock", "default:ice", "default:dirt_with_snow"}, 0, 20, 30, 6000, 1, -31000, 31000)


-- FOREST
nssm:spawn_specific("nssm:larva", {"default:dirt_with_grass"}, {"default:tree","default:aspen_tree"}, 0, 20, 40, 200, 1, -31000, 140)
nssm:spawn_specific("nssm:masticone", {"default:dirt_with_grass"}, {"default:tree","default:aspen_tree"}, 0, 20, 120, 5000, 2, -31000, 140)

-- SKY
nssm:spawn_specific("nssm:moonheron", {"air"}, {"air"}, 0, 10, 100, 750000, 1, 10, 180)
nssm:spawn_specific("nssm:night_master", {"air"}, {"air"}, 0, 7, 120, 25000000, 2, 10, 180)
nssm:spawn_specific("nssm:phoenix", {"air"}, {"air"}, 10, 20, 120, 5000000, 1, 10, 180)
nssm:spawn_specific("nssm:scrausics", {"air"}, {"air"}, 10, 20, 100, 750000, 1, 10, 180)

-- PINE FOREST
nssm:spawn_specific("nssm:pumpboom_small", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_tree"}, 0, 20, 30, 600, 1, -31000, 31000)
nssm:spawn_specific("nssm:pumpboom_medium", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_tree"}, 0, 20, 30, 800, 1, -31000, 31000)
nssm:spawn_specific("nssm:pumpboom_large", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_tree"}, 0, 20, 30, 1000, 1, -31000, 31000)
nssm:spawn_specific("nssm:pumpking", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_needles", "default:pine_tree"}, 0, 12, 120, 8000, 1, -31000, 31000)

-- SAVANNA
nssm:spawn_specific("nssm:felucco", {"default:dirt_with_dry_grass"}, {"default:dirt_with_dry_grass"}, 0, 20, 30, 9000, 1, -200, 31000)

-- NSSB SPECIAL
if minetest.get_modpath("nssb") then
nssm:spawn_specific("nssm:xgaloctopus", {"default:water_source"}, {"nssb:marine_brick"}, 0, 20, 20, 800, 1, -31000, 0)
nssm:spawn_specific("nssm:morbat1", {"air"}, {"nssb:morelentir"}, 0, 20, 100, 1000, 1, -31000, 0)
nssm:spawn_specific("nssm:morbat2", {"air"}, {"nssb:morelentir"}, 0, 20, 100, 1000, 1, -31000, 0)
nssm:spawn_specific("nssm:morbat3", {"air"}, {"nssb:morelentir"}, 0, 20, 100, 1000, 1, -31000, 0)
nssm:spawn_specific("nssm:morvy", {"nssb:morentir"}, {"nssb:morentir"}, 0, 20, 120, 1200, 1, -31000, -93)
nssm:spawn_specific("nssm:morlu", {"nssb:morentir"}, {"nssb:mornen"}, 0, 20, 80, 700, 1, -31000, -93)
nssm:spawn_specific("nssm:morde", {"nssb:morenrir"}, {"nssb:mornar"}, 0, 20, 50, 500, 1, -31000, -93)
nssm:spawn_specific("nssm:mordain", {"nssb:morentir"}, {"nssb:morentir"}, 0, 20, 90, 900, 1, -31000, .93)
nssm:spawn_specific("nssm:morgut", {"nssb:morentir"}, {"nssb:morentir"}, 0, 20, 50, 500, 1, -31000, -93)
end

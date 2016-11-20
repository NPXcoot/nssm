--Before starting a new game write 6 or 7 in order to regulate the spawns (7 works also with flat and fractal).

local mymapgenis = nssm.mymapgenis

-- Spawning parameters

if mymapgenis == 6 then

    -- ANTS
    mobs:spawn_specific("nssm:ant_queen", {"nssm:ant_dirt"}, {"air"}, 0, 20, 60, 200, 1, -31000, 31000)
    mobs:spawn_specific("nssm:ant_soldier", {"nssm:ant_dirt"}, {"air"}, 0, 20, 7, 30, 4, -31000, 31000)
    mobs:spawn_specific("nssm:ant_worker", {"nssm:ant_dirt"}, {"air"}, 0, 20, 5, 10, 5, -31000, 31000)

    -- SPIDERS
    mobs:spawn_specific("nssm:black_widow", {"default:jungle_grass", "default:jungletree", "nssm:web" }, {"air"}, 0, 20, 20, 1200, 2, -31000, 31000)
    mobs:spawn_specific("nssm:daddy_long_legs", {"default:jungle_grass", "default:jungletree", "nssm:web" }, {"air"}, 0, 20, 10, 1200, 2, -31000, 31000)
    mobs:spawn_specific("nssm:tarantula", {"default:jungle_grass", "default:jungletree", "nssm:web" }, {"air"}, 0, 14, 120, 5000, 1, -31000, 31000)
    mobs:spawn_specific("nssm:uloboros", {"default:jungle_grass", "default:jungletree", "nssm:web" }, {"air"}, 0, 20, 20, 1200, 1, -31000, 31000)

    -- DUCKS
    mobs:spawn_specific("nssm:duck", {"default:dirt_with_grass"}, {"group:flora"}, 10, 20, 20, 350, 1, -31000, 20)
    mobs:spawn_specific("nssm:duckking", {"default:dirt_with_grass"}, {"group:flora"}, 10, 20, 300, 5000, 1, -31000, 20)
    mobs:spawn_specific("nssm:enderduck", {"default:dirt_with_grass"}, {"group:flora"}, 0, 10, 45, 900, 1, -31000, 20)
    mobs:spawn_specific("nssm:flying_duck", {"air"}, {"group:leaves"}, 10, 20, 120, 24000, 1, 1, 25)
	mobs:spawn_specific("nssm:flying_duck", {"air"}, {"group:flora"}, 10, 20, 120, 6000, 1, 1, 25)
    mobs:spawn_specific("nssm:spiderduck", {"default:dirt_with_grass"}, {"group:flora"}, 0, 10, 45, 850, 1, -31000, 20)
    mobs:spawn_specific("nssm:swimming_duck", {"default:water_source"}, {"default:water_source"}, 0, 20, 60, 45000, 1, -31000, 20)

    -- MOUNTAINS
    mobs:spawn_specific("nssm:echidna", {"default:dirt_with_grass"}, {"default:dirt_with_grass"}, 0, 20, 200, 100000, 1, 22, 31000)
    mobs:spawn_specific("nssm:manticore", {"default:dirt_with_grass"}, {"default:dirt_with_grass"}, 10, 20, 60, 12000, 1, 20, 31000)
    mobs:spawn_specific("nssm:werewolf", {"default:dirt_with_grass"}, {"default:dirt_with_grass"}, 0, 10, 60, 12000, 1, 20, 31000)

    -- ICE
    mobs:spawn_specific("nssm:icelamander", {"default:snowblock", "default:ice"}, {"default:snowblock", "default:ice"}, 0, 20, 120, 25000, 1, -31000, 31000)
    mobs:spawn_specific("nssm:icesnake", {"default:snowblock", "default:ice", "default:dirt_with_snow"}, {"default:snowblock", "default:ice", "default:dirt_with_snow"}, 0, 20, 30, 6000, 1, -31000, 31000)
    mobs:spawn_specific("nssm:white_werewolf", {"default:dirt_with_snow","default:snowblock"}, {"air"}, 0, 20, 60, 9000, 1, 20, 31000)
    mobs:spawn_specific("nssm:snow_biter", {"default:snowblock", "default:ice", "default:dirt_with_snow"}, {"default:snowblock", "default:ice", "default:dirt_with_snow"}, 0, 20, 30, 6000, 1, -31000, 31000)

    -- FOREST
    mobs:spawn_specific("nssm:larva", {"default:dirt_with_grass"}, {"default:tree","default:aspen_tree"}, 0, 20, 40, 200, 1, -31000, 140)
    mobs:spawn_specific("nssm:masticone", {"default:dirt_with_grass"}, {"default:tree","default:aspen_tree"}, 0, 20, 120, 5000, 2, -31000, 140)

    -- PINE FOREST
    mobs:spawn_specific("nssm:pumpboom_small", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_tree"}, 0, 20, 30, 600, 1, -31000, 31000)
    mobs:spawn_specific("nssm:pumpboom_medium", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_tree"}, 0, 20, 30, 800, 1, -31000, 31000)
    mobs:spawn_specific("nssm:pumpboom_large", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_tree"}, 0, 20, 30, 1000, 1, -31000, 31000)
    mobs:spawn_specific("nssm:pumpking", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_needles", "default:pine_tree"}, 0, 12, 120, 8000, 1, -31000, 31000)

else

    -- SPIDERS
    mobs:spawn_specific("nssm:black_widow", {"default:jungle_grass", "default:jungletree", "nssm:web" }, {"air"}, 0, 20, 30, 2200, 2, -31000, 31000)
    mobs:spawn_specific("nssm:daddy_long_legs", {"default:jungle_grass", "default:jungletree", "nssm:web" }, {"air"}, 0, 30, 10, 2200, 2, -31000, 31000)
    mobs:spawn_specific("nssm:tarantula", {"default:jungle_grass", "default:jungletree", "nssm:web" }, {"air"}, 0, 14, 120, 5000, 1, -31000, 31000)
    mobs:spawn_specific("nssm:uloboros", {"default:jungle_grass", "default:jungletree", "nssm:web" }, {"air"}, 0, 20, 30, 2200, 1, -31000, 31000)

    -- DUCKS
    mobs:spawn_specific("nssm:duck", {"default:dirt_with_grass"}, {"group:flora"}, 10, 20, 50, 1500, 1, -31000, 40)
    mobs:spawn_specific("nssm:duckking", {"default:dirt_with_grass"}, {"group:flora"}, 10, 20, 400, 120000, 1, -31000, 40)
    mobs:spawn_specific("nssm:enderduck", {"default:dirt_with_grass"}, {"group:flora"}, 0, 10, 120, 5000, 1, -31000, 40)
    mobs:spawn_specific("nssm:flying_duck", {"air"}, {"group:leaves"}, 10, 20, 120, 8000, 1, 1, 40)
	mobs:spawn_specific("nssm:flying_duck", {"air"}, {"group:flora"}, 10, 20, 120, 25000, 1, 1, 40)
    mobs:spawn_specific("nssm:spiderduck", {"default:dirt_with_grass"}, {"group:flora"}, 0, 10, 120, 5000, 1, -31000, 45)
    mobs:spawn_specific("nssm:swimming_duck", {"default:water_source"}, {"default:water_source"}, 0, 20, 60, 45000, 1, -31000, 40)
	mobs:spawn_specific("nssm:swimming_duck", {"default:river_water_source"}, {"default:sand","default:river_water_source"}, 0, 20, 60, 3000, 1, -31000, 300)

    -- MOUNTAINS
    mobs:spawn_specific("nssm:echidna", {"default:dirt_with_grass"}, {"default:dirt_with_grass"}, 0, 20, 200, 100000, 1, 50, 31000)
    mobs:spawn_specific("nssm:manticore", {"default:dirt_with_grass"}, {"default:dirt_with_grass"}, 10, 20, 60, 13000, 1, 40, 31000)
    mobs:spawn_specific("nssm:werewolf", {"default:dirt_with_grass"}, {"default:dirt_with_grass"}, 0, 10, 60, 13000, 1, 40, 31000)

    -- ICE
    mobs:spawn_specific("nssm:icelamander", {"default:snowblock", "default:ice"}, {"default:snowblock", "default:ice"}, 0, 20, 180, 120000, 1, -31000, 31000)
    mobs:spawn_specific("nssm:icesnake", {"default:snowblock", "default:ice", "default:dirt_with_snow"}, {"default:snowblock", "default:ice", "default:dirt_with_snow"}, 0, 20, 40, 20000, 1, -31000, 31000)
    mobs:spawn_specific("nssm:white_werewolf", {"default:dirt_with_snow","default:snowblock"}, {"air"}, 0, 20, 35, 22000, 1, 50, 31000)
    mobs:spawn_specific("nssm:snow_biter", {"default:snowblock", "default:ice", "default:dirt_with_snow"}, {"default:snowblock", "default:ice", "default:dirt_with_snow"}, 0, 20, 40, 20000, 1, -31000, 31000)

    -- FOREST
    mobs:spawn_specific("nssm:larva", {"default:dirt_with_grass"}, {"default:tree","default:aspen_tree"}, 0, 20, 40, 800, 1, -31000, 140)
    mobs:spawn_specific("nssm:masticone", {"default:dirt_with_grass"}, {"default:tree","default:aspen_tree"}, 0, 20, 180, 6000, 2, -31000, 140)

    -- PINE FOREST
    mobs:spawn_specific("nssm:pumpboom_small", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_tree"}, 0, 20, 80, 1400, 1, -31000, 31000)
    mobs:spawn_specific("nssm:pumpboom_medium", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_tree"}, 0, 20, 80, 1600, 1, -31000, 31000)
    mobs:spawn_specific("nssm:pumpboom_large", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_tree"}, 0, 20, 80, 1800, 1, -31000, 31000)
    mobs:spawn_specific("nssm:pumpking", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_needles", "default:pine_tree"}, 0, 12, 120, 8000, 1, -31000, 31000)

    -- SAVANNA
	mobs:spawn_specific("nssm:felucco", {"default:dirt_with_dry_grass"}, {"default:dirt_with_dry_grass"}, 0, 20, 80, 20000, 1, -200, 31000)

end

-- NSSB SPECIAL
if minetest.get_modpath("nssb") then
	mobs:spawn_specific("nssm:xgaloctopus", {"default:water_source"}, {"nssb:marine_brick"}, 0, 20, 20, 800, 1, -31000, 0)
	mobs:spawn_specific("nssm:morbat1", {"air"}, {"nssb:morelentir"}, 0, 20, 100, 1000, 1, -31000, 0)
	mobs:spawn_specific("nssm:morbat2", {"air"}, {"nssb:morelentir"}, 0, 20, 100, 1000, 1, -31000, 0)
	mobs:spawn_specific("nssm:morbat3", {"air"}, {"nssb:morelentir"}, 0, 20, 100, 1000, 1, -31000, 0)
	mobs:spawn_specific("nssm:morvy", {"nssb:morentir"}, {"nssb:morentir"}, 0, 20, 120, 1200, 1, -31000, -93)
	mobs:spawn_specific("nssm:morlu", {"nssb:morentir"}, {"nssb:mornen"}, 0, 20, 80, 700, 1, -31000, -93)
	mobs:spawn_specific("nssm:morde", {"nssb:morenrir"}, {"nssb:mornar"}, 0, 20, 50, 500, 1, -31000, -93)
	mobs:spawn_specific("nssm:mordain", {"nssb:morentir"}, {"nssb:morentir"}, 0, 20, 90, 900, 1, -31000, .93)
	mobs:spawn_specific("nssm:morgut", {"nssb:morentir"}, {"nssb:morentir"}, 0, 20, 50, 500, 1, -31000, -93)
end

-- CAVES
mobs:spawn_specific("nssm:bloco", {"default:stone", "default:desert_stone"}, {"default:stone", "default:desert_stone"}, 0, 20, 30, 500, 3, -31000, -20)
mobs:spawn_specific("nssm:lava_titan", {"default:stone", "default:desert_stone"}, {"air"}, 0, 120, 12, 22000, 1, -31000, -100)
mobs:spawn_specific("nssm:stone_eater", {"default:stone", "default:desert_stone"}, {"default:stone", "default:desert_stone"}, 0, 20, 40, 700, 2, -31000, -20)
mobs:spawn_specific("nssm:signosigno", {"default:stone", "default:desert_stone"}, {"default:stone", "default:desert_stone"}, 0, 10, 20, 400, 2, -31000, -20)
mobs:spawn_specific("nssm:signosigno", {"bones:bones"}, {"air"}, 0, 15, 20, 5, 5, -31000, 31000)

-- SEA
mobs:spawn_specific("nssm:crab", {"default:sand"}, {"default:water_source"}, 0, 20, 60, 4000, 1, -31000, 31000)
mobs:spawn_specific("nssm:crocodile", {"default:sand","default:water_source"}, {"default:water_source"}, 0, 20, 100, 35000, 1, -31000, 31000)
mobs:spawn_specific("nssm:crocodile", {"default:sand","default:river_water_source"}, {"default:river_water_source"}, 0, 20, 60, 12000, 1, -31000, 31000)
mobs:spawn_specific("nssm:dolidrosaurus", {"default:water_source"}, {"default:water_source"}, 0, 20, 100, 35000, 1, -31000, -1)
mobs:spawn_specific("nssm:kraken", {"default:water_source"}, {"default:water_source"}, 0, 20, 400, 500000, 1, -31000, 0)
mobs:spawn_specific("nssm:octopus", {"default:water_source"}, {"default:water_source"}, 0, 20, 80, 38000, 1, -31000, 0)

-- DESERT
mobs:spawn_specific("nssm:sandworm", {"default:desert_sand", "default:desert_stone"}, {"air"}, 0, 20, 100, 28000, 1, -31000, 31000)
mobs:spawn_specific("nssm:giant_sandworm", {"default:desert_sand", "default:desert_stone"}, {"air"}, 0, 20, 400, 600000, 1, -31000, 31000)
mobs:spawn_specific("nssm:sand_bloco", {"default:desert_sand", "default:desert_stone"}, {"air"}, 0, 20, 90, 20000, 1, -31000, 31000)

-- SKY
mobs:spawn_specific("nssm:moonheron", {"air"}, {"air"}, 0, 10, 110, 950000, 1, 10, 180)
mobs:spawn_specific("nssm:night_master", {"air"}, {"air"}, 0, 7, 400, 4500000, 2, 10, 180)
mobs:spawn_specific("nssm:phoenix", {"air"}, {"air"}, 10, 20, 400, 10000000, 1, 10, 180)
mobs:spawn_specific("nssm:scrausics", {"air"}, {"air"}, 10, 20, 110, 950000, 1, 10, 180)

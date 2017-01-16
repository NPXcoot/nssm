-- Bombs defined using the nssbombs API
if minetest.get_modpath("nssbombs") then

    minetest.register_craft({
    	output = 'nssm:empty_evocation_bomb 10',
    	recipe = {
    		{'nssm:envious_soul_fragment', 'nssm:black_powder', 'nssm:envious_soul_fragment'},
    		{'nssm:black_powder', 'nssm:envious_soul_fragment', 'nssm:black_powder'},
    		{'nssm:envious_soul_fragment', 'nssm:black_powder', 'nssm:envious_soul_fragment'},
    	}
    })

    function nssm_register_throwegg(name, descr, num)
        nssbombs:register_throwitem("nssm:"..name.."_evocation_bomb", descr, {
            textures = "evocation_bomb.png^"..name.."_egg.png",
            recipe_number = num,
            recipe_type = "shapeless",
            recipe = {'nssm:empty_evocation_bomb', 'nssm:'..name},
            explosion = {
                shape = "add_entity",
                block = "nssm:"..name,
            }
        })
    end
    nssm_register_throwegg("duck","Duck Evocation Bomb", 4)
    nssm_register_throwegg ("bloco","Bloco Evocation Bomb", 3)
    nssm_register_throwegg ("enderduck","Enderduck Evocation Bomb", 2)
    nssm_register_throwegg ("flying_duck","Flying Duck Evocation Bomb", 3)
    nssm_register_throwegg ("swimming_duck","Swimming Duck Evocation Bomb", 3)
    nssm_register_throwegg ("duckking","Duckking Evocation Bomb", 1)
    nssm_register_throwegg ("spiderduck","Spiderduck Evocation Bomb", 2)


    nssbombs:register_throwitem("nssm:cobweb_bomb", "Cobweb Bomb", {
        textures = "cobweb_bomb.png",
        recipe_number = 8,
        recipe = {
    		{'nssm:silk_gland', 'nssm:black_powder', 'nssm:silk_gland'},
    		{'nssm:black_powder', 'nssm:black_powder', 'nssm:black_powder'},
    		{'nssm:silk_gland', 'nssm:black_powder', 'nssm:silk_gland'},
    	},
        explosion = {
            shape = "cube",
            radius = 1,
            block = "nssm:web",
            particles = true,
        },
    })

    if minetest.get_modpath("nssb") then
        nssbombs:register_throwitem("nssm:mantis_bomb", "Cubic Mantis Clay Shell Bomb", {
            textures = "mantis_bomb.png",
            recipe_number = 8,
            recipe = {
    			{'nssm:mantis_meat', 'nssm:black_powder', 'nssm:mantis_meat'},
    			{'nssm:black_powder', 'nssb:hardened_mantis_clay', 'nssm:black_powder'},
    			{'nssm:mantis_meat', 'nssm:black_powder', 'nssm:mantis_meat'},
    		},
            explosion = {
                shape = "cubic_shell",
                radius = 2,
                block = "nssb:hardened_mantis_clay",
                particles = true,
            },
        })

        nssbombs:register_throwitem("nssm:mornar_bomb", "Mornar Bomb", {
            textures = "mornar_bomb.png",
            recipe_number = 6,
            recipe = {
    			{'nssm:wrathful_soul_fragment', 'nssm:black_powder', 'nssm:wrathful_soul_fragment'},
    			{'nssm:black_powder', 'nssm:wrathful_soul_fragment', 'nssm:black_powder'},
    			{'nssm:wrathful_soul_fragment', 'nssm:black_powder', 'nssm:wrathful_soul_fragment'},
    		},
            hit_node = function(self,pos)
    			for dx = -1,1 do
    				for dy = 1,1 do
    					for dz = -1,1 do
    						local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
    						if not minetest.is_protected(pos1, "") or not minetest.get_item_group(minetest.get_node(pos1).name, "unbreakable") == 1 then
    							minetest.set_node(pos1, {name="nssb:mornar"})
    						end
    					end
    				end
    			end
    		end,
        })

        nssbombs:register_throwitem("nssm:cage_bomb", "Cage Bomb", {
            textures = "cage_bomb.png",
            recipe_number = 10,
            recipe = {
    			{'nssm:lustful_soul_fragment', 'nssm:black_powder', 'nssm:lustful_soul_fragment'},
    			{'nssm:black_powder', 'nssm:lustful_soul_fragment', 'nssm:black_powder'},
    			{'nssm:lustful_soul_fragment', 'nssm:black_powder', 'nssm:lustful_soul_fragment'},
    		},
            explosion = {
                shape = "cubic_shell",
                radius = 2,
                block = "nssb:morentir",
                particles = true,
            },
        })
    end

    nssbombs:register_throwitem("nssm:water_bomb", "Water Bomb", {
        textures = "water_bomb.png",
        recipe = {
    		{'bucket:bucket_water', 'nssm:black_powder', 'bucket:bucket_water'},
    		{'nssm:black_powder', 'nssm:tentacle_curly', 'nssm:black_powder'},
    		{'bucket:bucket_water', 'nssm:black_powder', 'bucket:bucket_water'},
    	},
        recipe_number = 6,
        explosion = {
            shape = "pool",
            radius = 2,
            block = "default:water_source",
            particles = false,
        }
    })

    nssbombs:register_throwitem("nssm:hole_bomb", "Hole Bomb", {
        textures = "hole_bomb.png",
        recipe_number = 10,
        recipe = {
    		{'nssm:black_powder', 'nssm:black_powder', 'nssm:black_powder'},
    		{'nssm:black_powder', 'nssm:digested_sand', 'nssm:black_powder'},
    		{'nssm:black_powder', 'nssm:black_powder', 'nssm:black_powder'},
    	},
        hit_node = function(self,pos)
            for dx = -1,1 do
                for dy = -10,0 do
                    for dz = -1,1 do
                        local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
                        if not minetest.is_protected(pos1, "") or not minetest.get_item_group(minetest.get_node(pos1).name, "unbreakable") == 1 then
                            minetest.set_node(pos1, {name="air"})
                        end
                    end
                end
            end
        end,
    })

    nssbombs:register_throwitem("nssm:food_bomb", "Food Bomb", {
        textures = "food_bomb.png",
        recipe_number = 8,
        recipe = {
    		{'nssm:gluttonous_soul_fragment', 'nssm:black_powder', 'nssm:gluttonous_soul_fragment'},
    		{'nssm:black_powder', 'nssm:gluttonous_soul_fragment', 'nssm:black_powder'},
    		{'nssm:gluttonous_soul_fragment', 'nssm:black_powder', 'nssm:gluttonous_soul_fragment'},
    	},
        hit_node = function(self,pos)
            for dx = -1,1 do
                for dy = -1,1 do
                    for dz = -1,1 do
                        local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
                        if not minetest.is_protected(pos1, "") or not minetest.get_item_group(minetest.get_node(pos1).name, "unbreakable") == 1 then
                            minetest.set_node(pos1, {name="air"})
    						minetest.add_item(pos1, "nssm:roasted_duck_legs")
                        end
                    end
                end
            end
        end,
    })

    nssbombs:register_throwitem("nssm:phoenix_fire_bomb", "Phoenix Fire Bomb", {
        textures = "phoenix_fire_bomb.png",
        recipe_number = 10,
        recipe = {
    		{'nssm:black_powder', 'nssm:black_powder', 'nssm:black_powder'},
    		{'nssm:black_powder', 'nssm:sun_feather', 'nssm:black_powder'},
    		{'nssm:black_powder', 'nssm:black_powder', 'nssm:black_powder'},
    	},
        hit_node = function(self,pos)
            for dx = -2,2 do
                for dy = 0,1 do
                    for dz = -2,2 do
                        local pos1 = {x = pos.x+dx, y=pos.y+dy, z=pos.z+dz}
                        if not minetest.is_protected(pos1, "") or not minetest.get_item_group(minetest.get_node(pos1).name, "unbreakable") == 1 then
                            minetest.set_node(pos1, {name="nssm:phoenix_fire"})
                        end
                    end
                end
            end
        end,
    })

    nssbombs:register_throwitem("nssm:kaboom_bomb", "Explosive Bomb", {
        textures = "kaboom_bomb.png",
        recipe_number = 3,
        recipe = {
    		{'nssm:black_powder', 'nssm:black_powder', 'nssm:black_powder'},
    		{'nssm:black_powder', 'nssm:black_powder', 'nssm:black_powder'},
    		{'nssm:black_powder', 'nssm:black_powder', 'nssm:black_powder'},
    	},
        hit_node = function(self,pos)
            local pos1 = {x = pos.x, y=pos.y, z=pos.z}
            if not minetest.is_protected(pos1, "") or not minetest.get_item_group(minetest.get_node(pos1).name, "unbreakable") == 1 then
                tnt.boom(pos1, {damage_radius=3,radius=2,ignore_protection=false})
            end
        end,
    })

    minetest.register_craft({
    	output = "nssbombs:teleport_bomb 10",
        recipe = {
            {'nssm:slothful_soul_fragment', 'nssm:black_powder', 'nssm:slothful_soul_fragment'},
            {'nssm:black_powder', 'nssm:slothful_soul_fragment', 'nssm:black_powder'},
            {'nssm:slothful_soul_fragment', 'nssm:black_powder', 'nssm:slothful_soul_fragment'},
        },
    })

    nssbombs:register_throwitem("nssm:boom_bomb", "Boom Bomb", {
        textures = "boom_bomb.png",
        recipe_number = 10,
        recipe = {
    		{'nssm:greedy_soul_fragment', 'nssm:black_powder', 'nssm:greedy_soul_fragment'},
    		{'nssm:black_powder', 'nssm:greedy_soul_fragment', 'nssm:black_powder'},
    		{'nssm:greedy_soul_fragment', 'nssm:black_powder', 'nssm:greedy_soul_fragment'},
    	},
        hit_node = function(self,pos)
            local pos1 = {x = pos.x, y=pos.y, z=pos.z}
            if not minetest.is_protected(pos1, "") or not minetest.get_item_group(minetest.get_node(pos1).name, "unbreakable") == 1 then
                tnt.boom(pos1, {damage_radius=4,radius=3,ignore_protection=false})
            end
        end,
    })

    nssbombs:register_throwitem("nssm:smoke_bomb", "Smoke Bomb", {
        textures = "smoke_bomb.png",
        recipe_number = 6,
        recipe = {
    		{'nssm:proud_soul_fragment', 'nssm:black_powder', 'nssm:proud_soul_fragment'},
    		{'nssm:black_powder', 'nssm:proud_soul_fragment', 'nssm:black_powder'},
    		{'nssm:proud_soul_fragment', 'nssm:black_powder', 'nssm:proud_soul_fragment'},
    	},
        hit_node = function(self,pos)
            local pos1 = {x = pos.x, y=pos.y, z=pos.z}
            minetest.add_particlespawner({
				amount = 6000,
				time = 20,
				minpos = {x=pos1.x-3, y=pos1.y+0.5, z=pos1.z-3},
				maxpos = {x=pos1.x+3, y=pos1.y+0.5, z=pos1.z+3},
				minvel = {x=0.2, y=0.2, z=0.2},
				maxvel = {x=0.4, y=0.8, z=0.4},
				minacc = {x=-0.2,y=0,z=-0.2},
				maxacc = {x=0.2,y=0.1,z=0.2},
				minexptime = 6,
				maxexptime = 8,
				minsize = 10,
				maxsize = 12,
				collisiondetection = false,
				vertical = false,
				texture = "tnt_smoke.png",
            })
        end,
    })

    nssbombs:register_throwitem("nssm:thick_web_bomb", "Thick Web Bomb", {
        textures = "thick_web_bomb.png",
        recipe_number = 12,
        recipe = {
    		{'nssm:super_silk_gland', 'nssm:black_powder', 'nssm:super_silk_gland'},
    		{'nssm:black_powder', 'nssm:black_powder', 'nssm:black_powder'},
    		{'nssm:super_silk_gland', 'nssm:black_powder', 'nssm:super_silk_gland'},
    	},
        hit_node = function(self,pos)
            local pos1 = {x = pos.x, y=pos.y+1, z=pos.z}
			local pos2 = {x = pos.x, y=pos.y+2, z=pos.z}
            if not minetest.is_protected(pos1, "") or not minetest.get_item_group(minetest.get_node(pos1).name, "unbreakable") == 1 then
				minetest.set_node(pos1, {name="nssm:thick_web"})
				minetest.set_node(pos2, {name="nssm:thick_web"})
            end
        end,
    })

    nssbombs:register_throwitem("nssm:poison_bomb", "Poison Bomb", {
        textures = "poison_bomb.png",
        recipe_number = 10,
        recipe = {
    		{'nssm:black_powder', 'nssm:black_powder', 'nssm:black_powder'},
    		{'nssm:black_powder', 'nssm:snake_scute', 'nssm:black_powder'},
    		{'nssm:black_powder', 'nssm:black_powder', 'nssm:black_powder'},
    	},
        explosion = {
            shape = "cube",
            radius = 1,
            block = "nssm:venomous_gas",
            particles = false,
        }
    })

    nssbombs:register_throwitem("nssm:stone_bomb", "Cobblestone Bomb", {
        textures = "stone_bomb.png",
        recipe_number = 6,
        recipe = {
    		{'default:stone', 'nssm:black_powder', 'default:stone'},
    		{'nssm:black_powder', 'nssm:black_powder', 'nssm:black_powder'},
    		{'default:stone', 'nssm:black_powder', 'default:stone'},
    	},
        explosion = {
            shape = "cube",
            radius = 1,
            block = "default:cobble",
            particles = false,
        }
    })
end

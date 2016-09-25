if minetest.get_modpath("3d_armor") then
--Armors
		local stats = {
			wolf = {name="Werewolf", armor=1, heal=0, use=10},
			whitewolf = {name="White Werewolf", armor=1, heal=0, use=10},
			bloco = {name="Bloco", armor=1, heal=0, use=10},
			croco = {name="Crocodile", armor=1, heal=0, use=10},
			ant = {name="Ant", armor=1, heal=0},
			ice = {name="Ice Teeth", armor=1, heal=0, use=10},
			felucco = {name="Felucco", armor=1, heal=0, use=10},
			manticore = {name="Manticore", armor=1, heal=0, use=10},
			duck = {name="Duck", armor=1, heal=0, use=10},
			black_duck = {name="Black Duck", armor=1, heal=0, use=10},
		}
		local materials = {
			wolf="nssm:wolf_fur",
			whitewolf="nssm:white_wolf_fur",
			bloco="nssm:bloco_skin",
			croco="nssm:crocodile_skin",
			ant="nssm:ant_hard_skin",
			ice="nssm:little_ice_tooth",
			felucco="nssm:felucco_fur",
			manticore="nssm:manticore_fur",
			duck="nssm:duck_feather",
			black_duck="nssm:black_duck_feather",
		}

		for k, v in pairs(stats) do
			minetest.register_tool("nssm:helmet_"..k, {
				description = v.name.." Helmet",
				inventory_image ="inv_helmet_"..k..".png",
				groups = {armor_head=math.floor(5*v.armor), armor_heal=v.heal, armor_use=v.use},
				wear = 0,
			})
			minetest.register_tool("nssm:chestplate_"..k, {
				description = v.name.." Chestplate",
				inventory_image ="inv_chestplate_"..k..".png",
				groups = {armor_torso=math.floor(8*v.armor), armor_heal=v.heal, armor_use=v.use},
				wear = 0,
			})
			minetest.register_tool("nssm:leggings_"..k, {
				description = v.name.." Leggings",
				inventory_image = "inv_leggings_"..k..".png",
				groups = {armor_legs=math.floor(7*v.armor), armor_heal=v.heal, armor_use=v.use},
				wear = 0,
			})
			minetest.register_tool("nssm:boots_"..k, {
				description = v.name.." Boots",
				inventory_image ="inv_boots_"..k..".png",
				groups = {armor_feet=math.floor(4*v.armor), armor_heal=v.heal, armor_use=v.use},
				wear = 0,
			})
		end

		for k, v in pairs(materials) do
			minetest.register_craft({
				output = "nssm:helmet_"..k,
				recipe = {
					{v, v, v},
					{v, "", v},
					{"", "", ""},
				},
			})
			minetest.register_craft({
				output = "nssm:chestplate_"..k,
				recipe = {
					{v, "", v},
					{v, v, v},
					{v, v, v},
				},
			})
			minetest.register_craft({
				output = "nssm:leggings_"..k,
				recipe = {
					{v, v, v},
					{v, "", v},
					{v, "", v},
				},
			})
			minetest.register_craft({
				output = "nssm:boots_"..k,
				recipe = {
					{v, "", v},
					{v, "", v},
				},
			})
		end
--shields
		if minetest.get_modpath("shields") then
		local stats = {
			crab = {name="Crab", armor=1, heal=0, use=10},
			ice ={name="Ice Teeth", armor=1, heal=0, use=10}
		}
		local materials = {
			crab="nssm:crab_carapace_fragment",
			ice="nssm:little_ice_tooth",
		}
			for k, v in pairs(stats) do
				minetest.register_tool("nssm:shield_"..k, {
					description = v.name.." Shield",
					inventory_image ="inv_shield_"..k..".png",
					groups = {armor_head=math.floor(5*v.armor), armor_heal=v.heal, armor_use=v.use},
					wear = 0,
				})

				local m = materials[k]
				minetest.register_craft({
					output = "nssm:shield_"..k,
					recipe = {
						{m, m, m},
						{m, m, m},
						{"", m, ""},
					},
				})
			end
		end
end

--Special objects (pumpking helmet, masticone helmet, crowned masticone helmet, crown,)
if minetest.get_modpath("3d_armor") then


local stats = {
			pumpking = {name="Pumpking Head", armor=1, heal=0, use=10},
			masticone ={name="Masticone Head", armor=1, heal=0, use=10},
			crown ={name="Dukking Crown", armor=1, heal=0, use=10},
			masticone_crowned ={name="Masticone Crowned Head", armor=1, heal=0, use=10},
			snake ={name="", armor=1, heal=0, use=10},
		}
		--[[local materials = {
			crab="nssm:crab_carapace_fragment",
			ice="nssm:little_ice_tooth",
		}]]
			for k, v in pairs(stats) do
				minetest.register_tool("nssm:helmet_"..k, {
					description = v.name.." ",
					inventory_image ="inv_helmet_"..k..".png",
					groups = {armor_shield=math.floor(5*v.armor), armor_heal=v.heal, armor_use=v.use},
					wear = 0,
				})

				minetest.register_tool("nssm:chestplate_snake", {
				description = "Snake Scute Chestplate",
				inventory_image ="inv_chestplate_snake.png",
				groups = {armor_torso=math.floor(8*v.armor), armor_heal=v.heal, armor_use=v.use},
				wear = 0,
				})
			end



		minetest.register_craft({
					output = "nssm:chestplate_snake",
					recipe = {
						{"default:iron_ingot", "", "default:iron_ingot"},
						{"default:iron_ingot", "nssm:snake_scute", "default:iron_ingot"},
						{"default:iron_ingot", "default:iron_ingot", "default:iron_ingot"},
					},
				})
		minetest.register_craft({
					output = "nssm:helmet_masticone",
					recipe = {
						{"nssm:masticone_skull_fragments", "nssm:masticone_skull_fragments", "nssm:masticone_skull_fragments"},
						{"nssm:masticone_skull_fragments", "nssm:masticone_skull_fragments", "nssm:masticone_skull_fragments"},
						{"nssm:masticone_skull_fragments", "nssm:masticone_skull_fragments", "nssm:masticone_skull_fragments"},
					},
				})
		minetest.register_craft({
					output = "nssm:helmet_masticone_crowned",
					recipe = {
						{"", "nssm:helmet_crown", ""},
						{"", "nssm:helmet_masticone", ""},
						{"", "", ""},
					},
				})

end

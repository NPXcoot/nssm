if minetest.get_modpath("3d_armor") then
	if minetest.get_modpath("nssm") then
		local stats = {
			wolf = {name="Werewolf", armor=1, heal=0, use=10, effect=mww},
			white_wolf = {name="Werewolf", armor=1, heal=0, use=10, effect=www},
			bloco = {name="Bloco", armor=1, heal=0, use=10, effect=bloc},
			croco = {name="Crocodile", armor=1, heal=0, use=10, effect=croc},
			ant = {name="", armor=1, heal=0, use=10, effect=bloc},
			manticore = {name="", armor=1, heal=0, use=10, effect=mant},
			--[[brass = { name="Brass", armor=1.8, heal=0, use=650 },
			cast = { name="Cast Iron", armor=2.5, heal=8, use=200 },
			carbon = { name="Carbon Steel", armor=2.7, heal=10, use=100 },
			stainless = { name="Stainless Steel", armor=2.7, heal=10, use=75 },]]
		}
		local mats = {
			wolf="nssm:wolf_fur",
			white_wolf="nssm:white_wolf_fur",
			bloco="nssm:bloco_skin",
			croco="nssm:crocodile_skin",
			ant="nssm:ant_esoskeleton",
			manticore="nssm:manticore_fur",
		}
		
		for k, v in pairs(stats) do
			minetest.register_tool("nssm:helmet_"..k, {
				description = v.name.." Helmet",
				inventory_image = "inv_helmet_"..k..".png",
				groups = {armor_head=math.floor(5*v.armor), armor_heal=v.heal, armor_use=v.use},
				wear = 0,
			})
			minetest.register_tool("nssm:chestplate_"..k, {
				description = v.name.." Chestplate",
				inventory_image = "inv_chestplate_"..k..".png",
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
				inventory_image = "inv_boots_"..k..".png",
				groups = {armor_feet=math.floor(4*v.armor), armor_heal=v.heal, armor_use=v.use},
				wear = 0,
			})
		end
		
		for k, v in pairs(mats) do
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

		if minetest.get_modpath("shields") then
		local stats = {
			crab = {name="Crab", armor=1, heal=0, use=10},
			ice_teeth ={name="Ice Teeth", armor=1, heal=0, use=10}
		}
		local mats = {
			crab="nssm:crab_carapace",
			ice_teeth="nssm:little_ice_tooth",
		}
			for a, b in pairs(stats) do
				minetest.register_tool("nssm:shield_"..a, {
					description = v.name.." Shield",
					inventory_image = "inv_shield_"..a..".png",
					groups = {armor_shield=math.floor(5*v.armor), armor_heal=v.heal, armor_use=v.use},
					wear = 0,
				})
				local m = mats[a]
				minetest.register_craft({
					output = "nssm:shield_"..a,
					recipe = {
						{m, m, m},
						{m, m, m},
						{"", m, ""},
					},
				})
			end
		end
	end
end

disk_VELOCITY=20
disk_shoot_disk=function (item, player, pointed_thing)
	if player:get_inventory():contains_item("main", "nssm:kienzan_hand") then
		local playerpos=player:getpos()
		local obj=minetest.env:add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, "nssm:kienzan_entity")
		local dir=player:get_look_dir()
		obj:setvelocity({x=dir.x*disk_VELOCITY, y=dir.y*disk_VELOCITY, z=dir.z*disk_VELOCITY})
	end
	return
end

minetest.register_tool("nssm:kienzan_hand", {
    description = "Kienzan",
	inventory_image = "kienzan_hand.png",
    stack_max = 1,
 --   not_in_creative_inventory=0,
	on_use = disk_shoot_disk,
})

kienzan_ENTITY={
	physical = false,
	textures = {"kienzan.png"},
	lastpos={},
	collisionbox = {0,0,0,0,0,0},
}

	kienzan_ENTITY.on_step =function (self, pos, node, dtime)
                local timer = 0
                    minetest.register_globalstep(function(dtime)
                        timer = timer + dtime;
            if timer > 10 then
                    self.object:remove()
                end
            end)
				local pos = self.object:getpos()
    local objs = minetest.env:get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2) 
                for k, obj in pairs(objs) do
                    if obj:is_player() then
                        return
                    else
                    obj:set_hp(obj:get_hp()-20)					
				    if obj:get_entity_name() ~= "nssm:kienzan_entity" then
						if obj:get_hp()<=0 then 
							obj:remove()
						end
					end						
				end
            end
					for dx=-1,1 do
					--	for dy=-1,1 do
							for dz=-1,1 do
								local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
								local t = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
								local n = minetest.env:get_node(p).name
								if n ~= "nssm:kienzan_entity"  then	
										minetest.env:set_node(t, {name="air"})
								end
							end
						end
                
					end

minetest.register_entity("nssm:kienzan_entity", kienzan_ENTITY)

minetest.register_craft({
	output = 'nssm:kienzan_hand',
	recipe = {
		{'', '', ''},
		{'nssm:great_energy_globe', 'nssm:great_energy_globe', 'nssm:great_energy_globe'},
		{'', '', ''},
	}
})

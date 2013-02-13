--  _______          _     _______
-- (_______)        | |   (_______)                                  _
--  _____ ___   ____| |  _ _____ ___   ____ ____  ____   ____   ____| |_
-- |  ___) _ \ / ___) | / )  ___) _ \ / ___) _  |/ _  ) |  _ \ / _  )  _)
-- | |  | |_| | |   | |< (| |  | |_| | |  ( ( | ( (/ / _| | | ( (/ /| |__
-- |_|   \___/|_|   |_| \_)_|   \___/|_|   \_|| |\____|_)_| |_|\____)\___)
--                                        (_____|
--
-- ######################################################################
--    		               LULZPACK | BLOCKFORGE 2#
-- ######################################################################
--
--
-- This project is granted under the zlib license.
-- You can modify or redistribute it under the zlib conditions.

minetest.register_node("lulzpack:death_chest", {
	description = "Chest",
	tiles = {"death_chest_top.png", "death_chest_top.png", "death_chest_side.png",
		"death_chest_side.png", "death_chest_side.png", "death_chest_front.png"},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Death Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
    on_dig = function(pos) minetest.env:remove_node(pos) return end
})

pwned=function(player, drops)
    if enable_time2pwn == false then return end
     pos=player:getpos()
     itempos={x=pos.x,y=pos.y+1,z=pos.z}
     local inv=player:get_inventory()
     if minetest.env:get_node(pos).name == 'air' then 
     minetest.env:add_node(pos, {name='lulzpack:death_chest'})
     local deathchest_meta=minetest.env:get_meta(pos)
     local chest_inv=deathchest_meta:get_inventory()
     items={}
     for i=1,inv:get_size("main") do
        items[i]=inv:get_stack("main", i)
     end
        for i=1,32 do
        item=items[i]
        item_stack=ItemStack(item)
        wear=item_stack:get_wear()
        count=item_stack:get_count()
        if count <= 99 then
            chest_inv:set_stack("main",i,""..item_stack:get_name().." "..count.." ")
            inv:set_stack("main", i, nil)
            for i=1,9 do inv:set_stack("craft", i,nil) end
            inv:set_stack("craftpreview", 1,nil)
        end
     end
     end
end


minetest.register_on_dieplayer(pwned)

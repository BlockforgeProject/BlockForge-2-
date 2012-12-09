--  _______          _     _______
-- (_______)        | |   (_______)                                  _
--  _____ ___   ____| |  _ _____ ___   ____ ____  ____   ____   ____| |_
-- |  ___) _ \ / ___) | / )  ___) _ \ / ___) _  |/ _  ) |  _ \ / _  )  _)
-- | |  | |_| | |   | |< (| |  | |_| | |  ( ( | ( (/ / _| | | ( (/ /| |__
-- |_|   \___/|_|   |_| \_)_|   \___/|_|   \_|| |\____|_)_| |_|\____)\___)
--                                        (_____|
--
-- ######################################################################
--			               LULZPACK | BLOCKFORGE 2#
-- ######################################################################
--
-- ~ Project's Site: http://blockforge.purelite.net
-- ~ Main Site: http://forkforge.net 
--
-- This project is granted under the zlib license.
-- You can modify or redistribute it under the zlib conditions.



minetest.register_node("lulzpack:quarry", {
    description = "Quarry",
	tiles = {"quarry_top.png","quarry_side.png",
		  "quarry_side.png","quarry_side.png",
		  "quarry_side.png","quarry_side.png"},
    drop = 'lulzpack:quarry',
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,2;]"..
			    "list[current_name;drill;3,3;3,1;]"..
                "label[1,3,drilltext]"..
                "list[current_name;Drills]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Quarry")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*3)
		inv:set_size("drill", 3)
        quarry_pos["q"..pos.x.."-"..pos.z] =1
	end,
	groups = {crumbly=2},
    digs=1,
    on_dig = function(pos) 
    quarry_pos["q"..pos.x.."-"..pos.z]=nil
    minetest.env:remove_node(pos)
    minetest.env:add_item(pos, {name="lulzpack:quarry"})
    end
})

minetest.register_node("lulzpack:quarrydiggerpole", {
	description = "Quarry pole",
	drawtype = "fencelike",
	tiles = {"quarrypole.png"},
	paramtype = "light",
    light_source = LIGHT_MAX-4,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {snappy=2,choppy=3,cracky=2},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("lulzpack:raffinery", {
	tiles = {"raffinery_top.png","bb_side.png",
		  "bb_side.png","bb_side.png",
		  "bb_side.png","bb_side.png"},
	description = "Refinery",
	is_ground_content = false,
	groups = {crumbly=2},
})

minetest.register_node("lulzpack:macerator", {
    description = "Macerator",
	tiles = {"macerator_top.png","bb_side.png",
		  "bb_side.png","bb_side.png",
		  "bb_side.png","bb_side.png"},
	inventory_image = {"macerator_top.png"},

	minetest.inventorycube("macerator_top.png"),
	is_ground_content = false,
	groups = {crumbly=2},
})

dofile(minetest.get_modpath("lulzpack") .. "/quarry.lua")
dofile(minetest.get_modpath("lulzpack") .. "/raffinery.lua")
dofile(minetest.get_modpath("lulzpack") .. "/macerator.lua")








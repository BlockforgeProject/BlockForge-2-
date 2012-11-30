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
	groups = {crumbly=2},
	digs=1,
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
    description = "Raffinery",
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







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



minetest.register_node("lulzpack:lamppole", {
	description = "Lamp pole",
	drawtype = "fencelike",
	tiles = {"if_lamppole1.png"},
	paramtype = "light",
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {snappy=1,choppy=2,cracky=2},
	sounds = default.node_sound_defaults(),
})



minetest.register_node("lulzpack:lamp", {
	tile_images = {"if_lamppole2.png","if_lamppole2.png",
		  "if_lamplight.png","if_lamplight.png",
		  "if_lamplight.png","if_lamplight.png"},
	paramtype = "light",
	light_source = LIGHT_MAX,
	is_ground_content = false,
	groups = {cracky=2},
	description = "Electric Lamp",
	sounds = default.node_sound_stone_defaults(),
})

dofile(minetest.get_modpath("lulzpack") .. "/wtflamp.lua")

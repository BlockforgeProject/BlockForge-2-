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

minetest.register_node("lulzpack:industrial_apple", {
	description = "Industrial Apple",
    visual_scale = 1.0,
	drawtype = "plantlike",
	tiles = {"industrial_apple.png"},
	inventory_image = "industrial_apple.png",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {fleshy=3,dig_immediate=3},
	on_use = minetest.item_eat(7),
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lulzpack:lyra_apple", {
	description = "Lyra Apple",
    visual_scale = 1.0,
	drawtype = "plantlike",
	tiles = {"lyra_apple.png"},
	inventory_image = "lyra_apple.png",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {fleshy=3,dig_immediate=3},
	on_use = minetest.item_eat(8),
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	output = 'lulzpack:industrial_apple',
	recipe = {
		{'', 'lulzpack:industrial_iron', ''},
		{'', 'default:apple', ''},
	}
})

minetest.register_craft({
	output = 'lulzpack:lyra_apple',
	recipe = {
		{'', 'lulzpack:lyra_ingot', ''},
		{'', 'default:apple', ''},
	}
})

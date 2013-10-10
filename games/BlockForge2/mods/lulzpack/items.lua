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



minetest.register_craftitem("lulzpack:controlpanel", {
	image = "if_controlpanel.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Control Panel"
})

minetest.register_craftitem("lulzpack:electrodrill", {
	image = "if_electrodrill.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Electro Drill"
})

minetest.register_craftitem("lulzpack:quarrydrill", {
	image = "quarrydrill.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Quarry Drill"
})

minetest.register_craftitem("lulzpack:intbattery", {
	image = "intbattery.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Interior battery"
})

minetest.register_craftitem("lulzpack:basic_ai", {
	image = "basic_ai.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Simple AI"
})

minetest.register_craftitem("lulzpack:basic_pilotsystem", {
	image = "basic_ps.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Basic Pilot System"
})

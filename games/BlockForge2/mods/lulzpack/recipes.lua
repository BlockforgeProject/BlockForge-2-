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




--RECIPES
minetest.register_craft({   
	output = 'lulzpack:electroblock 1',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'lulzpack:industrial_iron', 'lulzpack:industrial_iron', 'lulzpack:industrial_iron'},
		{'default:steel_ingot', 'lulzpack:industrial_iron', 'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'lulzpack:controlpanel 1',
	recipe = {
		{'lulzpack:industrial_iron', 'lulzpack:industrial_iron', 'lulzpack:industrial_iron'},
		{'lulzpack:industrial_iron', 'lulzpack:redyz_ingot', 'lulzpack:industrial_iron'},
	}
})


minetest.register_craft({
	output = 'lulzpack:basic_ai 1',
	recipe = {
		{'', 'lulzpack:intbattery', ''},
		{'', 'lulzpack:redyz_ingot', ''},
		{'lulzpack:redyz_ingot', 'lulzpack:controlpanel', 'lulzpack:redyz_ingot'},
	}
})


minetest.register_craft({
	output = 'lulzpack:electrodrill 3',
	recipe = {
		{'', 'lulzpack:industrial_iron', ''},
		{'lulzpack:industrial_iron', '', 'lulzpack:industrial_iron'},
		{'lulzpack:industrial_iron', '', 'lulzpack:industrial_iron'},
	}
})

minetest.register_craft({
	output = 'lulzpack:raffinery 1',
	recipe = {
		{'lulzpack:industrial_iron', 'lulzpack:electrodrill', 'lulzpack:industrial_iron'},
		{'lulzpack:industrial_iron', 'lulzpack:electroblock', 'lulzpack:industrial_iron'},
		{'lulzpack:redyz_ingot', 'lulzpack:controlpanel', 'lulzpack:redyz_ingot'},
	}
})

minetest.register_craft({
	output = 'lulzpack:quarrydrill 5',
	recipe = {
		{'', 'lulzpack:industrial_iron', ''},
		{'lulzpack:industrial_iron', 'lulzpack:electrodrill', 'lulzpack:industrial_iron'},
		{'', 'lulzpack:lyra_ingot', ''},
	}
})

minetest.register_craft({
	output = 'lulzpack:quarry 1',
	recipe = {
		{'', 'lulzpack:electrodrill', '' },
		{'lulzpack:electrodrill', 'lulzpack:electroblock', 'lulzpack:electrodrill'},
		{'', 'lulzpack:basic_ai', ''},

	}
})

minetest.register_craft({
	output = 'lulzpack:simple_miner',
	recipe = {
		{'', 'lulzpack:electrodrill', '' },
		{'lulzpack:electrodrill', 'lulzpack:electroblock', 'lulzpack:electrodrill'},
		{'', 'lulzpack:nyon_block', ''},

	}
})

minetest.register_craft({
	output = 'lulzpack:intbattery 1',
	recipe = {
		{'lulzpack:industrial_iron', 'lulzpack:industrial_iron', 'lulzpack:industrial_iron'},
		{'lulzpack:lyra_ingot', 'lulzpack:lyra_ingot', 'lulzpack:lyra_ingot'},
		{'lulzpack:industrial_iron', 'lulzpack:lyra_ingot', 'lulzpack:industrial_iron'},
	}
})

minetest.register_craft({
	output = 'lulzpack:macerator 1',
	recipe = {
		{'lulzpack:electrodrill', 'lulzpack:celis_ingot', 'lulzpack:electrodrill' },
		{'lulzpack:electrodrill', 'lulzpack:electroblock', 'lulzpack:electrodrill'},
		{'lulzpack:celis_ingot', 'lulzpack:controlpanel', 'lulzpack:celis_ingot'},

	}
})

minetest.register_craft({
	output = 'lulzpack:lamppole 2',
	recipe = {
		{'lulzpack:industrial_iron', '', 'lulzpack:industrial_iron'},
		{'lulzpack:industrial_iron', '', 'lulzpack:industrial_iron'},
	}
})

minetest.register_craft({
	output = 'lulzpack:lamp 3',
	recipe = {
		{'lulzpack:industrial_iron', 'lulzpack:industrial_iron', 'lulzpack:industrial_iron'},
		{'lulzpack:industrial_iron', 'default:furnace', 'lulzpack:industrial_iron'},
		{'lulzpack:lyra_lump', 'lulzpack:lyra_lump', 'lulzpack:lyra_lump'},
	}
})


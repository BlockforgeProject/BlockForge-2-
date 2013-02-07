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
	output = 'lulzpack:minimal_mining',
	recipe = {
		{'', '', '' },
		{'', 'lulzpack:electroblock', ''},
		{'', 'lulzpack:electrodrill', ''},

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

minetest.register_craft({
	output = 'lulzpack:raw_stone 2',
	recipe = {
		{'lulzpack:high_dirt', 'default:cobble', 'lulzpack:high_dirt'},
	}
})

minetest.register_craft({
	output = 'lulzpack:raw_stone 4',
	recipe = {
		{'lulzpack:high_dirt', 'default:stone', 'lulzpack:high_dirt'},
	}
})
minetest.register_craft({
	output = 'lulzpack:pick_lyra 1',
	recipe = {
		{'lulzpack:lyra_ingot', 'lulzpack:lyra_ingot', 'lulzpack:lyra_ingot'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
	output = 'lulzpack:pick_hybrid',
	recipe = {
		{'lulzpack:hybrid_plate', 'lulzpack:hybrid_plate', 'lulzpack:hybrid_plate'},
		{'', 'default:steel_ingot', ''},
		{'', 'default:steel_ingot', ''},
	}
})
minetest.register_craft({
	output = 'lulzpack:axe_lyra 1',
	recipe = {
		{'lulzpack:lyra_ingot', 'lulzpack:lyra_ingot', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
	output = 'lulzpack:sword_lyra 1',
	recipe = {
		{'', 'lulzpack:lyra_ingot', ''},
		{'', 'lulzpack:lyra_ingot', ''},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
	output = 'lulzpack:sword_celis 1',
	recipe = {
		{'', 'lulzpack:celis_ingot', ''},
		{'', 'lulzpack:celis_ingot', ''},
		{'', 'default:steel_ingot', ''},
	}
})
minetest.register_craft({
	output = 'lulzpack:shovel_lyra 1',
	recipe = {
		{'', 'lulzpack:lyra_ingot', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
	output = 'lulzpack:lyra_torch 6',
	recipe = {
		{'lulzpack:lyra_lump','default:coal_lump','lulzpack:lyra_lump'},
		{'','default:stick',''},
		{'','default:stick',''},
	}
})
minetest.register_craft({
	output = 'lulzpack:lyra_block 1',
	recipe = {
		{'lulzpack:lyra_ingot','lulzpack:lyra_ingot','lulzpack:lyra_ingot'},
		{'lulzpack:lyra_ingot','lulzpack:lyra_ingot','lulzpack:lyra_ingot'},
		{'lulzpack:lyra_ingot','lulzpack:lyra_ingot','lulzpack:lyra_ingot'},
	}
})

minetest.register_craft({
	output = 'lulzpack:corrupted_bretonium_block',
	recipe = {
		{'lulzpack:corrupted_bretonium_ingot','lulzpack:corrupted_bretonium_ingot','lulzpack:corrupted_bretonium_ingot'},
		{'lulzpack:corrupted_bretonium_ingot','lulzpack:corrupted_bretonium_ingot','lulzpack:corrupted_bretonium_ingot'},
		{'lulzpack:corrupted_bretonium_ingot','lulzpack:corrupted_bretonium_ingot','lulzpack:corrupted_bretonium_ingot'},
	}
})
minetest.register_craft({
	output = 'lulzpack:redyz_block 1',
	recipe = {
		{'lulzpack:redyz_ingot','lulzpack:redyz_ingot','lulzpack:redyz_ingot'},
		{'lulzpack:redyz_ingot','lulzpack:redyz_ingot','lulzpack:redyz_ingot'},
		{'lulzpack:redyz_ingot','lulzpack:redyz_ingot','lulzpack:redyz_ingot'},
	}
})
minetest.register_craft({
	output = 'lulzpack:celis_block 1',
	recipe = {
		{'lulzpack:celis_ingot','lulzpack:celis_ingot','lulzpack:celis_ingot'},
		{'lulzpack:celis_ingot','lulzpack:celis_ingot','lulzpack:celis_ingot'},
		{'lulzpack:celis_ingot','lulzpack:celis_ingot','lulzpack:celis_ingot'},
	}
})
minetest.register_craft({
	output = 'lulzpack:empty_can 12',
	recipe = {
		{'','lulzpack:industrial_iron',''},
		{'lulzpack:industrial_iron','','lulzpack:industrial_iron'},
		{'','lulzpack:industrial_iron',''},
	}
})

minetest.register_craft({
	output = 'lulzpack:terxbet_can 4',
	recipe = {
        {'lulzpack:empty_can','','lulzpack:empty_can'},
		{'lulzpack:obsidian_bucket_meltedununterx','','lulzpack:obsidian_bucket_meltedununbet'},
        {'lulzpack:empty_can','','lulzpack:empty_can'},
	}
})

minetest.register_craft({
	output = 'lulzpack:senbet_can 4',
	recipe = {
        {'lulzpack:empty_can','','lulzpack:empty_can'},
		{'lulzpack:obsidian_bucket_meltedununsen','','lulzpack:obsidian_bucket_meltedununbet'},
        {'lulzpack:empty_can','','lulzpack:empty_can'},
	}
})

minetest.register_craft({
	output = 'lulzpack:bretonbet_can 4',
	recipe = {
        {'lulzpack:empty_can','','lulzpack:empty_can'},
		{'lulzpack:bretonium_block','','lulzpack:obsidian_bucket_meltedununbet'},
        {'lulzpack:empty_can','','lulzpack:empty_can'},
	}
})

minetest.register_craft({
	output = 'lulzpack:celis_ingot 9',
	recipe = {
		{'lulzpack:celis_block'},
	}
})
minetest.register_craft({
	output = 'lulzpack:lyra_ingot 9',
	recipe = {
		{'lulzpack:lyra_block'},
	}
})
minetest.register_craft({
	output = 'lulzpack:redyz_ingot 9',
	recipe = {
		{'lulzpack:redyz_block'},
	}
})
minetest.register_craft({
	output = 'lulzpack:iron_plate 6',
	recipe = {
		{'lulzpack:obsidian_bucket_meltediron'},
	}
})
minetest.register_craft({
	output = 'lulzpack:hybrid_plate 6',
	recipe = {
		{'lulzpack:obsidian_bucket_meltedlyra','lulzpack:obsidian_bucket_meltedcelis'},
	}
})
--Glasses
minetest.register_craft({
	output = 'lulzpack:ironglass 3',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:steel_ingot', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'lulzpack:redyzglass 3',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'lulzpack:redyz_ingot', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'lulzpack:elementalglass 3',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'lulzpack:hotstone', 'default:glass'},
	}
})
minetest.register_craft({
	output = 'lulzpack:meseglass 3',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:mese', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'lulzpack:dintled_steelblock 2',
	recipe = {
		{'lulzpack:obsidian_bucket_meltediron', 'lulzpack:hotstone'},
	}
})

minetest.register_craft({
	output = 'lulzpack:dintled_celisblock 2',
	recipe = {
		{'lulzpack:obsidian_bucket_meltedcelis', 'lulzpack:hotstone'},
	}
})

minetest.register_craft({
	output = 'lulzpack:compressed_cobble 2',
	recipe = {
		{'default:cobble', 'default:cobble', ''},
		{'default:cobble', 'default:cobble', ''},
	}
})

minetest.register_craft({
	output = 'lulzpack:compressed_gravel 2',
	recipe = {
		{'default:gravel', 'default:gravel', ''},
		{'default:gravel', 'default:gravel', ''},
	}
})
minetest.register_craft({
	output = 'lulzpack:hotstone_cobble 12',
	recipe = {
		{'lulzpack:compressed_cobble', 'lulzpack:compressed_cobble', 'lulzpack:compressed_cobble'},
		{'lulzpack:compressed_cobble', 'lulzpack:hotstone', 'lulzpack:compressed_cobble'},
		{'lulzpack:compressed_cobble', 'lulzpack:compressed_cobble', 'lulzpack:compressed_cobble'},
	}
})
	
minetest.register_craft({
	output = 'lulzpack:hotstone_obsidian 12',
	recipe = {
		{'lulzpack:obsidian', 'lulzpack:obsidian', 'lulzpack:obsidian'},
		{'lulzpack:obsidian', 'lulzpack:hotstone', 'lulzpack:obsidian'},
		{'lulzpack:obsidian', 'lulzpack:obsidian', 'lulzpack:obsidian'},
	}
})

minetest.register_craft({
	output = 'lulzpack:hotstone_gravel 12',
	recipe = {
		{'lulzpack:compressed_gravel', 'lulzpack:compressed_gravel', 'lulzpack:compressed_gravel'},
		{'lulzpack:compressed_gravel', 'lulzpack:hotstone', 'lulzpack:compressed_gravel'},
		{'lulzpack:compressed_gravel', 'lulzpack:compressed_gravel', 'lulzpack:compressed_gravel'},
	}
})

--Cooking recipes
minetest.register_craft({
	type = "cooking",
	output = "lulzpack:high_dirt",
	recipe = "default:dirt",
})

minetest.register_craft({
	type = "cooking",
	output = "lulzpack:high_dirt",
	recipe = "lulzpack:cold_dirt",
})

minetest.register_craft({
	type = "cooking",
	output = "lulzpack:lyra_ingot",
	recipe = "lulzpack:lyra_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "lulzpack:redyz_ingot",
	recipe = "lulzpack:redyz_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "lulzpack:celis_ingot",
	recipe = "lulzpack:celis_lump",
})


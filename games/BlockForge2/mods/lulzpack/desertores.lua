minetest.register_node("lulzpack:desertstone_with_redyz", {
	description = "Poor Redyz Ore",
	tiles = {"default_desert_stone.png^redyz_mineral.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'lulzpack:poor_redyz_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("lulzpack:poor_redyz_lump", {
	description = "Poor Redyz Lump",
	inventory_image = "poor_redyz_lump.png",
})

minetest.register_craft({
	output = 'lulzpack:redyz_lump 3',
	recipe = {
		{'lulzpack:poor_redyz_lump','lulzpack:poor_redyz_lump','lulzpack:poor_redyz_lump'},
		{'lulzpack:poor_redyz_lump','lulzpack:poor_redyz_lump','lulzpack:poor_redyz_lump'},
		{'lulzpack:poor_redyz_lump','lulzpack:poor_redyz_lump','lulzpack:poor_redyz_lump'},
	}
})

register_lulzpack_ore("cryoas","Cryoas")

minetest.register_on_generated(function(minp, maxp, seed)
	generate_ore("lulzpack:desertstone_with_redyz", "default:desert_stone", minp, maxp, seed+6, 1/24/24/24, 12,256, -300, 300)
	generate_ore("lulzpack:stone_with_cryoas", "default:desert_sand", minp, maxp, seed+6, 1/24/24/24, 12,64, -300, 300)
end)

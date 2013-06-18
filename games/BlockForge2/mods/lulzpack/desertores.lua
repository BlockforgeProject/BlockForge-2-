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
registerTools("cryoas","lulzpack:cryoas_ingot","Cryoas",
{
	fleshy={times={[1]=2.30, [2]=1.30, [3]=0.80}, uses=30, maxlevel=1},
	snappy={times={[2]=0.95, [3]=0.75}, uses=50, maxlevel=1},
	choppy={times={[3]=1.20}, uses=50, maxlevel=0}
},
--
{
	choppy={times={[1]=2.50, [2]=1.70, [3]=1.30}, uses=30, maxlevel=1},
	fleshy={times={[2]=1.10, [3]=0.80}, uses=40, maxlevel=1}
},
--
{
	crumbly={times={[1]=1.50, [2]=0.80, [3]=0.70}, uses=30, maxlevel=1}
},
--
{
	cracky={times={[1]=4.00, [2]=1.50, [3]=1.00}, uses=30, maxlevel=1},
}
--
)

register_lulzpack_ore("desert_beagle","Desert Beagle")

minetest.register_on_generated(function(minp, maxp, seed)
	generate_ore("lulzpack:desertstone_with_redyz", "default:desert_stone", minp, maxp, seed+6, 1/24/24/24, 12,256, -300, 300)
	generate_ore("lulzpack:stone_with_cryoas", "default:desert_sand", minp, maxp, seed+6, 1/24/24/24, 12,64, -300, 300)
    generate_ore("lulzpack:stone_with_desert_beagle", "default:desert_stone", minp, maxp, seed+6, 1/24/24/24, 12, 32, -300, 300)
end)

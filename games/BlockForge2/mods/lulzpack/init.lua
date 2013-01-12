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


--Main file of the LulzPack.Such a casual name.
local function include(filename) dofile(minetest.get_modpath("lulzpack") .."/"..filename ..".lua") end

include("helpers") --Including Helpers

minetest.register_node("lulzpack:cold_dirt", {
	description = "cold Dirt",
	tiles ={"colddirt.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	drop = 'lulzpack:cold_dirt',
	legacy_mineral = false,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lulzpack:high_dirt", {
	description = "High Dirt",
	light_source = LIGHT_MAX-5,
	tiles ={"highdirt.png"},
	is_ground_content = true,
	groups = {crumbly=2},
	drop = 'lulzpack:cold_dirt',
	legacy_mineral = false,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lulzpack:raw_stone", {
	description = "Raw Stone",
	tiles ={"rawstone.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = 'default:dirt',
	legacy_mineral = false,
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("lulzpack:lava_block", {
	description = "Solidified Lava",
	tiles ={"lava_block.png"},
	is_ground_content = true,
	groups = {cracky=1},
    paramtype="light",
    light_source = LIGHT_MAX-6,
	legacy_mineral = false,
    on_dig=function(pos,node)
        minetest.env:add_node(pos, { name = "default:lava_source" } ); 
    end, 
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("lulzpack:water_block", {
	description = "Solidified Water",
	tiles ={"water_block.png"},
	is_ground_content = true,
	groups = {cracky=1},
	legacy_mineral = false,
    on_dig=function(pos,node)
        minetest.env:add_node(pos, { name = "default:water_source" } ); 
    end, 
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("lulzpack:hotstone", {
	description = "Hot Stone",
	tiles ={"hotstone.png"},
	is_ground_content = true,
	groups = {hotstone=1},
	legacy_mineral = false,
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("lulzpack:dintled_steelblock", {
	description = "Dintled Steel Block",
	tiles ={"dintled_steelblock.png"},
	is_ground_content = true,
	groups = {dintled=1},
	legacy_mineral = false,
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("lulzpack:dintled_celisblock", {
	description = "Dintled Celis Block",
	tiles ={"dintled_celisblock.png"},
	is_ground_content = true,
	groups = {dintled=2},
	legacy_mineral = false,
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("lulzpack:stone_with_lyra", {
	description = "Lyra Ore",
	tiles = {"default_stone.png^lyra_mineral.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'lulzpack:lyra_lump',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("lulzpack:lyra_block", {
	description = "Lyra Block",
	tiles = {"lyra_block.png"},
	groups = {cracky=1},
	drop = 'lulzpack:lyra_block',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("lulzpack:stone_with_redyz", {
	description = "Redyz Ore",
	tiles = {"default_stone.png^redyz_mineral.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'lulzpack:redyz_lump',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("lulzpack:redyz_block", {
	description = "Redyz Block",
	tiles = {"redyz_block.png"},
	groups = {cracky=1},
	drop = 'lulzpack:redyz_block',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("lulzpack:stone_with_celis", {
	description = "Celis Ore",
	tiles = {"default_stone.png^celis_mineral.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'lulzpack:celis_lump',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("lulzpack:celis_block", {
	description = "Celis Block",
	tiles = {"celis_block.png"},
	groups = {cracky=1},
	drop = 'lulzpack:celis_block',
	sounds = default.node_sound_stone_defaults(),
})
--Items
minetest.register_craftitem("lulzpack:lyra_lump", {
	description = "Lyra Lump",
	inventory_image = "lyra_lump.png",
})
minetest.register_craftitem("lulzpack:lyra_ingot", {
	description = "Lyra Ingot",
	inventory_image = "lyra_ingot.png",
})
------------------------------------------------------------------------
minetest.register_craftitem("lulzpack:celis_lump", {
	description = "Celis Lump",
	inventory_image = "celis_lump.png",
})
minetest.register_craftitem("lulzpack:celis_ingot", {
	description = "Celis Ingot",
	inventory_image = "celis_ingot.png",
})
------------------------------------------------------------------------
minetest.register_craftitem("lulzpack:redyz_lump", {
	description = "Redyz Lump",
	inventory_image = "redyz_lump.png",
})
minetest.register_craftitem("lulzpack:redyz_ingot", {
	description = "Redyz Ingot",
	inventory_image = "redyz_ingot.png",
})
------------------------------------------------------------------------
minetest.register_craftitem("lulzpack:iron_plate", {
	description = "Iron Plate",
	inventory_image = "ironplate.png",
})
------------------------------------------------------------------------
minetest.register_craftitem("lulzpack:obsidian_plate", {
	description = "Obsidian Plate",
	inventory_image = "obsidianplate.png",
})

--Glasses
minetest.register_node("lulzpack:ironglass", {
    tiles = {"iron_glass.png"},
    description = "Iron glass",
    drawtype = "glasslike",
    sunlight_propagates = true,
    is_ground_content = true,
    paramtype = "light",
    groups = {forceglass=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lulzpack:redyzglass", {
    tiles = {"redyz_glass.png"},
    description = "Redyz glass",
    drawtype = "glasslike",
    sunlight_propagates = true,
    is_ground_content = true,
    paramtype = "light",
    groups = {forceglass=2},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lulzpack:meseglass", {
    tiles = {"mese_glass.png"},
    description = "Mese glass",
    drawtype = "glasslike",
    sunlight_propagates = true,
    is_ground_content = true,
    paramtype = "light",
    groups = {forceglass=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lulzpack:elementalglass", {
    tiles = {"elemental_glass.png"},
    description = "Elemental glass",
    drawtype = "glasslike",
    sunlight_propagates = true,
    is_ground_content = true,    
    paramtype = "light",
    groups = {forceglass=4},
	sounds = default.node_sound_glass_defaults(),
})
--Torches
minetest.register_node("lulzpack:lyra_torch", {
	description = "Lyra Torch",
	drawtype = "torchlike",
	tiles = {
		{name="lyra_torch_anim3.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="lyra_torch_anim2.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="lyra_torch_anim1.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	},
	inventory_image = "lyra_torch_floor.png",
	wield_image = "lyra_torch_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = LIGHT_MAX+5,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {choppy=2,dig_immediate=3,flammable=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})
--Weapons
minetest.register_tool("lulzpack:sword_lyra", {
	description = "Lyra Sword",
	inventory_image = "lyra_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[1]=2.00, [2]=1.00, [3]=0.40}, uses=30, maxlevel=1},
			snappy={times={[2]=0.65, [3]=0.35}, uses=50, maxlevel=1},
			choppy={times={[3]=0.80}, uses=50, maxlevel=0}
		}
	}
})
minetest.register_tool("lulzpack:sword_celis", {
	description = "Celis Sword",
	inventory_image = "celis_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[1]=2.70, [2]=1.20, [3]=0.60}, uses=30, maxlevel=1},
			snappy={times={[2]=0.50, [3]=0.30}, uses=50, maxlevel=1},
			choppy={times={[3]=0.70}, uses=50, maxlevel=0}
		}
	}
})
minetest.register_tool("lulzpack:axe_lyra", {
	description = "Steel Axe",
	inventory_image = "lyra_axe.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.30, [2]=1.50, [3]=1.00}, uses=30, maxlevel=1},
			fleshy={times={[2]=0.80, [3]=0.60}, uses=40, maxlevel=1}
		}
	},
})
minetest.register_tool("lulzpack:shovel_lyra", {
	description = "Lyra Shovel",
	inventory_image = "lyra_shovel.png",
	wield_image = "lyra_shovel.png^[transformR45",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.30, [2]=0.60, [3]=0.70}, uses=30, maxlevel=1}
		}
	},
})
minetest.register_tool("lulzpack:pick_lyra", {
	description = "Lyra Pickaxe",
	inventory_image = "lyra_pick.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=3.70, [2]=1.40, [3]=0.80}, uses=30, maxlevel=1},
            forceglass={times={[1]=4.00, [2]=4.30, [3]=5.60, [4]=7.00},uses=25, maxlevel=1},
            obs={times={[1]=2.50},uses=25,maxlevel=1},
            hotstone={times={[1]=5.00},uses=10,maxlevel=1},
		}
	},
})

minetest.register_tool("lulzpack:pick_hybrid", {
	description = "Hybrid Pickaxe",
	inventory_image = "hybrid_pick.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=3.00, [2]=1.00, [3]=0.60}, uses=40, maxlevel=3},
            forceglass={times={[1]=3.50, [2]=4.10, [3]=5.20, [4]=5.00},uses=30, maxlevel=1},
            obs={times={[1]=2.00,[2]=7.50},uses=25,maxlevel=1},
            hotstone={times={[1]=4.00},uses=20,maxlevel=1},
            dintled={times={[1]=7.00,[2]=10.00},uses=15,maxlevel=1},
		}
	},
})
--Craftings
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
	output = 'lulzpack:pick_hybrid 1',
	recipe = {
		{'lulzpack:lyra_ingot', 'lulzpack:celis_ingot', 'lulzpack:lyra_ingot'},
		{'lulzpack:celis_ingot', 'default:steel_ingot', 'lulzpack:celis_ingot'},
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
	output = 'default:steel_ingot 3',
	recipe = {
		{'lulzpack:iron_plate','','lulzpack:iron_plate'},
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
--Simple ores
register_lulzpack_ore("nyon","Nyon")
--Ore Generations
minetest.register_on_generated(function(minp, maxp, seed)
	generate_ore("lulzpack:stone_with_lyra", "default:stone", minp, maxp, seed+6, 1/24/24/12, 6,32, -31000, -64)
	generate_ore("lulzpack:stone_with_redyz", "default:stone", minp, maxp, seed+6, 1/24/24/12, 6,23, -31000, 0)
	generate_ore("lulzpack:stone_with_celis", "default:stone", minp, maxp, seed+6, 1/24/24/12, 6, 64, -31000, -120)
	generate_ore("lulzpack:stone_with_nyon", "default:stone", minp, maxp, seed+0, 1/24/24/24, 12, 64, -31000, 120)
end)

include("items")
include("block")
include("furnacerecipes")
include("lamps")
include("machines")
include("recipes")
include("materials")
--include("guns") --Guns are actually bugged,i'll fix them later
include("abms")
include("desertores")
include("furnaces")
include("time2pwn")
include("drop")
include("wires")
include("smithery")
include("liquids")
--include("craftingtables")
include("recharger")
include("electrotools")
--include("explosives")
include("foods")

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
	description = "Solidified Lava",
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
	groups = {cracky=4},
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
			fleshy={times={[1]=2.00, [2]=1.00, [3]=0.40}, uses=30, maxlevel=2},
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
			fleshy={times={[1]=1.70, [2]=0.80, [3]=0.20}, uses=30, maxlevel=2},
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
			choppy={times={[1]=2.30, [2]=1.50, [3]=1.00}, uses=30, maxlevel=2},
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
			crumbly={times={[1]=1.30, [2]=0.60, [3]=0.70}, uses=30, maxlevel=2}
		}
	},
})
minetest.register_tool("lulzpack:pick_lyra", {
	description = "Lyra Pickaxe",
	inventory_image = "lyra_pick.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=3.70, [2]=1.40, [3]=0.80, [4]=7.50}, uses=30, maxlevel=4},
            forceglass={times={[1]=4.00, [2]=4.30, [3]=5.60, [4]=7.00},uses=25, maxlevel=4}
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
--Ore Generations

local function generate_ore(name, wherein, minp, maxp, seed, chunks_per_volume, chunk_size, ore_per_chunk, height_min, height_max)
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x-minp.x+1)*(y_max-y_min+1)*(maxp.z-minp.z+1)
	local pr = PseudoRandom(seed)
	local num_chunks = math.floor(chunks_per_volume * volume)
	local inverse_chance = math.floor(chunk_size*chunk_size*chunk_size / ore_per_chunk)
	--print("generate_ore num_chunks: "..dump(num_chunks))
	for i=1,num_chunks do
		local y0 = pr:next(y_min, y_max-chunk_size+1)
		if y0 >= height_min and y0 <= height_max then
			local x0 = pr:next(minp.x, maxp.x-chunk_size+1)
			local z0 = pr:next(minp.z, maxp.z-chunk_size+1)
			local p0 = {x=x0, y=y0, z=z0}
			for x1=0,chunk_size-1 do
			for y1=0,chunk_size-1 do
			for z1=0,chunk_size-1 do
				if pr:next(1,inverse_chance) == 1 then
					local x2 = x0+x1
					local y2 = y0+y1
					local z2 = z0+z1
					local p2 = {x=x2, y=y2, z=z2}
					if minetest.env:get_node(p2).name == wherein then
						minetest.env:set_node(p2, {name=name})
					end
				end
			end
			end
			end
		end
	end
	--print("generate_ore done")
end

minetest.register_on_generated(function(minp, maxp, seed)
	generate_ore("lulzpack:stone_with_lyra", "default:stone", minp, maxp, seed+6, 1/24/24/12, 6,32, -31000, -64)
end)

minetest.register_on_generated(function(minp, maxp, seed)
	generate_ore("lulzpack:stone_with_redyz", "default:stone", minp, maxp, seed+6, 1/24/24/12, 6,23, -31000, 0)
end)

minetest.register_on_generated(function(minp, maxp, seed)
	generate_ore("lulzpack:stone_with_celis", "default:stone", minp, maxp, seed+6, 1/24/24/12, 6, 64, -31000, -120)
end)

dofile(minetest.get_modpath("lulzpack") .. "/items.lua")
dofile(minetest.get_modpath("lulzpack") .. "/block.lua")
dofile(minetest.get_modpath("lulzpack") .. "/furnacerecipes.lua")
dofile(minetest.get_modpath("lulzpack") .. "/lamps.lua")
dofile(minetest.get_modpath("lulzpack") .. "/machines.lua")
dofile(minetest.get_modpath("lulzpack") .. "/recipes.lua")
dofile(minetest.get_modpath("lulzpack") .. "/materials.lua")
dofile(minetest.get_modpath("lulzpack") .. "/guns.lua")
dofile(minetest.get_modpath("lulzpack") .. "/abms.lua")
dofile(minetest.get_modpath("lulzpack") .. "/desertores.lua")
dofile(minetest.get_modpath("lulzpack") .. "/furnaces.lua")
dofile(minetest.get_modpath("lulzpack") .. "/time2pwn.lua")
dofile(minetest.get_modpath("lulzpack") .. "/drop.lua")
dofile(minetest.get_modpath("lulzpack") .. "/wires.lua")

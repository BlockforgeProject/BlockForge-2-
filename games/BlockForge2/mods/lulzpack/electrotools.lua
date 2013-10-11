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

minetest.register_tool("lulzpack:chainsaw_lyra", {
	description = "Lyra Chainsaw",
	inventory_image = "lyra_chainsaw.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.80, [2]=0.50, [3]=0.20}, uses=150, maxlevel=1},
			fleshy={times={[1]=0.40, [2]=0.60, [3]=0.40}, uses=60, maxlevel=1},
			snappy={times={[1]=0.10, [2]=0.05, [3]=0.02}, uses=150, maxlevel=1}
		},
        damage_groups={fleshy=8},
	},
})

minetest.register_tool("lulzpack:chainsaw_celis", {
	description = "Celis Chainsaw",
	inventory_image = "celis_chainsaw.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.50, [2]=0.20, [3]=0.10}, uses=170, maxlevel=1},
			fleshy={times={[1]=0.30, [2]=0.20, [3]=0.08}, uses=60, maxlevel=1},
			snappy={times={[1]=0.05, [2]=0.02, [3]=0.01}, uses=170, maxlevel=1}
		},
        damage_groups={fleshy=9},
	},
})

minetest.register_tool("lulzpack:chainsaw_nyon", {
	description = "Nyon Chainsaw",
	inventory_image = "nyon_chainsaw.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.30, [2]=0.10, [3]=0.05}, uses=210, maxlevel=1},
			fleshy={times={[1]=0.50, [2]=0.30, [3]=0.15}, uses=80, maxlevel=1},
			snappy={times={[1]=0.02, [2]=0.01, [3]=0.01}, uses=210, maxlevel=1}
		},
        damage_groups={fleshy=13},
	},
})
--Electro FlintNSteel
minetest.register_tool("lulzpack:electro_fns", {
	description = "Electro Flint 'n' Steel",
	inventory_image = "electro_fns.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=3.00, [2]=2.90, [3]=1.00}, uses=210, maxlevel=1}
		},
	},
})

--Electro augers

minetest.register_tool("lulzpack:electroauger_lyra", {
	description = "Lyra Electro Auger",
	inventory_image = "lyra_electroauger.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.20, [2]=0.80, [3]=0.60}, uses=100, maxlevel=1},
			fleshy={times={[1]=1.20, [2]=1.00, [3]=0.90}, uses=60, maxlevel=1},
			cracky={times={[1]=0.40, [2]=0.20, [3]=0.10}, uses=250, maxlevel=1},
			crumbly={times={[1]=1.10, [2]=0.90, [3]=0.70}, uses=260, maxlevel=1},
		},
        damage_groups={fleshy=3},
	},
})

minetest.register_tool("lulzpack:electroauger_celis", {
	description = "Celis Electro Auger",
	inventory_image = "celis_electroauger.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.20, [2]=0.80, [3]=0.60}, uses=100, maxlevel=1},
			fleshy={times={[1]=1.20, [2]=1.00, [3]=0.90}, uses=60, maxlevel=1},
			cracky={times={[1]=0.30, [2]=0.15, [3]=0.08}, uses=280, maxlevel=1},
			crumbly={times={[1]=1.10, [2]=0.90, [3]=0.70}, uses=260, maxlevel=1},
		},
        damage_groups={fleshy=4},
	},
})

minetest.register_tool("lulzpack:electroauger_nyon", {
	description = "Nyon Electro Auger",
	inventory_image = "nyon_electroauger.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.20, [2]=0.80, [3]=0.60}, uses=100, maxlevel=1},
			fleshy={times={[1]=1.20, [2]=1.00, [3]=0.90}, uses=60, maxlevel=1},
			crumbly={times={[1]=0.70, [2]=0.50, [3]=0.25}, uses=260, maxlevel=1},
			cracky={times={[1]=0.10, [2]=0.07, [3]=0.05}, uses=370, maxlevel=1},
            forceglass={times={[1]=3.00, [2]=4.00, [3]=4.80, [4]=4.70},uses=60, maxlevel=1},
            obs={times={[1]=1.20,[2]=5.50},uses=150,maxlevel=1},
            hotstone={times={[1]=2.50,[2]=2.80,[3]=1.70},uses=70,maxlevel=1},
            dintled={times={[1]=5.70,[2]=8.00},uses=45,maxlevel=1},
		},
        damage_groups={fleshy=5},
	},
})

local electro_fns_activate = function(pos, node, puncher)
    local item = puncher:get_wielded_item()
    if item:get_name() == "lulzpack:electro_fns" then
        local nodepos = {x=pos.x,y=pos.y+1,z=pos.z}
        if minetest.env:get_node(nodepos).name == 'air' then 
            minetest.env:add_node(nodepos, {name="fire:basic_flame"})
        item:add_wear(100)
        puncher:set_wielded_item(item)
            end
        end
    end
minetest.register_on_punchnode(electro_fns_activate)
--

--Craftings

minetest.register_craft({
	output = 'lulzpack:chainsaw_lyra',
	recipe = {
		{'lulzpack:industrial_iron', 'lulzpack:industrial_iron', 'lulzpack:iron_plate'},
		{'lulzpack:industrial_iron', 'lulzpack:lyra_block', 'lulzpack:iron_plate'},
		{'', 'lulzpack:iron_plate', 'lulzpack:intbattery'},
	}
})

minetest.register_craft({
	output = 'lulzpack:chainsaw_celis',
	recipe = {
		{'lulzpack:industrial_iron', 'lulzpack:industrial_iron', 'lulzpack:iron_plate'},
		{'lulzpack:industrial_iron', 'lulzpack:celis_block', 'lulzpack:iron_plate'},
		{'', 'lulzpack:iron_plate', 'lulzpack:intbattery'},
	}
})

minetest.register_craft({
	output = 'lulzpack:chainsaw_nyon',
	recipe = {
		{'lulzpack:industrial_iron', 'lulzpack:industrial_iron', 'lulzpack:iron_plate'},
		{'lulzpack:industrial_iron', 'lulzpack:nyon_block', 'lulzpack:iron_plate'},
		{'', 'lulzpack:iron_plate', 'lulzpack:intbattery'},
	}
})

minetest.register_craft({
	output = 'lulzpack:electroauger_lyra',
	recipe = {
		{'lulzpack:industrial_iron', 'lulzpack:electrodrill', 'lulzpack:iron_plate'},
		{'lulzpack:electrodrill', 'lulzpack:lyra_block', 'lulzpack:iron_plate'},
		{'', 'lulzpack:iron_plate', 'lulzpack:intbattery'},
	}
})

minetest.register_craft({
	output = 'lulzpack:electroauger_celis',
	recipe = {
		{'lulzpack:industrial_iron', 'lulzpack:electrodrill', 'lulzpack:iron_plate'},
		{'lulzpack:electrodrill', 'lulzpack:celis_block', 'lulzpack:iron_plate'},
		{'', 'lulzpack:iron_plate', 'lulzpack:intbattery'},
	}
})

minetest.register_craft({
	output = 'lulzpack:electroauger_nyon',
	recipe = {
		{'lulzpack:industrial_iron', 'lulzpack:electrodrill', 'lulzpack:iron_plate'},
		{'lulzpack:electrodrill', 'lulzpack:nyon_block', 'lulzpack:iron_plate'},
		{'', 'lulzpack:iron_plate', 'lulzpack:intbattery'},
	}
})

minetest.register_craft({
	output = 'lulzpack:electro_fns',
	recipe = {
		{'', 'default:coal_lump', ''},
		{'', '', 'lulzpack:industrial_iron'},
		{'', '', 'lulzpack:redyz_ingot'},
	}
})


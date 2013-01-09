minetest.register_tool("lulzpack:chainsaw_lyra", {
	description = "Lyra Chainsaw",
	inventory_image = "lyra_chainsaw.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.80, [2]=0.50, [3]=0.20}, uses=150, maxlevel=1},
			fleshy={times={[1]=0.40, [2]=0.60, [3]=0.40}, uses=60, maxlevel=1},
			snappy={times={[1]=0.10, [2]=0.05, [3]=0.02}, uses=150, maxlevel=1}
		}
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
		}
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
		}
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
	output = 'lulzpack:electro_fns',
	recipe = {
		{'', 'default:coal_lump', ''},
		{'', '', 'lulzpack:industrial_iron'},
		{'', '', 'lulzpack:redyz_ingot'},
	}
})


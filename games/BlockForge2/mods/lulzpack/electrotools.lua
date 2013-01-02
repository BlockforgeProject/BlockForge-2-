minetest.register_tool("lulzpack:chainsaw_lyra", {
	description = "Lyra Chainsaw",
	inventory_image = "lyra_chainsaw.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.80, [2]=0.50, [3]=0.20}, uses=80, maxlevel=1},
			fleshy={times={[1]=0.40, [2]=0.60, [3]=0.40}, uses=60, maxlevel=1},
			snappy={times={[1]=0.10, [2]=0.05, [3]=0.02}, uses=60, maxlevel=1}
		}
	},
})

minetest.register_tool("lulzpack:chainsaw_celis", {
	description = "Celis Chainsaw",
	inventory_image = "celis_chainsaw.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.50, [2]=0.20, [3]=0.05}, uses=70, maxlevel=1},
			fleshy={times={[1]=0.30, [2]=0.20, [3]=0.08}, uses=60, maxlevel=1},
			snappy={times={[1]=0.05, [2]=0.02, [3]=0.01}, uses=60, maxlevel=1}
		}
	},
})

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



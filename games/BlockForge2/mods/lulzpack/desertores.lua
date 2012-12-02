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
	generate_ore("lulzpack:desertstone_with_redyz", "default:desert_stone", minp, maxp, seed+6, 1/24/24/24, 12,256, -300, 300)
end)

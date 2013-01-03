--Functions and helpers

--Liquid registration helper
function registerLiquid(name,nodename,texturename,viscosity,damage,light)
minetest.register_node("lulzpack:"..name.."_flowing", {
	description = "Flowing"..nodename.."",
	inventory_image = minetest.inventorycube(""..texturename..".png"),
	drawtype = "flowingliquid",
	special_tiles = {
		{
			image=""..texturename.."_flowing_animated.png",
			backface_culling=false,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.3}
		},
		{
			image=""..texturename.."_flowing_animated.png",
			backface_culling=true,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.3}
		},
	},
	paramtype = "light",
	light_source = light,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	liquidtype = "flowing",
	liquid_alternative_flowing = "lulzpack:"..name.."_flowing",
	liquid_alternative_source = "lulzpack:"..name.."_source",
	liquid_viscosity = viscosity,
	damage_per_second = damage,
	post_effect_color = {a=192, r=130, g=64, b=0},
	groups = {liquid=2, hot=3, igniter=1, not_in_creative_inventory=1},
})

minetest.register_node("lulzpack:"..name.."_source", {
	description = ""..nodename.." Source",
	inventory_image = minetest.inventorycube(""..texturename..".png"),
	drawtype = "liquid",
	tiles = {
		{name=""..texturename.."_source_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	},
	paramtype = "light",
	light_source = light,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	liquidtype = "source",
	liquid_alternative_flowing = "lulzpack:"..name.."_flowing",
	liquid_alternative_source = "lulzpack:"..name.."_source",
	liquid_viscosity = viscosity,
	damage_per_second = damage,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {liquid=2, hot=3, igniter=1},
})
end
--Smithery Recipe helper

function addSmitheryRecipe(pos, node, srcinv_name, destinv_name, source, result, case, caseinv_name)
    local meta=minetest.env:get_meta(pos)
    local inv=meta:get_inventory()
    if inv:contains_item(srcinv_name, source) then
        if inv:contains_item(caseinv_name, case) then
            inv:remove_item(srcinv_name, source)
            inv:remove_item(caseinv_name, case)
            inv:add_item(destinv_name, result)
        end
    end
end

--Generators fuel helper
function add_gen_fuel(pos, node, invname, nodename, varname, given_energy, replacing_item)
    local meta = minetest.env:get_meta(pos)
    local inv = meta:get_inventory()
    if meta:get_inventory():contains_item(invname, nodename) then
        energy=meta:get_int(varname)
        meta:set_int(varname,energy+given_energy)
        meta:get_inventory():remove_item(invname, nodename)
        meta:get_inventory():add_item(invname, replacing_item) end
end

--Recharger Item
--Big thanks to PilzAdam and Jordach for helping me with this ;)
function add_recharger_item(pos,itemname,energy_per_second)
    local gen_meta = minetest.env:get_meta({x=pos.x,y=pos.y-1,z=pos.z})
    local gen_energy= gen_meta:get_int("energy")
    local meta = minetest.env:get_meta(pos)
    local inv = meta:get_inventory()
    for i=1,4 do
        local item_stack=ItemStack(inv:get_stack("items", i))
        if item_stack:get_name() == itemname then
            if gen_energy >= energy_per_second then
            if item_stack:get_wear() > 0 then
                item_stack:add_wear(-energy_per_second)
                inv:set_stack("items",i,item_stack)
                gen_meta:set_int("energy",gen_energy-energy_per_second)
                end
            end
        end    
    end
end
--Ore Generation helper (from core code)
function generate_ore(name, wherein, minp, maxp, seed, chunks_per_volume, chunk_size, ore_per_chunk, height_min, height_max)
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

--Ore Registration Helper
function register_lulzpack_ore(name,graphicname)

minetest.register_node("lulzpack:stone_with_"..name.."", {
	description = ""..graphicname.." Ore",
	tiles = {"default_stone.png^"..name.."_mineral.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'lulzpack:'..name..'_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("lulzpack:"..name.."_lump", {
	description =  ""..graphicname.." Lump",
	inventory_image = name.."_lump.png",
})

minetest.register_craftitem("lulzpack:"..name.."_ingot", {
	description = ""..graphicname.." Ingot",
	inventory_image = name.."_ingot.png",
})

minetest.register_node("lulzpack:"..name.."_block", {
	description = ""..graphicname.." Block",
	tiles = {""..name.."_block.png"},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = 'lulzpack:'..name..'_block',
	recipe = {
		{'lulzpack:'..name..'_ingot','lulzpack:'..name..'_ingot','lulzpack:'..name..'_ingot'},
		{'lulzpack:'..name..'_ingot','lulzpack:'..name..'_ingot','lulzpack:'..name..'_ingot'},
		{'lulzpack:'..name..'_ingot','lulzpack:'..name..'_ingot','lulzpack:'..name..'_ingot'},
	}
})

minetest.register_craft({
	output = 'lulzpack:'..name..'_ingot 9',
	recipe = {
		{'lulzpack:'..name..'_block'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "lulzpack:"..name.."_ingot",
	recipe = "lulzpack:"..name.."_lump",
})

end
--Modified version of the bucket helper
lulzLiquids={}
function registerObsBucket(source, flowing, itemname, inventory_image, graphicname)
	lulzLiquids[source] = {
		source = source,
		flowing = flowing,
		itemname = itemname,
	}
	lulzLiquids[flowing] = lulzLiquids[source]

	if itemname ~= nil then
		minetest.register_craftitem(itemname, {
			inventory_image = inventory_image,
			stack_max = 1,
			liquids_pointable = true,
            description = graphicname,
			on_use = function(itemstack, user, pointed_thing)
				-- Must be pointing to node
				if pointed_thing.type ~= "node" then
					return
				end
				-- Check if pointing to a buildable node
				n = minetest.env:get_node(pointed_thing.under)
				if minetest.registered_nodes[n.name].buildable_to then
					-- buildable; replace the node
					minetest.env:add_node(pointed_thing.under, {name=source})
				else
					-- not buildable to; place the liquid above
					-- check if the node above can be replaced
					n = minetest.env:get_node(pointed_thing.above)
					if minetest.registered_nodes[n.name].buildable_to then
						minetest.env:add_node(pointed_thing.above,{name=source})
					else
						-- do not remove the bucket with the liquid
						return
					end
				end
				return {name="lulzpack:obsidian_bucket_empty"}
			end
		})
	end
end

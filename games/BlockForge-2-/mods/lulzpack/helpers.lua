--Functions and helpers
lulzpack={}
--Refinery helpers
function registerRefRecNodeToItem(source,result,energy_needed,genmeta,nodepos,nodedrop)
    if minetest.env:get_node(nodepos).name == source then
        if energy >= energy_needed then
		minetest.env:remove_node(nodepos)
		minetest.env:add_item(nodedrop, result) 
        genmeta:set_int("energy",genmeta:get_int("energy")-energy_needed) 
        MILLGENupdate_formspec(gen_pos) end end
end
function registerRefRecNodeToNode(source,result,energy_needed,genmeta,nodepos)
    if minetest.env:get_node(nodepos).name == source then
        if energy >= energy_needed then
		minetest.env:remove_node(nodepos)
		minetest.env:set_node(nodepos, {name=result}) 
        genmeta:set_int("energy",genmeta:get_int("energy")-energy_needed) 
        MILLGENupdate_formspec(gen_pos) end end
end
--Liquid registration helpers
function registerSimpleLiquid(name,nodename,texturename,viscosity,damage,light,groupssource,groupsflowing)
minetest.register_node("lulzpack:"..name.."_flowing", {
	description = "Flowing"..nodename.."",
	--inventory_image = minetest.inventorycube(""..texturename..".png"),
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
	groups = groupssource,
})

minetest.register_node("lulzpack:"..name.."_source", {
	description = ""..nodename.." Source",
	--inventory_image = minetest.inventorycube(""..texturename..".png"),
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
	groups = groupsflowing,
})
end
-----------------------------------------------------------------------------------------------
function registerHotLiquid(name,nodename,texturename,viscosity,damage,light)
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

function add_nucgen_fuel(pos, node, invname, nodename, varname, given_energy, replacing_item, heatvar_name, given_heat)
    local meta = minetest.env:get_meta(pos)
    local inv = meta:get_inventory()
    if meta:get_inventory():contains_item(invname, nodename) then
        energy=meta:get_int(varname)
        heat=meta:get_int(heatvar_name)
        meta:set_int(varname,energy+given_energy)
        if heat >= 0 then meta:set_int(heatvar_name,heat+given_heat) end
        meta:get_inventory():remove_item(invname, nodename)
        meta:get_inventory():add_item(invname, replacing_item) end
end

--Simple Miner fuel helper
function add_simpleminer_fuel(pos, node, invname, nodename, varname, given_energy, replacing_item)
    local meta = minetest.env:get_meta(pos)
    local inv = meta:get_inventory()
    if meta:get_inventory():contains_item(invname, nodename) then
        energy=meta:get_int(varname)
        meta:set_int(varname,energy+given_energy)
        meta:get_inventory():remove_item(invname, nodename)
        meta:get_inventory():add_item(invname, replacing_item) end
end

--BatBox battery helper
function lulzpack.add_batbox_battery(pos, invname, machpos, mach_varname, batname, capacity, energy_const)
    local meta = minetest.env:get_meta(pos)
    local mach_meta = minetest.env:get_meta(machpos)
    local mach_energy = mach_meta:get_int(mach_varname)
    local inv = meta:get_inventory()
    if meta:get_inventory():contains_item(invname, batname) then
        local energy=mach_meta:get_int(mach_varname)
        local item_stack= ItemStack(inv:get_stack(invname,1))
        local wear=item_stack:get_wear()
        local energy_unit=65535/capacity
        local energy_per_sec=energy_unit*energy_const*65545
        if wear >= 0 then
            if energy > energy_per_sec then
                item_stack:add_wear(-energy_per_sec)
                mach_meta:set_int(mach_varname,mach_energy-energy_per_sec)
                inv:set_stack(invname,1,item_stack)
                print(energy_per_sec)
            end
        end
    end
end

--Coinerator recipe helper
function add_coinerator_recipe(pos, srcname, coinname, gen_meta,energy_var, energy_needed)
    local meta = minetest.env:get_meta(pos)
    local inv = meta:get_inventory()
    if meta:get_inventory():contains_item("src", srcname) then
    if energy_var > energy_needed then
        gen_meta:set_int(energy_var,energy_var-energy_needed)
        meta:get_inventory():remove_item("src", srcname)
        meta:get_inventory():add_item("dst", coinname) end
    end
end
--Simple Miner formspec Update
function SIMPLEMINERupdate_formspec(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,1;]"..
			    "list[current_name;fuels;3,3;3,1;]"..
                "label[1,3,fuelstext]"..
                "list[current_name;Energy="..meta:get_int("energy").."]"..
				"list[current_player;main;0,5;8,4;]")
end

--Minimal Mining machine formspec Update
function MINIMALMININGupdate_formspec(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,1;]"..
                --"button[3,2;3,1;start;Start]"..
			    "list[current_name;fuels;3,3;3,1;]"..
                "label[1,3,fuelstext]"..
                "list[current_name;Energy="..meta:get_int("energy").."]"..
				"list[current_player;main;0,5;8,4;]")
end

--Recharger Item
--Big thanks to PilzAdam and Jordach for helping me with this ;)
function add_recharger_item(pos,itemname,energy_per_second,energy_per_second_from_gen)
    local gen_meta = minetest.env:get_meta({x=pos.x,y=pos.y-1,z=pos.z})
    local gen_energy= gen_meta:get_int("energy")
    local meta = minetest.env:get_meta(pos)
    local inv = meta:get_inventory()
    for i=1,4 do
        local item_stack=ItemStack(inv:get_stack("items", i))
        if item_stack:get_name() == itemname then
            if gen_energy >= energy_per_second_from_gen then
            if item_stack:get_wear() > 0 then
                item_stack:add_wear(-energy_per_second)
                inv:set_stack("items",i,item_stack)
                gen_meta:set_int("energy",gen_energy-energy_per_second_from_gen)
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
function setLightOnOre(name,graphicname,light)

minetest.register_node("lulzpack:stone_with_"..name.."", {
	description = ""..graphicname.." Ore",
	tiles = {"default_stone.png^"..name.."_mineral.png"},
	is_ground_content = true,
    light_source = light,
	groups = {cracky=2},
	drop = 'lulzpack:'..name..'_lump',
	sounds = default.node_sound_stone_defaults(),
})

end
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
--Tools registration helper
function registerTools(toolname, itemname, graphicname, swordgroups, axegroups, shovelgroups, pickgroups)

minetest.register_tool("lulzpack:sword_"..toolname.."", {
	description = ""..graphicname.." Sword",
	inventory_image = ""..toolname.."_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps=swordgroups
	}
})

minetest.register_tool("lulzpack:axe_"..toolname.."", {
	description = ""..graphicname.." Axe",
	inventory_image = ""..toolname.."_axe.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps=axegroups
	},
})

minetest.register_tool("lulzpack:shovel_"..toolname.."", {
	description = ""..graphicname.." Shovel",
	inventory_image = ""..toolname.."_shovel.png",
	wield_image = ""..toolname.."_shovel.png^[transformR45",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps=shovelgroups
	},
})

minetest.register_tool("lulzpack:pick_"..toolname.."", {
	description = ""..graphicname.." Pickaxe",
	inventory_image = ""..toolname.."_pick.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps=pickgroups
	},
})

minetest.register_craft({
	output = 'lulzpack:pick_'..toolname..'',
	recipe = {
		{itemname, itemname, itemname},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'lulzpack:axe_'..toolname..'',
	recipe = {
		{itemname, itemname, ''},
		{itemname, 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'lulzpack:sword_'..toolname..'',
	recipe = {
		{'', itemname, ''},
		{'', itemname, ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'lulzpack:shovel_'..toolname..'',
	recipe = {
		{'', itemname, ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})
end
--Modified version of the bucket helper for obsidian buckets
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

--Stairs helper
--Forked from core mods

-- Node will be called stairs:stair_<subname>
function lulzpack.register_stair(subname, recipeitem, groups, images, description,light)
	minetest.register_node("lulzpack:stair_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
        light_source = light,
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
	})

	minetest.register_craft({
		output = 'lulzpack:stair_' .. subname .. ' 8',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})

	-- Flipped recipe for the silly minecrafters
	minetest.register_craft({
		output = 'lulzpack:stair_' .. subname .. ' 8',
		recipe = {
			{"", "", recipeitem},
			{"", recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Node will be called stairs:slab_<subname>
function lulzpack.register_slab(subname, recipeitem, groups, images, description, light)
	minetest.register_node("lulzpack:slab_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
        light_source = light,
		is_ground_content = true,
		groups = groups,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			-- If it's being placed on an another similar one, replace it with
			-- a full block
			local slabpos = nil
			local slabnode = nil
			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local n0 = minetest.env:get_node(p0)
			if n0.name == "lulzpack:slab_" .. subname and
					p0.y+1 == p1.y then
				slabpos = p0
				slabnode = n0
			end
			if slabpos then
				-- Remove the slab at slabpos
				minetest.env:remove_node(slabpos)
				-- Make a fake stack of a single item and try to place it
				local fakestack = ItemStack(recipeitem)
				pointed_thing.above = slabpos
				fakestack = minetest.item_place(fakestack, placer, pointed_thing)
				-- If the item was taken from the fake stack, decrement original
				if not fakestack or fakestack:is_empty() then
					itemstack:take_item(1)
				-- Else put old node back
				else
					minetest.env:set_node(slabpos, slabnode)
				end
				return itemstack
			end
			
			-- Otherwise place regularly
			return minetest.item_place(itemstack, placer, pointed_thing)
		end,
	})

	minetest.register_craft({
		output = 'lulzpack:slab_' .. subname .. ' 6',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Nodes will be called stairs:{stair,slab}_<subname>
function lulzpack.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_slab, light)
	lulzpack.register_stair(subname, recipeitem, groups, images, desc_stair, light)
	lulzpack.register_slab(subname, recipeitem, groups, images, desc_slab, light)
end



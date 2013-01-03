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

smithery_formspec =
	"size[8,9]"..
    "label[2,0.5;   Source]"..
	"list[current_name;src;2,1;1,1;]"..
    "label[2,2.5;    Case]"..
	"list[current_name;case;2,3;1,1;]"..
	"list[current_name;dst;5,2;2,1;]"..
	"list[current_player;main;0,5;8,4;]"

minetest.register_node("lulzpack:smithery", {
	description = "Smithery",
	tiles = {"smithery_above.png","electrofurnace_side.png"},
    drawtype="nodebox",
	groups = {cracky=1},
	paramtype = "light",
	--paramtype2 = "facedir",
	is_ground_content = true,
    light_source=10,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", smithery_formspec)
		meta:set_string("infotext", "Smithery")
		local inv = meta:get_inventory()
		inv:set_size("src", 1)
		inv:set_size("dst", 2)
		inv:set_size("case", 2)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
	    if not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		elseif not inv:is_empty("case") then
			return false
		end
		return true
	end,
	selection_box = {
        type = "fixed",
        fixed = { -0.5, -0.5, -0.5 , 0.5, 0, 0.5},
    },
	node_box = {
        type = "fixed",
        fixed = { -0.5, -0.5, -0.5 , 0.5, 0, 0.5}
    }
})
--Obsidian Bucket
minetest.register_craftitem("lulzpack:obsidian_bucket_empty", {
	description = "Empty Obsidian Bucket",
	inventory_image = "obsidian_bucket_empty.png",
	stack_max = 1,
	liquids_pointable = true,
	on_use = function(itemstack, user, pointed_thing)
		-- Must be pointing to node
		if pointed_thing.type ~= "node" then
			return
		end
		-- Check if pointing to a liquid source
		n = minetest.env:get_node(pointed_thing.under)
		liquiddef = lulzLiquids[n.name]
		if liquiddef ~= nil and liquiddef.source == n.name and liquiddef.itemname ~= nil then
			minetest.env:add_node(pointed_thing.under, {name="air"})
			return {name=liquiddef.itemname}
		end
	end,
})
--Liquids
registerLiquid("meltedcelis","Melted Celis","meltedcelis",120,10,5)
registerLiquid("meltedlyra","Melted Lyra","meltedlyra",80,6,10)
registerLiquid("meltediron","Melted Iron","meltediron",160,4,3)
--Buckets
registerObsBucket("lulzpack:meltedcelis_source","lulzpack:meltedcelis_flowing","lulzpack:obsidian_bucket_meltedcelis","obsidian_bucket_meltedcelis.png","Melted Celis Obsidian Bucket")
registerObsBucket("lulzpack:meltedlyra_source","lulzpack:meltedlyra_flowing","lulzpack:obsidian_bucket_meltedlyra","obsidian_bucket_meltedlyra.png","Melted Lyra Obsidian Bucket")
registerObsBucket("lulzpack:meltediron_source","lulzpack:meltediron_flowing","lulzpack:obsidian_bucket_meltediron","obsidian_bucket_meltediron.png","Melted Iron Obsidian Bucket")

smithery = function(pos,node)
    if minetest.env:get_node({x=pos.x,y=pos.y-1,z=pos.z}).name == "default:lava_source" then 
        --RECIPES
        addSmitheryRecipe(pos, node, "src", "dst", "lulzpack:celis_block", "lulzpack:obsidian_bucket_meltedcelis", "lulzpack:obsidian_bucket_empty", "case")
        addSmitheryRecipe(pos, node, "src", "dst", "lulzpack:lyra_block", "lulzpack:obsidian_bucket_meltedlyra", "lulzpack:obsidian_bucket_empty", "case")
        addSmitheryRecipe(pos, node, "src", "dst", "default:steelblock", "lulzpack:obsidian_bucket_meltediron", "lulzpack:obsidian_bucket_empty", "case")
        --CONSUMING THE LAVA
        random=math.random(1,12)
        if random >= math.random(9,12) then minetest.env:remove_node({x=pos.x,y=pos.y-1,z=pos.z}) end
    end
end

minetest.register_abm({
    nodenames={"lulzpack:smithery"},
    interval=4.0,
    chance=1,
    action=smithery, })


--[[minetest.register_craft({
	output = 'lulzpack:smithery',
	recipe = {
            {'lulzpack:lava_block','lulzpack:industrial_iron','lulzpack:lava_block'},
            {'lulzpack:lava_block','','lulzpack:lava_block'},
            {'lulzpack:lava_block','lulzpack:celis_ingot','lulzpack:lava_block'},
	}
})]]
        
minetest.register_craft({
    output = 'lulzpack:smithery',
    recipe = {
            {'lulzpack:lava_block','lulzpack:industrial_iron','lulzpack:lava_block'},
            {'lulzpack:lava_block','','lulzpack:lava_block'},
            {'lulzpack:lava_block','lulzpack:celis_ingot','lulzpack:lava_block'},
    }
})

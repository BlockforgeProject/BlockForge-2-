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

--Liquids
registerLiquid("meltedcelis","Melted Celis","meltedcelis",120,10,5)
registerLiquid("meltedlyra","Melted Lyra","meltedlyra",80,6,10)
registerLiquid("meltediron","Melted Iron","meltediron",160,4,3)
--Buckets
bucket.register_liquid("lulzpack:meltedcelis_source","lulzpack:meltedcelis_flowing","lulzpack:bucket_meltedcelis","bucket_meltedcelis.png")
bucket.register_liquid("lulzpack:meltedlyra_source","lulzpack:meltedlyra_flowing","lulzpack:bucket_meltedlyra","bucket_meltedlyra.png")
bucket.register_liquid("lulzpack:meltediron_source","lulzpack:meltediron_flowing","lulzpack:bucket_meltediron","bucket_meltediron.png")

smithery = function(pos,node)
    if minetest.env:get_node({x=pos.x,y=pos.y-1,z=pos.z}).name == "default:lava_source" then 
        --RECIPES
        addSmitheryRecipe(pos, node, "src", "dst", "lulzpack:celis_block", "lulzpack:bucket_meltedcelis", "bucket:bucket_empty", "case")
        addSmitheryRecipe(pos, node, "src", "dst", "lulzpack:lyra_block", "lulzpack:bucket_meltedlyra", "bucket:bucket_empty", "case")
        addSmitheryRecipe(pos, node, "src", "dst", "default:steelblock", "lulzpack:bucket_meltediron", "bucket:bucket_empty", "case")
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

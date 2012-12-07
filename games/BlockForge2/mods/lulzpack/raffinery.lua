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

--Modules
minetest.register_node("lulzpack:raffinery_mod1", {
    description = "Refinery Module #1",
	tiles = {"bb_side.png","bb_side.png",
            {name="raffinerymodule_1_top.png", animation={type="vertical_frames", aspect_w=2, aspect_h=2, length=1.5}}},
	is_ground_content = false,
	groups = {crumbly=3},
})

local activateraffinery = function( pos, node)
		if node.name ~= 'lulzpack:raffinery' then return end
			nodepos = { x = pos.x, y = pos.y-1, z = pos.z }
			nodedrop = { x = pos.x, y = pos.y+1, z = pos.z }
			if minetest.env:get_node(nodepos).name == 'default:lava_source' then
				minetest.env:remove_node(nodepos)
				minetest.env:add_item(nodedrop, 'lulzpack:lava_block')
            --Modules
            elseif minetest.env:get_node(nodepos).name == 'lulzpack:raffinery_mod1' then
            mod1pos1={x=pos.x+1,y=pos.y-1,z=pos.z}
            mod1pos2={x=pos.x-1,y=pos.y-1,z=pos.z}
            mod1pos3={x=pos.x,y=pos.y-1,z=pos.z+1}
            mod1pos4={x=pos.x,y=pos.y-1,z=pos.z-1}
            nodedrop2={x=pos.x,y=pos.y-2,z=pos.z}
            if minetest.env:get_node(mod1pos1).name == 'default:lava_source' and minetest.env:get_node(mod1pos2).name == 'default:water_source' then
                minetest.env:remove_node(mod1pos1)
                minetest.env:remove_node(mod1pos2)
                minetest.env:remove_node(mod1pos3)
                minetest.env:remove_node(mod1pos4)
 				minetest.env:add_node(nodedrop2, { name = "lulzpack:hotstone" }) end                           
            end
end
           

minetest.register_on_punchnode( activateraffinery )

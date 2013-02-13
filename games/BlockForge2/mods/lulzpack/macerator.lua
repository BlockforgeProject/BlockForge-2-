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





--[[local activatemacerator= function( pos, node, puncher)
		if node.name ~= 'lulzpack:macerator' then return end
			nodedrop = { x = pos.x, y = pos.y+1, z = pos.z }
			if puncher:get_inventory():contains_item("main", "default:stone_with_iron") then
				puncher:get_inventory():remove_item("main", "default:stone_with_iron")
					--GIVING
					minetest.env:add_item(nodedrop, 'default:iron_lump')
			end
end]]--

local activatemacerator = function( pos, node)
		if node.name ~= 'lulzpack:macerator' then return end
			nodepos = { x = pos.x, y = pos.y-1, z = pos.z }
			nodedrop = { x = pos.x, y = pos.y+2, z = pos.z }
            --Checking for energy
            gen_pos={x=pos.x,y=pos.y+1,z=pos.z}
            local genmeta=minetest.env:get_meta(gen_pos)
            energy=genmeta:get_int("energy")
			if minetest.env:get_node(nodepos).name == 'lulzpack:redyz_block' then
                if energy >= 20 then
				minetest.env:remove_node(nodepos)
					--GIVING
					minetest.env:add_item(nodedrop, 'lulzpack:redyz_lump 9')
                    genmeta:set_int("energy",genmeta:get_int("energy")-20) end
		        end
			if minetest.env:get_node(nodepos).name == 'lulzpack:lyra_block' then
                if energy >= 20 then
				minetest.env:remove_node(nodepos)
					--GIVING
					minetest.env:add_item(nodedrop, 'lulzpack:lyra_lump 9')
                    genmeta:set_int("energy",genmeta:get_int("energy")-20) end
		        end
end

minetest.register_on_punchnode( activatemacerator )

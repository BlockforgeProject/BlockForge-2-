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
			nodedrop = { x = pos.x, y = pos.y+1, z = pos.z }
			if minetest.env:get_node(nodepos).name == 'lulzpack:redyz_block' then
				minetest.env:remove_node(nodepos)
					--GIVING
					minetest.env:add_item(nodedrop, 'lulzpack:redyz_lump 9')
		        end
			if minetest.env:get_node(nodepos).name == 'lulzpack:lyra_block' then
				minetest.env:remove_node(nodepos)
					--GIVING
					minetest.env:add_item(nodedrop, 'lulzpack:lyra_lump 9')
		        end
end

minetest.register_on_punchnode( activatemacerator )

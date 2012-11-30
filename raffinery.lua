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

local activateraffinery = function( pos, node)
		if node.name ~= 'lulzpack:raffinery' then return end
			nodepos = { x = pos.x, y = pos.y-1, z = pos.z }
			nodedrop = { x = pos.x, y = pos.y+1, z = pos.z }
			if minetest.env:get_node(nodepos).name == 'default:lava_source' then
				minetest.env:remove_node(nodepos)
					--GIVING
					minetest.env:add_item(nodedrop, 'lulzpack:lava_block')
		    end
        end

minetest.register_on_punchnode( activateraffinery )

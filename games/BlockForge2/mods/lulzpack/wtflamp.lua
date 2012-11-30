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




local placelamp = function( pos, node, placer)
	if node.name ~= 'lulzpack:lamp' then return end
	undpos = { x = pos.x, y = pos.y - 1, z = pos.z }
	pos = { x = pos.x, y = pos.y, z = pos.z }
	under = minetest.env:get_node( undpos )

	if under.name ~= 'lulzpack:lamppole' then 
		minetest.env:remove_node( pos )
		minetest.env:add_item(pos, "lulzpack:lamp")
	end
end
minetest.register_on_placenode( placelamp )


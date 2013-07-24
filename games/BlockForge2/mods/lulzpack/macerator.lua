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

local activatemacerator = function( pos, node)
		if node.name ~= 'lulzpack:macerator' then return end
	    nodepos = { x = pos.x, y = pos.y-1, z = pos.z }
		nodedrop = { x = pos.x, y = pos.y+2, z = pos.z }
        --Checking for energy
        gen_pos={x=pos.x,y=pos.y+1,z=pos.z}
        local genmeta=minetest.env:get_meta(gen_pos)
        energy=genmeta:get_int("energy")
        addMaceratorRecipe(nodepos,energy,20,nodedrop,genmeta,"lulzpack:lyra_block","lulzpack:lyra_dust 9")
        addMaceratorRecipe(nodepos,energy,30,nodedrop,genmeta,"lulzpack:redyz_block","lulzpack:redyz_dust 9")
        addMaceratorRecipe(nodepos,energy,50,nodedrop,genmeta,"lulzpack:hotstone","lulzpack:hotstone_dust 3")
end

minetest.register_on_punchnode( activatemacerator )

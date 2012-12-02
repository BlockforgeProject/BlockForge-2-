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

local activatequarry = function( pos, node, puncher )
	if node.name ~= 'lulzpack:quarry' then return end
	local digs=1
	while(minetest.env:get_node({x=pos.x,y=pos.y-digs,z=pos.z}).name=='lulzpack:quarrydiggerpole') do
		print(digs)
		digs=digs+1
	end
	if puncher:get_inventory():contains_item("main", "lulzpack:quarrydrill") then
			puncher:get_inventory():remove_item("main", "lulzpack:quarrydrill")
			quarrypos = { x = pos.x, y = pos.y, z = pos.z }
			quarrypos2 = { x = pos.x, y = pos.y - digs, z = pos.z }
            ------------------------------
            nodepos = { x = pos.x, y = pos.y - digs, z = pos.z }
            nodepos2 = { x = pos.x - 1, y = pos.y - digs, z = pos.z }
            nodepos3 = { x = pos.x, y = pos.y - digs, z = pos.z - 1 }
            nodepos4 = { x = pos.x + 1, y = pos.y - digs, z = pos.z }
            nodepos5 = { x = pos.x, y = pos.y - digs, z = pos.z + 1 }
            nodepos6 = { x = pos.x + 1, y = pos.y - digs, z = pos.z + 1}
            nodepos7 = { x = pos.x - 1, y = pos.y - digs, z = pos.z - 1}
            nodepos8 = { x = pos.x + 1, y = pos.y - digs, z = pos.z - 1}
            nodepos9 = { x = pos.x - 1, y = pos.y - digs, z = pos.z + 1}
            ------------------------------
			nodename = minetest.env:get_node(nodepos)
			nodename2 = minetest.env:get_node(nodepos2)	
			nodename3 = minetest.env:get_node(nodepos3)
			nodename4 = minetest.env:get_node(nodepos4)	
			nodename5 = minetest.env:get_node(nodepos5)
			nodename6 = minetest.env:get_node(nodepos6)
			nodename7 = minetest.env:get_node(nodepos7)
			nodename8 = minetest.env:get_node(nodepos8)
			nodename9 = minetest.env:get_node(nodepos9)
			--GETTING NODE AND GIVING
	        local drop1 = minetest.get_node_drops(nodename.name)
	        local drop2 = minetest.get_node_drops(nodename2.name)
	        local drop3 = minetest.get_node_drops(nodename3.name)
	        local drop4 = minetest.get_node_drops(nodename4.name)
	        local drop5 = minetest.get_node_drops(nodename5.name)
	        local drop6 = minetest.get_node_drops(nodename6.name)
	        local drop7 = minetest.get_node_drops(nodename7.name)
	        local drop8 = minetest.get_node_drops(nodename8.name)
	        local drop9 = minetest.get_node_drops(nodename9.name)
			--DIGGING
		    local meta = minetest.env:get_meta(pos)
            local inv = meta:get_inventory()
            for _, item1 in ipairs(drop1) do
            if nodename.name ~= 'air' then  inv:add_item("main", item1) end
            end
            for _, item2 in ipairs(drop2) do
            if nodename2.name  ~= 'air' then  inv:add_item("main", item2) end
            end
            for _, item3 in ipairs(drop3) do
            if nodename3.name  ~= 'air' then  inv:add_item("main", item3) end
            end
            for _, item4 in ipairs(drop4) do
            if nodename4.name  ~= 'air' then  inv:add_item("main", item4) end
            end
            for _, item5 in ipairs(drop5) do
            if nodename5.name  ~= 'air' then  inv:add_item("main", item5) end
            end
            for _, item6 in ipairs(drop6) do
            if nodename6.name  ~= 'air' then  inv:add_item("main", item6) end
            end
            for _, item7 in ipairs(drop7) do
            if nodename7.name  ~= 'air' then  inv:add_item("main", item7) end
            end
            for _, item8 in ipairs(drop8) do
            if nodename8.name  ~= 'air' then  inv:add_item("main", item8) end
            end
            for _, item9 in ipairs(drop9) do
            if nodename9.name  ~= 'air' then  inv:add_item("main", item9) end
            end
			--minetest.env:remove_node( quarrypos )
			minetest.env:dig_node( nodepos )
			minetest.env:dig_node( nodepos2 )
			minetest.env:dig_node( nodepos3 )
			minetest.env:dig_node( nodepos4 )
			minetest.env:dig_node( nodepos5 )
			minetest.env:dig_node( nodepos6 )
			minetest.env:dig_node( nodepos7 )
			minetest.env:dig_node( nodepos8 )
			minetest.env:dig_node( nodepos9 )
			minetest.env:add_node( quarrypos2, { name='lulzpack:quarrydiggerpole' } )
	end
end

minetest.register_on_punchnode( activatequarry )

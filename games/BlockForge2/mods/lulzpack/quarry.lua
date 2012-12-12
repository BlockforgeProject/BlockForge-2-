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
dofile(minetest.get_modpath("lulzpack") .. "/persistence.lua")

quarry_pos = {}
quarry_pos = persistence.load(minetest.get_modpath("lulzpack") .. "/quarrydb.pny")
if quarry_pos==nil then quarry_pos={} end

local activatequarry = function(pos, node, puncher)
local meta = minetest.env:get_meta(pos)
local digs=quarry_pos["q"..pos.x.."-"..pos.z]
if meta:get_inventory():contains_item("drill", "lulzpack:quarrydrill") then
    --Checking for energy
    gen_pos={x=pos.x,y=pos.y+1,z=pos.z}
    local genmeta=minetest.env:get_meta(gen_pos)
    energy=genmeta:get_int("energy")
    --minetest.chat_send_all(energy)
    --minetest.chat_send_all(genname.name)
    if energy >= 50 then
			meta:get_inventory():remove_item("drill", "lulzpack:quarrydrill")
            genmeta:set_int("energy",genmeta:get_int("energy")-50)
            MILLGENupdate_formspec(gen_pos)            
            quarrypos = { x = pos.x, y = pos.y, z = pos.z }
			quarrypos2 = { x = pos.x, y = pos.y - digs, z = pos.z }
			quarrypos3 = { x = pos.x + 1, y = pos.y - digs, z = pos.z }
            ------------------------------
            quarryposs = {
            {x = pos.x, y = pos.y - digs, z = pos.z },
            {x = pos.x - 1, y = pos.y - digs, z = pos.z },
            {x = pos.x, y = pos.y - digs, z = pos.z - 1 },
            {x = pos.x + 1, y = pos.y - digs, z = pos.z },
            {x = pos.x, y = pos.y - digs, z = pos.z + 1 },
            {x = pos.x + 1, y = pos.y - digs, z = pos.z + 1},
            {x = pos.x - 1, y = pos.y - digs, z = pos.z - 1},
            {x = pos.x + 1, y = pos.y - digs, z = pos.z - 1},
            {x = pos.x - 1, y = pos.y - digs, z = pos.z + 1}}
            ------------------------------
            nodenames = {
			minetest.env:get_node(quarryposs[1]),
			minetest.env:get_node(quarryposs[2]),	
			minetest.env:get_node(quarryposs[3]),
			minetest.env:get_node(quarryposs[4]),	
			minetest.env:get_node(quarryposs[5]),
			minetest.env:get_node(quarryposs[6]),
			minetest.env:get_node(quarryposs[7]),
			minetest.env:get_node(quarryposs[8]),
			minetest.env:get_node(quarryposs[9])}
			--GETTING NODE AND GIVING
	        local drop1 = minetest.get_node_drops(nodenames[1].name)
	        local drop2 = minetest.get_node_drops(nodenames[2].name)
	        local drop3 = minetest.get_node_drops(nodenames[3].name)
	        local drop4 = minetest.get_node_drops(nodenames[4].name)
	        local drop5 = minetest.get_node_drops(nodenames[5].name)
	        local drop6 = minetest.get_node_drops(nodenames[6].name)
	        local drop7 = minetest.get_node_drops(nodenames[7].name)
	        local drop8 = minetest.get_node_drops(nodenames[8].name)
	        local drop9 = minetest.get_node_drops(nodenames[9].name)
			--DIGGING
            local inv = meta:get_inventory()
            for _, item1 in ipairs(drop1) do
            if nodenames[1].name ~= 'air' then  inv:add_item("main", item1) end
            end
            for _, item2 in ipairs(drop2) do
            if nodenames[2].name  ~= 'air' then  inv:add_item("main", item2) end
            end
            for _, item3 in ipairs(drop3) do
            if nodenames[3].name  ~= 'air' then  inv:add_item("main", item3) end
            end
            for _, item4 in ipairs(drop4) do
            if nodenames[4].name  ~= 'air' then  inv:add_item("main", item4) end
            end
            for _, item5 in ipairs(drop5) do
            if nodenames[5].name  ~= 'air' then  inv:add_item("main", item5) end
            end
            for _, item6 in ipairs(drop6) do
            if nodenames[6].name  ~= 'air' then  inv:add_item("main", item6) end
            end
            for _, item7 in ipairs(drop7) do
            if nodenames[7].name  ~= 'air' then  inv:add_item("main", item7) end
            end
            for _, item8 in ipairs(drop8) do
            if nodenames[8].name  ~= 'air' then  inv:add_item("nodenames[1]main", item8) end
            end
            for _, item9 in ipairs(drop9) do
            if nodenames[9].name  ~= 'air' then  inv:add_item("main", item9) end
            end
			--minetest.env:remove_node( quarrypos )
            for i=1, 9 do
			quarry_mine(quarryposs[i]) end
            quarry_pos["q"..pos.x.."-"..pos.z]=quarry_pos["q"..pos.x.."-"..pos.z]+1
			minetest.env:add_node( quarrypos2, { name='lulzpack:quarrydiggerpole' } )
	    end
    end
end

function quarry_mine(pos)
     minetest.env:dig_node(pos)
end

minetest.register_abm ({
        nodenames = {"lulzpack:quarry"},
        interval = 2,
        chance = 1,
        action = activatequarry
})

minetest.register_on_shutdown(function()
persistence.store(minetest.get_modpath("lulzpack") .. "/quarrydb.pny",quarry_pos) end)
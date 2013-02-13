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
simpleminer_pos = {}
simpleminer_pos = persistence.load(minetest.get_modpath("lulzpack") .. "/simpleminerdb.pny")
if simpleminer_pos==nil then simpleminer_pos={} end

local activatesimpleminer = function(pos,node)
local meta = minetest.env:get_meta(pos)
local digs=simpleminer_pos["q"..pos.x.."-"..pos.z] if digs==nil then return end
if meta:get_int("energy") > 30 then 
    nodeposs={x=pos.x,y=pos.y-digs,z=pos.z}
    nodename=minetest.env:get_node(nodeposs)
    local drop=minetest.get_node_drops(nodename.name)
    local inv = meta:get_inventory()
    for _, item1 in ipairs(drop) do
        if nodename.name ~= 'air' and minetest.get_node_group(nodename.name, "liquid") == 0 then inv:add_item("main", item1) end
    end
    simpleminer_mine(nodeposs)
    simpleminer_pos["q"..pos.x.."-"..pos.z]=simpleminer_pos["q"..pos.x.."-"..pos.z]+1
	minetest.env:add_node( nodeposs, { name='lulzpack:quarrydiggerpole' } ) 
    meta:set_int("energy",meta:get_int("energy")-30)
    end
end

simpleminer_energy=function(pos,node)
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:nyon_ingot", "energy", math.random(60,70), nil) 
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:ununterx_ingot", "energy", math.random(120,140), nil) 
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:ununbet_ingot", "energy", math.random(210,265), nil) 
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:ununsen_ingot", "energy", math.random(305,450), nil) 
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:terxbet_can", "energy", math.random(1000,1200), "lulzpack:empty_can")
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:senbet_can", "energy", math.random(1500,2700), "lulzpack:empty_can")
    SIMPLEMINERupdate_formspec(pos)
end

function simpleminer_mine(pos)
       minetest.env:set_node(pos, {name='air'})
end

minetest.register_abm ({
        nodenames = {"lulzpack:simple_miner"},
        interval = 2,
        chance = 1,
        action = activatesimpleminer
})

minetest.register_abm ({
        nodenames = {"lulzpack:simple_miner"},
        interval = 4,
        chance = 1,
        action = simpleminer_energy
})

minetest.register_on_shutdown(function()
persistence.store(minetest.get_modpath("lulzpack") .. "/simpleminerdb.pny",simpleminer_pos) end)

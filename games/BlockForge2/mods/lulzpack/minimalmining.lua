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

local function get_nodedef_field(nodename, fieldname)
    if not minetest.registered_nodes[nodename] then
        return nil
    end
    return minetest.registered_nodes[nodename][fieldname]
end

local activateminimalminingmachine = function(pos,node)
local meta = minetest.env:get_meta(pos)
if meta:get_int("energy") > 10 then 
    --if meta:get_int("lets_dig") == 1 then
    nodeposs={x=pos.x,y=pos.y - 1,z=pos.z}
    nodename=minetest.env:get_node(nodeposs)
    local drop=minetest.get_node_drops(nodename.name)
    local inv = meta:get_inventory()
    for _, item1 in ipairs(drop) do
        if nodename.name ~= 'air' and nodename.name ~= 'lulzpack:quarrydiggerpole' and minetest.get_node_group(nodename.name, "liquid") == 0 then inv:add_item("main", item1) end
    end
	if minetest.env:get_node(nodeposs).name ~= 'lulzpack:quarrydiggerpole' then 
        minetest.env:add_node( nodeposs, { name='lulzpack:quarrydiggerpole' } ) 
    elseif minetest.env:get_node(nodeposs).name == 'lulzpack:quarrydiggerpole' then 
        minetest.env:add_node( nodeposs, { name='air' } )
    end
    meta:set_int("energy",meta:get_int("energy")-10)
    end
end

local activatelateralminingmachine = function(pos,node)
local meta = minetest.env:get_meta(pos)
if meta:get_int("energy") > 10 then 
    --if meta:get_int("lets_dig") == 1 then
    nodeposs={
    {x=pos.x+1,y=pos.y,z=pos.z},
    {x=pos.x-1,y=pos.y,z=pos.z},
    {x=pos.x,y=pos.y,z=pos.z+1},
    {x=pos.x,y=pos.y,z=pos.z-1} }
    nodenames={
    minetest.env:get_node(nodeposs[1]),
    minetest.env:get_node(nodeposs[2]),
    minetest.env:get_node(nodeposs[3]),
    minetest.env:get_node(nodeposs[4])}
    drops={
    minetest.get_node_drops(nodenames[1].name),
    minetest.get_node_drops(nodenames[2].name),
    minetest.get_node_drops(nodenames[3].name),
    minetest.get_node_drops(nodenames[4].name)}
    local inv = meta:get_inventory()
    for i=1,4 do
        for _, item in ipairs(drops[i]) do
            if nodenames[i].name ~= 'air' and minetest.get_node_group(nodenames[i].name, "liquid") == 0 and nodenames[i].name ~= 'lulzpack:quarrydiggerpole_lateral' then inv:add_item("main", item) end
            minetest.env:add_node( nodeposs[i], { name='air' } )
        end
    end
    meta:set_int("energy",meta:get_int("energy")-20)
    end
end

minimalminingmachine_energy=function(pos,node)
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:nyon_ingot", "energy", math.random(60,70), nil) 
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:ununterx_ingot", "energy", math.random(120,140), nil) 
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:ununbet_ingot", "energy", math.random(210,265), nil) 
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:ununsen_ingot", "energy", math.random(305,450), nil) 
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:terxbet_can", "energy", math.random(1000,1200), "lulzpack:empty_can")
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:senbet_can", "energy", math.random(1500,2700), "lulzpack:empty_can")
    MINIMALMININGupdate_formspec(pos)
end

lateralminingmachine_energy=function(pos,node)
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:nyon_ingot", "energy", math.random(60,70), nil) 
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:ununterx_ingot", "energy", math.random(120,140), nil) 
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:ununbet_ingot", "energy", math.random(210,265), nil) 
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:ununsen_ingot", "energy", math.random(305,450), nil) 
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:terxbet_can", "energy", math.random(1000,1200), "lulzpack:empty_can")
    add_simpleminer_fuel(pos, node, "fuels", "lulzpack:senbet_can", "energy", math.random(1500,2700), "lulzpack:empty_can")
    MINIMALMININGupdate_formspec(pos)
end

function minimalminingmachine_mine(pos)
       minetest.env:set_node(pos, {name='air'})
end

minetest.register_abm ({
        nodenames = {"lulzpack:minimal_mining"},
        interval = 2,
        chance = 1,
        action = activateminimalminingmachine
})

minetest.register_abm ({
        nodenames = {"lulzpack:minimal_mining"},
        interval = 4,
        chance = 1,
        action = minimalminingmachine_energy
})

minetest.register_abm ({
        nodenames = {"lulzpack:lateral_mining"},
        interval = 2,
        chance = 1,
        action = activatelateralminingmachine
})

minetest.register_abm ({
        nodenames = {"lulzpack:lateral_mining"},
        interval = 4,
        chance = 1,
        action = lateralminingmachine_energy
})

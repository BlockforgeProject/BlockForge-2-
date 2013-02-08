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


function default_nodedrop(pos, drops, digger)
-- Add dropped items to object's inventory
if digger:get_inventory() then
local _, dropped_item
for _, dropped_item in ipairs(drops) do
digger:get_inventory():add_item("main", dropped_item)
end
        
        args={}
        args.drops=drops
        args.digger=digger

            execIfProtected(pos,function(args)
                for _, dropped_item in ipairs(args.drops) do
                    args.digger:get_inventory():remove_item("main",dropped_item)
                end
            end,args)
        
end
end

function minetest.handle_node_drops(pos, drops, digger)
    if enable_corehack == false then return default_nodedrop(pos, drops, digger) end
        if digger:get_inventory() then
                local _, dropped_item
                for _, dropped_item in ipairs(drops) do
            minetest.env:add_item(pos,dropped_item)
                end
        end
end


function execIfProtected(pos,func,args)
end


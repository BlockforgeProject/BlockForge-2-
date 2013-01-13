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

--Item-Dropping on node breaking
--This just redefine the original function

function default_nodedrop(pos, drops, digger)
	-- Add dropped items to object's inventory
	if digger:get_inventory() then
		local _, dropped_item
		for _, dropped_item in ipairs(drops) do
			digger:get_inventory():add_item("main", dropped_item)
		end
	end
end

function checkProtection(pos)
end

function minetest.handle_node_drops(pos, drops, digger)
minetest.after(1 ,function(args)
    if checkProtection(pos) then return end --Compatibility with "firewall" mod
    if minetest.setting_get("lulzpack_deactivate_corehack") then return default_nodedrop(pos, drops, digger) end
	if digger:get_inventory() then
		local _, dropped_item
		for _, dropped_item in ipairs(drops) do
            minetest.env:add_item(pos,dropped_item)
		end
	end
end)
end 

--[[minetest.register_globalstep(function(dtime)
    for _,player in ipairs(minetest.get_connected_players()) do
        local items= minetest.env:get_objects_inside_radius(player:getpos(), 2)
        for _,item in ipairs(items) do
            local ent=item:get_luaentity()
            local pl=item:is_player()
            if ent and ent.name == '__builtin:item' and pl == false then minetest.after(1 ,function(args) 
                player:get_inventory():add_item("main", ItemStack(ent.itemstring))
                item:remove() end) end
            end
        end
end)]]

--[[Used in item_entity.lua


minetest.register_entity("__builtin:item", {
	...
    end,
})]]

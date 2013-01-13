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

function execIfProtected(pos,func,args)
end

function default_nodedrop(pos, drops, digger)
	-- Add dropped items to object's inventory
	if digger:get_inventory() then
		local _, dropped_item
		for _, dropped_item in ipairs(drops) do
			digger:get_inventory():add_item("main", dropped_item)
		end
        if enable_firewallmod == true then
            execIfProtected(pos,function(args)
                for _, dropped_item in ipairs(drops) do
                    digger:get_inventory():remove_item("main",dropped_item)
                end
            end,args)
        end
	end
end

function minetest.handle_node_drops(pos, drops, digger)
local args={}
args.pos=pos
args.drops=drops
args.digger=digger
execIfUnprotected(pos,function(args)
    if enable_corehack == false then return default_nodedrop(args.pos, args.drops, args.digger) end
        if args.digger:get_inventory() then
                local _, dropped_item
                for _, dropped_item in ipairs(drops) do
            minetest.env:add_item(args.pos,dropped_item)
                end
        end
end,args)
end


function execIfUnprotected(pos,func,args)
    func(args)
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

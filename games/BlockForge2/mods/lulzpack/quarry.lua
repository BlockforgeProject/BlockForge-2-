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


quarry_pos = {}
quarry_pos = persistence.load(minetest.get_modpath("lulzpack") .. "/quarrydb.pny")
if quarry_pos==nil then quarry_pos={} end

local activatequarry = function(pos, node)
local meta = minetest.env:get_meta(pos)
local digs=quarry_pos["q"..pos.x.."-"..pos.z] if digs==nil then return end
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
            local chestposs={x=pos.x,y=pos.y+2,z=pos.z}
            local chest_meta=minetest.env:get_meta(chestposs)
            local chest_inv=chest_meta:get_inventory()
            for _, item1 in ipairs(drop1) do
            if nodenames[1].name ~= 'air' then if check_for_chest then chest_inv:add_item("main",item1) else inv:add_item("main", item1) end end
            end
            for _, item2 in ipairs(drop2) do
            if nodenames[2].name  ~= 'air' then if check_for_chest then chest_inv:add_item("main",item2) else inv:add_item("main", item2) end end
            end
            for _, item3 in ipairs(drop3) do
            if nodenames[3].name  ~= 'air' then if check_for_chest then chest_inv:add_item("main",item3) else inv:add_item("main", item3) end end
            end
            for _, item4 in ipairs(drop4) do
            if nodenames[4].name  ~= 'air' then if check_for_chest then chest_inv:add_item("main",item4) else inv:add_item("main", item4) end end
            end
            for _, item5 in ipairs(drop5) do
            if nodenames[5].name  ~= 'air' then if check_for_chest then chest_inv:add_item("main",item5) else inv:add_item("main", item5) end end
            end
            for _, item6 in ipairs(drop6) do
            if nodenames[6].name  ~= 'air' then if check_for_chest then chest_inv:add_item("main",item6) else inv:add_item("main", item6) end end
            end
            for _, item7 in ipairs(drop7) do
            if nodenames[7].name  ~= 'air' then if check_for_chest then chest_inv:add_item("main",item7) else inv:add_item("main", item7) end end
            end
            for _, item8 in ipairs(drop8) do
            if nodenames[8].name  ~= 'air' then if check_for_chest then chest_inv:add_item("main",item8) else inv:add_item("main", item8) end end
            end
            for _, item9 in ipairs(drop9) do
            if nodenames[9].name  ~= 'air' then if check_for_chest then chest_inv:add_item("main",item9) else inv:add_item("main", item9) end end
            end
			--minetest.env:remove_node( quarrypos )
            for i=1, 9 do
            --if minetest.setting_get("lulzpack_deactivate_lockedchest_own") then return quarry_mine(quarryposs[i]) end
                if nodenames[i].name == 'default:chest_locked' or nodenames[i].name == 'default:chest' then
                    local chest_meta = minetest.env:get_meta(quarryposs[i])
                    local chest_inv = chest_meta:get_inventory()
                    local meta = minetest.env:get_meta(pos)
                    local inv = meta:get_inventory()
                    --
                    local inv_chestposs={x=pos.x,y=pos.y+2,z=pos.z}
                    local inv_chest_meta=minetest.env:get_meta(inv_chestposs)
                    local inv_chest_inv=inv_chest_meta:get_inventory()
                    --
                    for i=1,chest_inv:get_size("main") do
                        local item=chest_inv:get_stack("main",i)
                        count=item:get_count()
                        if count <= 99 then
                            for i=1,count do 
                            if check_for_chest then inv_chest_inv:add_item("main",item:get_name()) else
                            inv:add_item("main",item:get_name()) end end
                       end  
                    end    
                end  
			    quarry_mine(quarryposs[i])           
            end
            quarry_pos["q"..pos.x.."-"..pos.z]=quarry_pos["q"..pos.x.."-"..pos.z]+1
			minetest.env:add_node( quarrypos2, { name='lulzpack:quarrydiggerpole' } )
	    end
    end
end

function quarry_mine(pos)
     --minetest.env:dig_node(pos)
       minetest.env:set_node(pos, {name='air'})
end

function check_for_chest(pos)
local chestpos={x=pos.x,y=pos.y+2,z=pos.z}
    if chestpos:get_node().name == "default:chest" then return true
    else return false end
end

minetest.register_abm ({
        nodenames = {"lulzpack:quarry"},
        interval = 2,
        chance = 1,
        action = activatequarry
})

minetest.register_on_shutdown(function()
persistence.store(minetest.get_modpath("lulzpack") .. "/quarrydb.pny",quarry_pos) end)

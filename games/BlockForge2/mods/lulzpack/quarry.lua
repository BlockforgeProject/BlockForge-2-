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
            drop = {
            minetest.get_node_drops(nodenames[1].name),
	        minetest.get_node_drops(nodenames[2].name),
	        minetest.get_node_drops(nodenames[3].name),
	        minetest.get_node_drops(nodenames[4].name),
	        minetest.get_node_drops(nodenames[5].name),
	        minetest.get_node_drops(nodenames[6].name),
	        minetest.get_node_drops(nodenames[7].name),
	        minetest.get_node_drops(nodenames[8].name),
	        minetest.get_node_drops(nodenames[9].name)}
			--DIGGING
            local inv = meta:get_inventory()
            local chestposs={x=pos.x,y=pos.y+2,z=pos.z}
            local chest_meta=minetest.env:get_meta(chestposs)
            local chest_inv=chest_meta:get_inventory()
            item={}
            local chestpos={x=pos.x,y=pos.y+2,z=pos.z}
            for i=1,9 do
                for _, item_pointed in ipairs(drop[i]) do
                    if nodenames[i].name ~= 'air' then 
                        if minetest.env:get_node(chestpos).name == "default:chest" then
                            chest_inv:add_item("main",item_pointed)
                        else
                            inv:add_item("main",item_pointed) end 
                        end
                    end
                end                    
            end
            --[[for i=1, 9 do
                if nodenames[i].name == 'default:chest_locked' or nodenames[i].name == 'default:chest' then
                    local chest_meta = minetest.env:get_meta(quarryposs[i])
                    local chest_inv = chest_meta:get_inventory()
                    local meta = minetest.env:get_meta(pos)
                    local inv = meta:get_inventory()
                    local inv_chestposs={x=pos.x,y=pos.y+2,z=pos.z}
                    local inv_chest_meta=minetest.env:get_meta(inv_chestposs)
                    local inv_chest_inv=inv_chest_meta:get_inventory()
                    for i=1,chest_inv:get_size("main") do
                        local item=chest_inv:get_stack("main",i)
                        count=item:get_count()
                        if count <= 99 then
                            for i=1,count do 
                            if minetest.env:get_node(inv_chestposs).name == "default:chest" then 
                            inv_chest_inv:add_item("main",item:get_name()) else
                            inv:add_item("main",item:get_name()) end end
                       end  
                    end    
                end]]  
			    quarry_mine(quarryposs[i])           
            end
            quarry_pos["q"..pos.x.."-"..pos.z]=quarry_pos["q"..pos.x.."-"..pos.z]+1
			minetest.env:add_node( quarrypos2, { name='lulzpack:quarrydiggerpole' } )
	    end
    --end

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

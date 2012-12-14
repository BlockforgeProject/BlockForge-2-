--  _______          _     _______
-- (_______)        | |   (_______)                                  _
--  _____ ___   ____| |  _ _____ ___   ____ ____  ____   ____   ____| |_
-- |  ___) _ \ / ___) | / )  ___) _ \ / ___) _  |/ _  ) |  _ \ / _  )  _)
-- | |  | |_| | |   | |< (| |  | |_| | |  ( ( | ( (/ / _| | | ( (/ /| |__
-- |_|   \___/|_|   |_| \_)_|   \___/|_|   \_|| |\____|_)_| |_|\____)\___)
--                                        (_____|
--
-- ######################################################################
--     		               LULZPACK | BLOCKFORGE 2#
-- ######################################################################
--
--
-- This project is granted under the zlib license.
-- You can modify or redistribute it under the zlib conditions.

pwned=function(player, drops)
    if minetest.setting_get("time2pwn_deactivate") then return end
     pos=player:getpos()
     itempos={x=pos.x,y=pos.y+1,z=pos.z}
     local inv=player:get_inventory()
     for i=1,32 do
        local item=inv:get_stack("main", i)
        count=item:get_count()
        if count <= 99 then
            for i=1,count do
                minetest.env:add_item(itempos,item:get_name()) end
            inv:set_stack("main", i, nil)
            for i=1,9 do inv:set_stack("craft", i,nil) end
            inv:set_stack("craftpreview", 1,nil)
        end
     end
end


minetest.register_on_dieplayer(pwned)

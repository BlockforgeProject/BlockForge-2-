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

iron_wire_fix = { -0.5, -0.469, -0.5 , 0.5, -0.47, 0.5 }

minetest.register_node("lulzpack:iron_wire", {
    drawtype="nodebox",
	description = "Iron Wire",
	sunlight_propagates = true,
    paramtype="light",
	tiles ={"iron_wire.png","iron_wire.png"},
	groups = {cracky=2},
    on_construct=function(pos)
    --minetest.chat_send_all("Wire placed")
    local meta = minetest.env:get_meta(pos)
    meta:set_int("energized",0)   
    meta:set_int("wire",1)
    meta:set_int("ID",0) end,  
	selection_box = {
        type = "fixed",
        fixed = iron_wire_fix
    },
	node_box = {
        type = "fixed",
        fixed = iron_wire_fix
    }, 
	sounds = default.node_sound_stone_defaults(),
})

checkout = function(pos,node,puncher) 
        local meta = minetest.env:get_meta(pos)
        minetest.chat_send_player(puncher:get_player_name(),"ID=" .. meta:get_string("ID") .. "") 
        minetest.chat_send_player(puncher:get_player_name(),"Energy=" .. meta:get_string("energized") .. "") 
    end

minetest.register_on_punchnode(checkout)

energy = function(pos, node)
    --Energizing
    --minetest.chat_send_all("Energyzing initialized") 
    pos1 = {x=pos.x+1,y=pos.y,z=pos.z}    
    pos2 = {x=pos.x-1,y=pos.y,z=pos.z}
    pos3 = {x=pos.x,y=pos.y,z=pos.z+1}
    pos4 = {x=pos.x,y=pos.y,z=pos.z-1}
    local meta = minetest.env:get_meta(pos)
    local meta1 = minetest.env:get_meta(pos1)
    local meta2 = minetest.env:get_meta(pos2)
    local meta3 = minetest.env:get_meta(pos3)
    local meta4 = minetest.env:get_meta(pos4)    
    if meta:get_int("energized") == 1 then
    local ID = meta:get_int("ID")
    if meta:get_int("ID") == 0 and meta:get_int("wire") ~= 1 then
    if meta1:get_int("ID") <= ID then meta1:set_int("ID",ID+1) meta1:set_int("energized",1) end
    if meta2:get_int("ID") <= ID then meta2:set_int("ID",ID+1) meta2:set_int("energized",1) end
    if meta3:get_int("ID") <= ID then meta3:set_int("ID",ID+1) meta3:set_int("energized",1) end
    if meta4:get_int("ID") <= ID then meta4:set_int("ID",ID+1) meta4:set_int("energized",1) end
    else  
    if meta1:get_int("ID") < ID then meta1:set_int("ID",ID+1) meta1:set_int("energized",1) end
    if meta2:get_int("ID") < ID then meta2:set_int("ID",ID+1) meta2:set_int("energized",1) end
    if meta3:get_int("ID") < ID then meta3:set_int("ID",ID+1) meta3:set_int("energized",1) end
    if meta4:get_int("ID") < ID then meta4:set_int("ID",ID+1) meta4:set_int("energized",1) end
    end
    end
end 

unenergy = function(pos, node)
    --Energizing
    --minetest.chat_send_all("Energyzing initialized") 
    pos1 = {x=pos.x+1,y=pos.y,z=pos.z}    
    pos2 = {x=pos.x-1,y=pos.y,z=pos.z}
    pos3 = {x=pos.x,y=pos.y,z=pos.z+1}
    pos4 = {x=pos.x,y=pos.y,z=pos.z-1}
    local meta = minetest.env:get_meta(pos)
    local meta1 = minetest.env:get_meta(pos1)
    local meta2 = minetest.env:get_meta(pos2)
    local meta3 = minetest.env:get_meta(pos3)
    local meta4 = minetest.env:get_meta(pos4)    
    if meta1:get_int("ID") < meta:get_int("ID") and meta2:get_int("ID") < meta1:get_int("ID") and meta3:get_int("ID") < meta1:get_int("ID") and meta4:get_int("ID") < meta1:get_int("ID") then
    --meta1:get_int("wire") == 1 or meta2:get_int("wire") == 1 or meta3:get_int("wire") == 1 or meta4:get_int("wire") == 1 then
    meta:set_int("energized",0) end
end


minetest.register_abm {
    nodenames = {"lulzpack:stone_generator"},
    interval = 1.0,
    chance = 1,
    action = energy,
} 

--[[minetest.register_abm {
    nodenames = {"lulzpack:iron_wire"},
    interval = 1.0,
    chance = 1,
    action = unenergy,
}]]

minetest.register_abm {
    nodenames = {"lulzpack:iron_wire"},
    interval = 1.0,
    chance = 1,
    action = energy,
} 

minetest.register_node("lulzpack:stone_generator", {
	description = "Stone Generator",
	sunlight_propagates = true,
    paramtype="light",
	tiles ={"default_stone.png"},
	groups = {crumbly=3},
    on_construct = function(pos)
    minetest.chat_send_all("Generator placed")
    local meta = minetest.env:get_meta(pos)
    meta:set_int("energized",1)
    meta:set_int("ID",0)  end,
	sounds = default.node_sound_stone_defaults(),
})

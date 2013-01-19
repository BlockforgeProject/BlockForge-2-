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

minetest.register_node("lulzpack:mill_gen", {
    description = "Mill Generator",
	tiles = {{name="millgen_above.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}},"quarry_side.png"},
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_int("energy", 0)
		meta:set_string("formspec",
	    "size[8,9]"..
	    "list[current_name;fuel;2,2;3,1;]"..
        "label[5,2,energytext]"..
        "list[current_name;Energy: " .. meta:get_int("energy") .. "]"..
	    "list[current_player;main;0,5;8,4;]")
		local inv = meta:get_inventory()
        inv:set_size("fuel",3)
	end,
	groups = {cracky=3}
})

minetest.register_node("lulzpack:water_mill", {
    description = "Water Mill",
	tiles = {{name="watermill_above.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1.0}},"electrofurnace_side.png"},
    drawtype="nodebox",
    light_source=10,
	groups = {cracky=2},
	selection_box = {
        type = "fixed",
        fixed = { -0.5, -0.5, -0.5 , 0.5, 0, 0.5},
    },
	node_box = {
        type = "fixed",
        fixed = { -0.5, -0.5, -0.5 , 0.5, 0, 0.5}
    }
})

minetest.register_craft({
	output = 'lulzpack:mill_gen',
	recipe = {
		{'default:steel_ingot','default:steel_ingot','default:steel_ingot'},
		{'lulzpack:industrial_iron','lulzpack:intbattery','lulzpack:industrial_iron'},
		{'lulzpack:industrial_iron','lulzpack:controlpanel','lulzpack:industrial_iron'},
	}
})

minetest.register_craft({
	output = 'lulzpack:water_mill',
	recipe = {
		{'','lulzpack:industrial_iron',''},
		{'lulzpack:industrial_iron','lulzpack:redyz_ingot','lulzpack:industrial_iron'},
		{'','lulzpack:industrial_iron',''},
	}
})

function MILLGENupdate_formspec(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
	        "size[8,9]"..
	        "list[current_name;fuel;2,2;3,1;]"..
            "label[5,2,energytext]"..
            "list[current_name;Energy: " .. meta:get_int("energy") .. "]"..
	        "list[current_player;main;0,5;8,4;]")
end

mill_gen_energy = function(pos, node)
		local meta = minetest.env:get_meta(pos)
        local inv = meta:get_inventory()
        add_gen_fuel(pos, node, "fuel", "lulzpack:lava_block", "energy", math.random(100,120), nil)
        add_gen_fuel(pos, node, "fuel", "lulzpack:water_block", "energy", math.random(20,35), nil)
        add_gen_fuel(pos, node, "fuel", "bucket:bucket_lava", "energy", math.random(80,100), "bucket:bucket_empty")
        add_gen_fuel(pos, node, "fuel", "bucket:bucket_water", "energy", math.random(20,30), "bucket:bucket_empty")
        add_gen_fuel(pos, node, "fuel", "lulzpack:obsidian_bucket_meltedcelis", "energy", math.random(200,300), "lulzpack:obsidian_bucket_empty")
        add_gen_fuel(pos, node, "fuel", "lulzpack:obsidian_bucket_meltedlyra", "energy", math.random(120,150), "lulzpack:obsidian_bucket_empty")
        add_gen_fuel(pos, node, "fuel", "lulzpack:obsidian_bucket_meltediron", "energy", math.random(110,130), "lulzpack:obsidian_bucket_empty")
        add_gen_fuel(pos, node, "fuel", "lulzpack:obsidian_bucket_oil", "energy", math.random(450,550), "lulzpack:obsidian_bucket_empty")
        add_gen_fuel(pos, node, "fuel", "lulzpack:obsidian_bucket_gasoline", "energy", math.random(2000,2700), "lulzpack:obsidian_bucket_empty")
        add_gen_fuel(pos, node, "fuel", "lulzpack:terxbet_can", "energy", math.random(1000,1200), "lulzpack:empty_can")
        add_gen_fuel(pos, node, "fuel", "lulzpack:senbet_can", "energy", math.random(1500,2700), "lulzpack:empty_can")
        MILLGENupdate_formspec(pos)
end

water_mill_energy = function(pos, node)
    local mach_pos={x=pos.x,y=pos.y-1,z=pos.z}
    local water_pos={x=pos.x,y=pos.y+1,z=pos.z}
    if minetest.env:get_node(water_pos).name == 'default:water_source' then if minetest.env:get_meta(mach_pos):get_int("energy") >= 0 then
    minetest.env:get_meta(mach_pos):set_int("energy",minetest.env:get_meta(mach_pos):get_int("energy")+math.random(3,7))
    end end
    if minetest.env:get_node(water_pos).name == 'default:water_flowing' then if minetest.env:get_meta(mach_pos):get_int("energy") >= 0 then
    minetest.env:get_meta(mach_pos):set_int("energy",minetest.env:get_meta(mach_pos):get_int("energy")+math.random(10,15))
    end end
end

minetest.register_abm {
    nodenames = {"lulzpack:mill_gen"},
    interval = 4,
    chance = 1,
    action = mill_gen_energy,
} 

minetest.register_abm {
    nodenames = {"lulzpack:water_mill"},
    interval = 2,
    chance = 1,
    action = water_mill_energy,
}

--[[WIP
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
    local ID = meta:get_int("ID") 
    if meta:get_int("energized") == 1 then
    if meta:get_int("ID") == 0 and meta:get_int("wire") ~= 1 then
    if meta1:get_int("ID") <= ID then meta1:set_int("ID",ID+1) meta1:set_int("energized",1) end
    if meta2:get_int("ID") <= ID then meta2:set_int("ID",ID+1) meta2:set_int("energized",1) end
    if meta3:get_int("ID") <= ID then meta3:set_int("ID",ID+1) meta3:set_int("energized",1) end
    if meta4:get_int("ID") <= ID then meta4:set_int("ID",ID+1) meta4:set_int("energized",1) end
    elseif meta:get_int("wire") == 1 then
    if meta1:get_int("ID")==ID+1 then meta:set_int("ID",ID+1) meta:set_int("energized",1) end
    if meta2:get_int("ID")==ID+1 then meta:set_int("ID",ID+1) meta:set_int("energized",1) end
    if meta3:get_int("ID")==ID+1 then meta:set_int("ID",ID+1) meta:set_int("energized",1) end
    if meta4:get_int("ID")==ID+1 then meta:set_int("ID",ID+1) meta:set_int("energized",1) end
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
    --if meta1:get_int("energized") < meta:get_int("ID") and meta2:get_int("ID") < meta:get_int("ID") and meta3:get_int("ID") < meta:get_int("ID") and meta4:get_int("ID") < meta:get_int("ID") then
    --meta1:get_int("wire") == 1 or meta2:get_int("wire") == 1 or meta3:get_int("wire") == 1 or meta4:get_int("wire") == 1 then
    --meta:set_int("energized",0) end
end


minetest.register_abm {
    nodenames = {"lulzpack:stone_generator"},
    interval = 1.0,
    chance = 1,
    action = energy,
} 

minetest.register_abm {
    nodenames = {"lulzpack:iron_wire"},
    interval = 1.0,
    chance = 1,
    action = unenergy,
}

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
})]]

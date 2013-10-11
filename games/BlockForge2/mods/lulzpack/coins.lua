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

minetest.register_craftitem("lulzpack:lyra_coin", {
	description = "Lyra Coin",
	inventory_image = "lyra_coin.png",
})

minetest.register_craftitem("lulzpack:celis_coin", {
	description = "Celis Coin",
	inventory_image = "celis_coin.png",
})

minetest.register_craftitem("lulzpack:cryoas_coin", {
	description = "Cryoas Coin",
	inventory_image = "cryoas_coin.png",
})

minetest.register_craftitem("lulzpack:steel_coin", {
	description = "Steel Coin",
	inventory_image = "steel_coin.png",
})
--Coinerator
minetest.register_node("lulzpack:coinerator", {
	description = "Coin-erator",
	tiles = {"industrialfurnace_top.png", "industrialfurnace_bottom.png", "industrialfurnace_side.png",
		"industrialfurnace_side.png", "industrialfurnace_side.png", "coinerator_front.png"},
	paramtype2 = "facedir",
	groups = {cracky=1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
                "label[2.1,0.4,source]"..
	            "list[current_name;Source]"..
	            "list[current_name;src;2,1;1,1;]"..
                "label[5.65,0.4,coins]"..
	            "list[current_name;Coins]"..
	            "list[current_name;dst;5,1;2,2;]"..
	            "list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Coin-erator")
		local inv = meta:get_inventory()
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
	end,
})

local activatecoinerator = function(pos,node)
    local meta = minetest.env:get_meta(pos)
    local inv = meta:get_inventory()
    local gen_meta = minetest.env:get_meta({x=pos.x,y=pos.y+1,z=pos.z})
    local energy = gen_meta:get_int("energy")
    add_coinerator_recipe(pos, "lulzpack:lyra_ingot","lulzpack:lyra_coin 9", gen_meta,energy, 20)
    add_coinerator_recipe(pos, "lulzpack:celis_ingot","lulzpack:celis_coin 9", gen_meta,energy, 30)
    add_coinerator_recipe(pos, "default:steel_ingot","lulzpack:steel_coin 9", gen_meta,energy, 20)
    add_coinerator_recipe(pos, "lulzpack:cryoas_ingot","lulzpack:cryoas_coin 9", gen_meta,energy, 40)
end
minetest.register_abm ({
        nodenames = {"lulzpack:coinerator"},
        interval = 4,
        chance = 1,
        action = activatecoinerator
})

--Recipes

minetest.register_craft({
    output = 'lulzpack:lyra_coin 9',
    recipe ={ 
            {'','lulzpack:lyra_ingot',''},
            {'lulzpack:lyra_ingot','lulzpack:lyra_ingot','lulzpack:lyra_ingot'},
            {'','lulzpack:lyra_ingot',''} }
}) 

minetest.register_craft({
    output = 'lulzpack:lyra_ingot',
    recipe ={ 
            {'lulzpack:lyra_coin','lulzpack:lyra_coin','lulzpack:lyra_coin'},
            {'lulzpack:lyra_coin','lulzpack:lyra_coin','lulzpack:lyra_coin'},
            {'lulzpack:lyra_coin','lulzpack:lyra_coin','lulzpack:lyra_coin'} }
}) 

minetest.register_craft({
    output = 'lulzpack:celis_coin 9',
    recipe ={ 
            {'','lulzpack:celis_ingot',''},
            {'lulzpack:celis_ingot','lulzpack:celis_ingot','lulzpack:celis_ingot'},
            {'','lulzpack:celis_ingot',''} }
}) 

minetest.register_craft({
    output = 'lulzpack:celis_ingot',
    recipe ={ 
            {'lulzpack:celis_coin','lulzpack:celis_coin','lulzpack:celis_coin'},
            {'lulzpack:celis_coin','lulzpack:celis_coin','lulzpack:celis_coin'},
            {'lulzpack:celis_coin','lulzpack:celis_coin','lulzpack:celis_coin'} }
})

minetest.register_craft({
    output = 'lulzpack:cryoas_coin 9',
    recipe ={ 
            {'','lulzpack:cryoas_ingot',''},
            {'lulzpack:cryoas_ingot','lulzpack:cryoas_ingot','lulzpack:cryoas_ingot'},
            {'','lulzpack:cryoas_ingot',''} }
}) 

minetest.register_craft({
    output = 'lulzpack:cryoas_ingot',
    recipe ={ 
            {'lulzpack:cryoas_coin','lulzpack:cryoas_coin','lulzpack:cryoas_coin'},
            {'lulzpack:cryoas_coin','lulzpack:cryoas_coin','lulzpack:cryoas_coin'},
            {'lulzpack:cryoas_coin','lulzpack:cryoas_coin','lulzpack:cryoas_coin'} }
})

minetest.register_craft({
    output = 'lulzpack:steel_coin 9',
    recipe ={ 
            {'','default:steel_ingot',''},
            {'default:steel_ingot','default:steel_ingot','default:steel_ingot'},
            {'','default:steel_ingot',''} }
}) 

minetest.register_craft({
    output = 'default:steel_ingot',
    recipe ={ 
            {'lulzpack:steel_coin','lulzpack:steel_coin','lulzpack:steel_coin'},
            {'lulzpack:steel_coin','lulzpack:steel_coin','lulzpack:steel_coin'},
            {'lulzpack:steel_coin','lulzpack:steel_coin','lulzpack:steel_coin'} }
})

minetest.register_craft({
    output = 'lulzpack:coinerator',
    recipe ={ 
            {'default:steel_ingot','lulzpack:electrodrill','default:steel_ingot'},
            {'default:cobble','default:steel_ingot','default:cobble'},
            {'default:steel_ingot','default:steel_ingot','default:steel_ingot'},}
}) 


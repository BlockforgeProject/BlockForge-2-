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

minetest.register_node("lulzpack:recharger", {
    description = "Recharger",
	tiles = {{name="recharger_front.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}},"quarry_side.png",{name="millgen_above.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}}},
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
	    "size[8,9]"..
        "label[3.7,1.3;Items]"..
	    "list[current_name;items;2,2;4,1;]"..
	    "list[current_player;main;0,5;8,4;]")
		local inv = meta:get_inventory()
        inv:set_size("items",4)
	end,
	groups = {cracky=2}
})

minetest.register_craft({
	output = 'lulzpack:recharger',
	recipe = {
		{'lulzpack:celis_ingot','lulzpack:celis_ingot','lulzpack:celis_ingot'},
		{'lulzpack:industrial_iron','lulzpack:mill_gen','lulzpack:industrial_iron'},
        {'lulzpack:iron_plate','lulzpack:iron_plate','lulzpack:iron_plate'},
	}
})

function recharger_recharging(pos, node)
    add_recharger_item(pos,"lulzpack:chainsaw_lyra",1000,100)
    add_recharger_item(pos,"lulzpack:chainsaw_celis",800,80)
    add_recharger_item(pos,"lulzpack:chainsaw_nyon",500,50)
    add_recharger_item(pos,"lulzpack:electroauger_lyra",2000,110)
    add_recharger_item(pos,"lulzpack:electroauger_celis",1500,90)
    add_recharger_item(pos,"lulzpack:electroauger_nyon",1000,70)
    add_recharger_item(pos,"lulzpack:electro_fns",5000,20)
end

minetest.register_abm {
    nodenames = {"lulzpack:recharger"},
    interval = 1,
    chance = 1,
    action = recharger_recharging,
} 


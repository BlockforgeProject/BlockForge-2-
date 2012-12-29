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

minetest.register_node("lulzpack:electro_craftingtable", {
    description = "Electro Crafting Table",
	tiles = {"electrocrafting_above.png","electrofurnace_side.png"},
    drop = 'lulzpack:electro_craftingtable',
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;crafting;0.5,0.5;4,4;]"..
                "label[5.65,1.5;Output]"..
			    "list[current_name;craftpreview;5.5,2;1,1;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Electro Crafting Table")
		local inv = meta:get_inventory()
		inv:set_size("crafting", 4*4)
		inv:set_size("craftpreview", 1)
	end,
	groups = {cracky=2},
})

function check(pos)
    local meta=minetest.env:get_meta(pos)
    local inv=meta:get_inventory()
    local crafting=inv:get_list("crafting")
    result=minetest.get_craft_result({method="normal",width=16,items=crafting})
    if not result == nil then 
    print 'test'
    inv:set_stack("craftpreview",1,result.item) 
    inv:set_stack("crafting",1,nil)
    end          
end 

minetest.register_craft({
	output = 'default:glass 15',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass','default:glass'},
		{'default:glass', 'default:glass', 'default:glass','default:glass'},
		{'default:glass', 'default:glass', 'default:glass','default:glass'},
		{'default:glass', 'default:glass', 'default:glass','default:glass'},
	}
})

minetest.register_abm({
    nodenames="lulzpack:electro_craftingtable",
    interval=1,
    chance=1,
    action=check
})

--ELECTROCRAFTING RECIPES

--[[function lulzpack.register_electrocraft(
    pos,
    output,
    space1,
    space2,
    space3,
    space4,
    space5,
    space6,
    space7,
    space8,
    space9,
    space10,
    space11,
    space12,
    space13,
    space14,
    space15,
    space16
    )
        stack={[1]=space1,[2]=space2,[3]=space3,[4]=space4,
               [5]=space5,[6]=space6,[7]=space7,[8]=space8,
               [9]=space9,[10]=space10,[11]=space11,[12]=space12,
               [13]=space13,[14]=space14,[15]=space15,[16]=space16}
        local meta=minetest.env:get_meta(pos)
        local inv=meta:get_inventory()
        for i=1,16 do
            local craftitem_name=inv:get_stack("crafting", i).stackstring
            if craftitem_name == stack[i] then print 'test' end
        end
end

minetest.register_abm({
    nodenames="lulzpack:electro_craftingtable",
    interval=1,
    chance=1,
    action=function(pos,node) 
    lulzpack.register_electrocraft(pos,
	'lulzpack:meseglass 8',
    'default:glass', 'default:glass', 'default:glass','default:glass', 
    'default:mese', 'default:glass','default:glass', 'default:mese', 
    'default:glass', 'default:glass', 'default:glass','default:glass', 
    'default:glass', 'default:glass', 'default:glass','default:glass'
	)
end
})]]



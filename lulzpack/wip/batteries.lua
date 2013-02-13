lulzpack.register_battery("lulzpack:mini_battery","Mini Battery","mini_bat.png")

function activatebatbox(pos,node)
    local meta=minetest.env:get_meta(pos)
    local inv=meta:get_inventory()
    local gen_pos={x=pos.x,y=pos.y+1,z=pos.z}
    local gen_meta=minetest.env:get_meta(gen_pos)
    if minetest.env:get_node(gen_pos) ~= 'air' then
        lulzpack.add_batbox_battery(pos,"battery",gen_pos,"energy","lulzpack:mini_battery",1000,1)
    end
end

minetest.register_abm ({
        nodenames = {"lulzpack:batbox"},
        interval = 2,
        chance = 1,
        action = activatebatbox
})

minetest.register_node("lulzpack:batbox", {
    description = "Bat Box",
	tiles = {"quarry_side.png","quarry_side.png",
		  "quarry_side.png","batbox_front.png",
		  "quarry_side.png","quarry_side.png"},
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
        meta:set_int("energy",0)
		meta:set_string("formspec",
				"size[8,9]"..
                "label[3,2,fuelstext]"..
                "list[current_name;Battery]"..
				"list[current_player;main;0,5;8,4;]"..
				"list[current_name;battery;4,2;1,1;]")
		meta:set_string("infotext", "BatBox")
		local inv = meta:get_inventory()
		inv:set_size("battery", 1)
	end,
	groups = {cracky=2}
})

-- Battery registration helper
function lulzpack.register_battery(name,desc,texture)
minetest.register_tool(name, {
	description = desc,
	inventory_image = texture,
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			energy={times={[1]=1.00}, uses=1, maxlevel=1},
		}
	},
})
end

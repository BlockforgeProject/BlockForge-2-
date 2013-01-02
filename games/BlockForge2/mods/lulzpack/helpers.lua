--Functions and helpers

--Liquid registration helper
function registerLiquid(name,nodename,texturename,viscosity,damage,light)
minetest.register_node("lulzpack:"..name.."_flowing", {
	description = "Flowing"..nodename.."",
	inventory_image = minetest.inventorycube(""..texturename..".png"),
	drawtype = "flowingliquid",
	special_tiles = {
		{
			image=""..texturename.."_flowing_animated.png",
			backface_culling=false,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.3}
		},
		{
			image=""..texturename.."_flowing_animated.png",
			backface_culling=true,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.3}
		},
	},
	paramtype = "light",
	light_source = light,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	liquidtype = "flowing",
	liquid_alternative_flowing = "lulzpack:"..name.."_flowing",
	liquid_alternative_source = "lulzpack:"..name.."_source",
	liquid_viscosity = viscosity,
	damage_per_second = damage,
	post_effect_color = {a=192, r=130, g=64, b=0},
	groups = {liquid=2, hot=3, igniter=1, not_in_creative_inventory=1},
})

minetest.register_node("lulzpack:"..name.."_source", {
	description = ""..nodename.." Source",
	inventory_image = minetest.inventorycube(""..texturename..".png"),
	drawtype = "liquid",
	tiles = {
		{name=""..texturename.."_source_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	},
	paramtype = "light",
	light_source = light,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	liquidtype = "source",
	liquid_alternative_flowing = "lulzpack:"..name.."_flowing",
	liquid_alternative_source = "lulzpack:"..name.."_source",
	liquid_viscosity = viscosity,
	damage_per_second = damage,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {liquid=2, hot=3, igniter=1},
})
end
--Smithery Recipe helper

function addSmitheryRecipe(pos, node, srcinv_name, destinv_name, source, result, case, caseinv_name)
    local meta=minetest.env:get_meta(pos)
    local inv=meta:get_inventory()
    if inv:contains_item(srcinv_name, source) then
        if inv:contains_item(caseinv_name, case) then
            inv:remove_item(srcinv_name, source)
            inv:remove_item(caseinv_name, case)
            inv:add_item(destinv_name, result)
        end
    end
end

--Generators fuel helper
function add_gen_fuel(pos, node, invname, nodename, varname, given_energy, replacing_item)
    local meta = minetest.env:get_meta(pos)
    local inv = meta:get_inventory()
    if meta:get_inventory():contains_item(invname, nodename) then
        energy=meta:get_int(varname)
        meta:set_int(varname,energy+given_energy)
        meta:get_inventory():remove_item(invname, nodename)
        meta:get_inventory():add_item(invname, replacing_item) end
end

--Recharger Item
--Big thanks to PilzAdam and Jordach for helping me with this ;)
function add_recharger_item(pos,itemname,energy_per_second)
    local gen_meta = minetest.env:get_meta({x=pos.x,y=pos.y+1,z=pos.z})
    local gen_energy= gen_meta:get_int("energy")
    local meta = minetest.env:get_meta(pos)
    local inv = meta:get_inventory()
    for i=1,4 do
        local item_stack=ItemStack(inv:get_stack("items", i))
        if item_stack:get_name() == itemname then
            if gen_energy >= energy_per_second then
            if item_stack:get_wear() > 0 then
                item_stack:add_wear(-energy_per_second)
                inv:set_stack("items",i,item_stack)
                gen_meta:set_int("energy",gen_energy-energy_per_second)
                end
            end
        end    
    end
end




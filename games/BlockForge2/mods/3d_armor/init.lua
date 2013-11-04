--Forked from the original 3d_armor
dofile(minetest.get_modpath("3d_armor").."/api.lua")
--Armors
register_armor("cryoas","Cryoas","lulzpack:cryoas_ingot",0.8,0.3,1)
register_armor("steel","Steel","default:steel_ingot",1,-0.05,1)
register_armor("dirt","Dirt","default:dirt",0.5,-0.1,2)
register_armor("hotstone","Hotstone","lulzpack:hotstone",5,-0.05,3)
register_armor("obsidian","Obsidian","lulzpack:obsidian_plate",2,-0.05,4)
--Functions
local function get_armor_level(stack, slot)
	local level = stack:get_definition().groups[slot]
	if level == nil then
		return 0
	end
	return level
end

local function set_player_armor(player)
	local name = player:get_player_name()
	if minetest.env:get_player_by_name(name) == nil then
		return
	end	
	local player_inv = player:get_inventory()
	local mesh = "3d_armor_character.png"
	local stack = player:get_wielded_item()
	local item = stack:get_name()
	local wieldable = {
		"sword_steel",
		"sword_stone",
		"sword_wood",
		"pick_mese",
		"pick_steel",
		"pick_stone",
		"pick_wood",
	}
	local wieldable_lulz = {
		"chainsaw_celis",
		"chainsaw_lyra",
		"chainsaw_nyon",
		"pick_hybrid",
	}
	for _,v in ipairs(wieldable) do
		if item == "default:"..v then
			mesh = mesh.."^3d_armor_uv_"..v..".png"
		end
	end
	for _,v in ipairs(wieldable_lulz) do
		if item == "lulzpack:"..v then
			mesh = mesh.."^3d_armor_uv_"..v..".png"
		end
	end
	local stack = player_inv:get_stack("armor_head", 1)
	local head = get_armor_level(stack, "armor_head")
    local head_slow = get_armor_level(stack, "armor_head_slow")
	if head > 0 then
		local id = stack:get_definition().groups["mesh_id"]
		mesh = mesh.."^3d_armor_uv_head_"..id..".png"
	end
	local stack = player_inv:get_stack("armor_torso", 1)	
	local torso = get_armor_level(stack, "armor_torso")
    local torso_slow = get_armor_level(stack, "armor_torso_slow")
	if torso > 0 then
		local id = stack:get_definition().groups["mesh_id"]
		mesh = mesh.."^3d_armor_uv_torso_"..id..".png"
	end
	local stack = player_inv:get_stack("armor_legs", 1)	
	local legs = get_armor_level(stack, "armor_legs")
    local legs_slow = get_armor_level(stack, "armor_legs_slow")
	if legs > 0 then
		local id = stack:get_definition().groups["mesh_id"]
		mesh = mesh.."^3d_armor_uv_legs_"..id..".png"
	end	
	local stack = player_inv:get_stack("armor_shield", 1)	
	local shield = get_armor_level(stack, "armor_shield")
    local shield_slow = get_armor_level(stack, "armor_shield_slow")
	if shield > 0 then
		local id = stack:get_definition().groups["mesh_id"]
		mesh = mesh.."^3d_armor_uv_shield_"..id..".png"
	end	
	local level = (2*head)+(12*torso)+(6*legs)+(3*shield)
	local armor_groups = {fleshy=0}
    local power = math.floor(level)
	armor_groups.fleshy = (100-level)
	player:set_armor_groups(armor_groups)
	player:set_properties({
		visual = "mesh",
		mesh = "3d_armor_character.x",
		textures = {mesh},
		visual_size = {x=1, y=1},
	})
    local armor_slow=1+(head_slow+torso_slow+legs_slow+shield_slow)
    player:set_physics_override(armor_slow,nil,1)
	minetest.after(4, set_player_armor, player)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	local name = player:get_player_name()
	if fields.outfit then
		inventory_plus.set_inventory_formspec(player, "size[8,7.5]"
		.."button[0,0;2,0.5;main;Back]"
		.."list[current_player;main;0,3.5;8,4;]"
		.."list[detached:"..name.."_outfit;armor_head;3,0;1,1;]"
		.."list[detached:"..name.."_outfit;armor_torso;3,1;1,1;]"
		.."list[detached:"..name.."_outfit;armor_legs;3,2;1,1;]"
		.."list[detached:"..name.."_outfit;armor_shield;5,1;1,1;]")
		return
	end
end)

minetest.register_on_joinplayer(function(player)
	inventory_plus.register_button(player,"outfit","Outfit")
	local player_inv = player:get_inventory()
	local armor_inv = minetest.create_detached_inventory(player:get_player_name().."_outfit",{
		on_put = function(inv, listname, index, stack, player)
			player:get_inventory():set_stack(listname, index, stack)
			set_player_armor(player)
		end,
		on_take = function(inv, listname, index, stack, player)
			player:get_inventory():set_stack(listname, index, nil)
			set_player_armor(player)
		end,
		allow_put = function(inv, listname, index, stack, player)
			if inv:is_empty(listname) then
				return 1
			end
			return 0
		end,
		allow_take = function(inv, listname, index, stack, player)
			return stack:get_count()
		end,
	})
	for _,v in ipairs({"head", "torso", "legs", "shield"}) do
		local armor = "armor_"..v
		player_inv:set_size(armor, 1)
		armor_inv:set_size(armor, 1)
		armor_inv:set_stack(armor, 1, player_inv:get_stack(armor, 1))
	end
	set_player_armor(player)

end)

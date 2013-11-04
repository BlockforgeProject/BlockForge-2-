function register_armor(material,graphicname,craftitem,level,slow,id)


minetest.register_tool("3d_armor:helmet_"..material.."", {
	description = graphicname.." Helmet",
	inventory_image = "3d_armor_helm_"..material..".png",
	groups = {armor_head=level, mesh_id=id, armor_head_slow=slow},
	wear = 0,
})

minetest.register_tool("3d_armor:chestplate_"..material.."", {
	description = graphicname.." Chestplate",
	inventory_image = "3d_armor_chest_"..material..".png",
	groups = {armor_torso=level, mesh_id=id, armor_chestplate_slow=slow},
	wear = 0,
})

minetest.register_tool("3d_armor:leggings_"..material.."", {
	description = graphicname.." Leggings",
	inventory_image = "3d_armor_legs_"..material..".png",
	groups = {armor_legs=level, mesh_id=id, armor_legs_slow=slow},
	wear = 0,
})

minetest.register_tool("3d_armor:shield_"..material.."", {
	description = graphicname.." Shield",
	inventory_image = "3d_armor_shield_"..material..".png",
	groups = {armor_shield=level, mesh_id=id, armor_shield_slow=slow},
	wear = 0,
})

minetest.register_craft({
	output = "3d_armor:helmet_"..material.."",
	recipe = {
		{craftitem, craftitem, craftitem},
		{craftitem, "", craftitem},
		{"", "", ""},
	},
})

minetest.register_craft({
	output = "3d_armor:chestplate_"..material.."",
	recipe = {
		{craftitem, "", craftitem},
		{craftitem, craftitem, craftitem},
		{craftitem, craftitem, craftitem},
	},
})

minetest.register_craft({
	output = "3d_armor:leggings_"..material.."",
	recipe = {
		{craftitem, craftitem, craftitem},
		{craftitem, "", craftitem},
		{craftitem, "", craftitem},
	},
})

minetest.register_craft({
	output = "3d_armor:shield_"..material.."",
	recipe = {
		{craftitem, craftitem, craftitem},
		{craftitem, craftitem, craftitem},
		{"", craftitem, ""},
	},
})
end

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

--Inspired by "Lavacooling" mod

--Obsidian Nodes
minetest.register_node("lulzpack:obsidian", {
	description = "Obsidian",
	light_source = LIGHT_MAX-5,
	tiles ={"obsidian.png"},
	is_ground_content = true,
	groups = {cracky=4},--Only breakable by Lyra Pickaxe
	drop = 'lulzpack:raw_obsidian',
	legacy_mineral = false,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lulzpack:raw_obsidian", {
	description = "Raw Obsidian",
	tiles ={"rawobsidian.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'lulzpack:raw_obsidian',
	legacy_mineral = false,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	type = "cooking",
	output = "lulzpack:obsidian",
	recipe = "lulzpack:raw_obsidian",
})


--GROUPS

lavacobble = function(pos)
    for _, abmnode in ipairs({"default:water_source","default:water_flowing"}) do
        for dist=-1,1 do
              if minetest.env:get_node({x=pos.x,y=pos.y+dist,z=pos.z}).name == abmnode 
              or minetest.env:get_node({x=pos.x+dist,y=pos.y,z=pos.z}).name == abmnode 
              or minetest.env:get_node({x=pos.x,y=pos.y,z=pos.z+dist}).name == abmnode then 
              minetest.env:add_node(pos, {name="lulzpack:raw_obsidian"}) end
        end
    end
end

lavaobs = function(pos)
    for _, abmnode in ipairs({"default:water_source","default:water_flowing"}) do
        for dist=-1,1 do
              if minetest.env:get_node({x=pos.x,y=pos.y+dist,z=pos.z}).name == abmnode 
              or minetest.env:get_node({x=pos.x+dist,y=pos.y,z=pos.z}).name == abmnode 
              or minetest.env:get_node({x=pos.x,y=pos.y,z=pos.z+dist}).name == abmnode then 
              minetest.env:add_node(pos, {name="lulzpack:obsidian"}) end
        end
    end
end

minetest.register_abm ({
        nodenames = {"default:lava_flowing"},
        interval = 0,
        chance = 1,
        action = lavacobble, 
})

minetest.register_abm ({
        nodenames = {"default:lava_source"},
        interval = 0,
        chance = 1,
        action = lavaobs, 
})




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
	groups = {obs=1,puts_out_fire=1},
	drop = 'lulzpack:raw_obsidian',
	legacy_mineral = false,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lulzpack:celis_obsidian", {
	description = "Celis Obsidian",
	light_source = LIGHT_MAX+5,
	tiles ={"celis_obsidian.png"},
	is_ground_content = true,
	groups = {obs=2,puts_out_fire=1},
	drop = 'lulzpack:obsidian',
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

--Recipes
minetest.register_craft({
	output = "lulzpack:obsidian",
	recipe = {{"lulzpack:raw_obsidian","lulzpack:raw_obsidian"},
             {"lulzpack:raw_obsidian","lulzpack:raw_obsidian"},}
})
minetest.register_craft({
	output = "lulzpack:obsidian_plate 3",
	recipe = {
                {"lulzpack:obsidian"}
             },
})
minetest.register_craft({
	output = "lulzpack:celis_obsidian 6",
	recipe = {
             {"lulzpack:obsidian_bucket_meltedcelis","lulzpack:obsidian","lulzpack:obsidian_bucket_meltedcelis"},
             {"","lulzpack:obsidian",""},
             {"","lulzpack:obsidian",""},
            }
})
minetest.register_craft({
	output = "lulzpack:obsidian_bucket_empty",
	recipe = {
             {"lulzpack:obsidian_plate","","lulzpack:obsidian_plate"},
             {"","lulzpack:obsidian_plate",""},
            }
})


--GROUPS

default.cool_lava_flowing = function(pos)
    for _, abmnode in ipairs({"default:water_source","default:water_flowing","lulzpack:water_block","lulzpack:hotstone"}) do
        for dist=-1,1 do
              if minetest.env:get_node({x=pos.x,y=pos.y+dist,z=pos.z}).name == abmnode 
              or minetest.env:get_node({x=pos.x+dist,y=pos.y,z=pos.z}).name == abmnode 
              or minetest.env:get_node({x=pos.x,y=pos.y,z=pos.z+dist}).name == abmnode then 
              minetest.env:add_node(pos, {name="lulzpack:raw_obsidian"}) end
        end
    end
end

default.cool_lava_source = function(pos)
    for _, abmnode in ipairs({"default:water_source","default:water_flowing","lulzpack:water_block","lulzpack:hotstone"}) do
        for dist=-1,1 do
              if minetest.env:get_node({x=pos.x,y=pos.y+dist,z=pos.z}).name == abmnode 
              or minetest.env:get_node({x=pos.x+dist,y=pos.y,z=pos.z}).name == abmnode 
              or minetest.env:get_node({x=pos.x,y=pos.y,z=pos.z+dist}).name == abmnode then 
              minetest.env:add_node(pos, {name="lulzpack:obsidian"}) end
        end
    end
end

lavabret = function(pos)
    for _, abmnode in ipairs({"lulzpack:lava_block","default:lava_source"}) do
        for dist=-1,1 do
              if minetest.env:get_node({x=pos.x,y=pos.y+dist,z=pos.z}).name == abmnode 
              or minetest.env:get_node({x=pos.x+dist,y=pos.y,z=pos.z}).name == abmnode 
              or minetest.env:get_node({x=pos.x,y=pos.y,z=pos.z+dist}).name == abmnode then 
              minetest.env:add_node(pos, {name="lulzpack:corrupted_bretonium_block"}) end
        end
    end
end

water_radioactive = function(pos)
    for _, abmnode in ipairs({"default:water_source","default:water_flowing"}) do
        for dist=-1,1 do
              if minetest.env:get_node({x=pos.x,y=pos.y+dist,z=pos.z}).name == abmnode then minetest.env:add_node({x=pos.x,y=pos.y+dist,z=pos.z}, {name="lulzpack:radioactivewater_source"}) end
              if minetest.env:get_node({x=pos.x+dist,y=pos.y,z=pos.z}).name == abmnode then minetest.env:add_node({x=pos.x+dist,y=pos.y,z=pos.z}, {name="lulzpack:radioactivewater_source"}) end
              if minetest.env:get_node({x=pos.x,y=pos.y,z=pos.z+dist}).name == abmnode then minetest.env:add_node({x=pos.x,y=pos.y,z=pos.z+dist}, {name="lulzpack:radioactivewater_source"}) end
        end
    end
end


minetest.register_abm ({
        nodenames = {"lulzpack:bretonium_block"},
        interval = 1,
        chance = 1,
        action = lavabret, 
})

minetest.register_abm ({
        nodenames = {"lulzpack:meltedbretonium_source","lulzpack:meltedbretonium_flowing"},
        interval = 1,
        chance = 1,
        action = water_radioactive, 
}) 




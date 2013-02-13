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
--Registration
registerSimpleLiquid("oil","Oil","oil",520,0,0,
{liquid=2, not_in_creative_inventory=1, flammable=2},
{liquid=2, not_in_creative_inventory=1, flammable=2})
registerSimpleLiquid("gasoline","Gasoline","gasoline",320,0,0,
{liquid=2, not_in_creative_inventory=1, flammable=1, igniter=1},
{liquid=2, not_in_creative_inventory=1, flammable=1, igniter=1})
registerHotLiquid("meltedbretonium","Melted Bretonium","meltedbretonium",120,15,LIGHT_MAX)
registerHotLiquid("radioactivewater","Radio Active Water","radioactivewater",120,1,LIGHT_MAX)
--Buckets
registerObsBucket("lulzpack:oil_source","lulzpack:oil_flowing","lulzpack:obsidian_bucket_oil","obsidian_bucket_oil.png","Oil Obsidian Bucket")
registerObsBucket("lulzpack:gasoline_source","lulzpack:gasoline_flowing","lulzpack:obsidian_bucket_gasoline","obsidian_bucket_gasoline.png","Gasoline Obsidian Bucket")
registerObsBucket("lulzpack:radioactivewater_source","lulzpack:radioactivewater_flowing","lulzpack:obsidian_bucket_radioactivewater","obsidian_bucket_radioactivewater.png","Radio Active Water Obsidian Bucket")
--Generation
minetest.register_on_generated(function(minp, maxp, seed)
        generate_ore("lulzpack:oil_source", "default:desert_stone", minp, maxp, seed+6, 1/24/24/24, 6,32, -300, 300)
        generate_ore("lulzpack:oil_source", "default:stone", minp, maxp, seed+6, 1/24/24/24, 6,32, -30000, -1000)
end)


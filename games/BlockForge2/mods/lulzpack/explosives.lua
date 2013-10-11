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

minetest.register_node("lulzpack:little_tnt", {
	description = "Little TNT",
	tiles ={"little_tnt.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lulzpack:little_tnt_active", {
	description = "Little TNT (active)",
	tiles ={"little_tnt_active.png"},
	is_ground_content = true,
	groups = {crumbly=3},
    drop = "lulzpack:little_tnt",
	sounds = default.node_sound_stone_defaults(),
})

activate_litte_tnt = function(pos,node)
    --local firepos={x=pos.x,y=pos.y+1,z=pos.z}
    --if minetest.env:get_node(firepos).name == 'fire:basic_flame' then
        --minetest.env:set_node(pos, {name='lulzpack:little_tnt_active'}) 
    --end
end

explose_litte_tnt = function(pos, node)
    minetest.after(3,function(args)
        tnt_explode(pos,5,4)
    end,pos)
end

--[[minetest.register_abm {
    nodenames = {"lulzpack:little_tnt"},
    interval=2,
    chance=1,
    action=activate_little_tnt 
}
            
minetest.register_abm {
    nodenames = {"lulzpack:little_tnt_active"},
    interval=5,
    chance=1,
    action=explose_little_tnt 
}]]

function tnt_explode(pos,dmwc1,dmg) -- Based on https://github.com/RickyFF/CannonsMod-Minetest/tree/master/games/BlockForge2/mods/cannons
        if checkProtection(pos) then return end
        --minetest.sound_play("DeathFlash", {pos=pos, gain=1.5, max_hear_distance=2*64})
		local objects = minetest.env:get_objects_inside_radius(pos, 7)
		for _,obj in ipairs(objects) do
			if obj:is_player() or (obj:get_luaentity() and obj:get_luaentity().name ~= "__builtin:item") then
				local obj_p = obj:getpos()
				local vec = {x=obj_p.x-pos.x, y=obj_p.y-pos.y, z=obj_p.z-pos.z}
				local dist = (vec.x^2+vec.y^2+vec.z^2)^0.5
				local damage = dmg
				obj:punch(obj, 1.0, {
					full_punch_interval=1.0,
					groupcaps={
						fleshy={times={[1]=1/damage, [2]=1/damage, [3]=1/damage}},
						snappy={times={[1]=1/damage, [2]=1/damage, [3]=1/damage}},
					}
				}, nil)
			end
		end	
		local destroyed=0
		local stop=false
		for dx=-dmwc1,dmwc1 do
			for dz=-dmwc1,dmwc1 do
				for dy=dmwc1,-dmwc1,-1 do
					pos.x = pos.x+dx
					pos.y = pos.y+dy
					pos.z = pos.z+dz
					local node =  minetest.env:get_node(pos)   
						if math.abs(dx)<2 and math.abs(dy)<2 and math.abs(dz)<2 then
					        destroy(pos)
							if minetest.get_node_group(node.name, "cracky")==1 or minetest.get_node_group(node.name, "obs")==1 then	destroyed=destroyed+1 end
						        else
							if math.random(1,5) <= 4 then
                                destroy(pos)
							end
						end			
				    if destroyed>dmwc1 then 
				        stop=true
				        break
				    end 
					pos.x = pos.x-dx
					pos.y = pos.y-dy
					pos.z = pos.z-dz
				end
				if stop then break end
			end
			if stop then break end
		end
end

function destroy(pos) -- Based on https://github.com/PilzAdam/TNT
    local nodename = minetest.env:get_node(pos).name
        if minetest.get_node_group(nodename, "puts_out_fire")==0 then
        minetest.env:remove_node(pos)
        nodeupdate(pos)
    end
end

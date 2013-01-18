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
-- You can modify or redistribute it under the zlib conditions

rocket1_DAMAGE=5
rocket1_GRAVITY=10
rocket1_VELOCITY=30

bul1_DAMAGE=3
bul1_GRAVITY=6
bul1_VELOCITY=50

local rocket1={
    physical = false,
	textures = {"rocket1.png"},
    lastpos={},
    plastpos={},
    collisionbox = {0,0,0,0,0,0},
    on_step = function(self, dtime)
        local pos = self.object:getpos()
        local node = minetest.env:get_node(pos)
        local exs=true
        if minetest.get_node_group(node.name, "puts_out_fire")~=0 then
            exs=false
            self.object:remove()
        end
        if self.lastpos.x~=nil then
        if node.name ~= "air" and exs then
            self.object:remove()
            explode(pos,1.5,destroy,rocket1_DAMAGE)
        end
        end
        checkState(self)
        self.plastpos=self.lastpos
        self.lastpos={x=pos.x, y=pos.y, z=pos.z}
    end
}
minetest.register_entity('lulzpack:rocket1_ent', rocket1)

local bul1={
    physical = false,
	textures = {"bullet1.png"},
    lastpos={},
    plastpos={},
    collisionbox = {0,0,0,0,0,0},
    on_step = function(self, dtime)
        local pos = self.object:getpos()
        local node = minetest.env:get_node(pos)
        local exs=true
        if minetest.get_node_group(node.name, "puts_out_fire")~=0 then
            exs=false
            self.object:remove()
            shot(pos,1,bul1_DAMAGE)
        end
        if self.lastpos.x~=nil then
        if node.name ~= "air" and exs then
            self.object:remove()
            shot(pos,1,bul1_DAMAGE)
        end
        end
        checkState(self)
        self.plastpos=self.lastpos
        self.lastpos={x=pos.x, y=pos.y, z=pos.z}
    end
}
minetest.register_entity('lulzpack:bullet1_ent', bul1)

rocket1_shoot=function (item, player, pointed_thing)
	if player:get_inventory():contains_item("main", "lulzpack:rocket1") then
		player:get_inventory():remove_item("main", "lulzpack:rocket1")
			local pgpos=player:getpos()
			local obj=minetest.env:add_entity({x=pgpos.x,y=pgpos.y+1.5,z=pgpos.z}, "lulzpack:rocket1_ent")
			local dir=player:get_look_dir()
			obj:setvelocity({x=dir.x*rocket1_VELOCITY, y=dir.y*rocket1_VELOCITY, z=dir.z*rocket1_VELOCITY})
			obj:setacceleration({x=dir.x*-3, y=-rocket1_GRAVITY, z=dir.z*-3})
	end
	return
end

bul1_shoot=function (item, player, pointed_thing)
	if player:get_inventory():contains_item("main", "lulzpack:bul1") then
		player:get_inventory():remove_item("main", "lulzpack:bul1")
			local pgpos=player:getpos()
			local obj=minetest.env:add_entity({x=pgpos.x,y=pgpos.y+1.5,z=pgpos.z}, "lulzpack:bullet1_ent")
			local dir=player:get_look_dir()
			obj:setvelocity({x=dir.x*bul1_VELOCITY, y=dir.y*bul1_VELOCITY, z=dir.z*bul1_VELOCITY})
			obj:setacceleration({x=dir.x*-3, y=-bul1_GRAVITY, z=dir.z*-3})
	end
	return
end

minetest.register_craftitem("lulzpack:bazooka", {
	image = "bazooka.png",
	on_place_on_ground = minetest.craftitem_place_item,
	on_use = rocket1_shoot,
	description = "Bazooka"
})

minetest.register_craftitem("lulzpack:rocket1", {
	image = "rocket1_inv.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Rockets"
})

minetest.register_craftitem("lulzpack:ironpistol", {
	image = "ironpistol.png",
	on_place_on_ground = minetest.craftitem_place_item,
	on_use = bul1_shoot,
	description = "Iron Pistol"
})

minetest.register_craftitem("lulzpack:bul1", {
	image = "bul1_inv.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Iron Pistol bullets"
})


function checkState(ss)
    minetest.after(2, function(s)
    if s~=nil and s.plastpos==s.object:getpos() then
        s.object:remove()
        explode(s.object:getpos(),2)
    end
    end,ss)
end

function shot(pos,dmwc1,dmg) -- Based on https://github.com/RickyFF/CannonsMod-Minetest/tree/master/games/BlockForge2/mods/cannons
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
end

function explode(pos,dmwc1,func,dmg) -- Based on https://github.com/RickyFF/CannonsMod-Minetest/tree/master/games/BlockForge2/mods/cannons
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
					        func(pos)
							if minetest.get_node_group(node.name, "cracky")==1 or minetest.get_node_group(node.name, "obs")==1 then	destroyed=destroyed+1 end
						else
							if math.random(1,5) <= 4 then
                                func(pos)
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
    if math.random(1,5) <= 4 then
        --minetest.env:add_entity({x=pos.x+math.random(0,10)/10-0.5, y=pos.y, z=pos.z+math.random(0,10)/10-0.5}, modname..":smoke")
    end
    local nodename = minetest.env:get_node(pos).name
        if minetest.get_node_group(nodename, "puts_out_fire")==0 then
        minetest.env:remove_node(pos)
        nodeupdate(pos)
    end
end

function checkProtection(pos) end

minetest.register_craft({
    output = 'lulzpack:ironpistol',
    recipe = {
    {'default:steel_ingot','',''},
    {'','default:steel_ingot','lulzpack:industrial_iron'},
    {'','default:steel_ingot','default:stick'},
    }
})

minetest.register_craft({
    output = 'lulzpack:bul1 8',
    recipe = {
    {'','lulzpack:redyz_ingot',''},
    {'lulzpack:industrial_iron','default:coal_lump','lulzpack:industrial_iron'},
    {'lulzpack:industrial_iron','default:coal_lump','lulzpack:industrial_iron'},
    }
})

minetest.register_craft({
    output = 'lulzpack:bazooka',
    recipe = {
    {'lulzpack:industrial_iron','lulzpack:iron_plate','lulzpack:industrial_iron'},
    {'lulzpack:industrial_iron','lulzpack:iron_plate','lulzpack:industrial_iron'},
    {'lulzpack:industrial_iron','lulzpack:iron_plate','lulzpack:industrial_iron'},
    }
})

minetest.register_craft({
    output = 'lulzpack:rocket1 5',
    recipe = {
    {'','lulzpack:redyz_ingot',''},
    {'lulzpack:iron_plate','default:coal_lump','lulzpack:iron_plate'},
    {'lulzpack:iron_plate','default:coal_lump','lulzpack:iron_plate'},
    }
})






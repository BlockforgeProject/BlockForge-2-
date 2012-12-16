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

--Definitions
BUL1_DAMAGE=3
BUL1_GRAVITY=4
BUL1_VELOCITY=150
--
BUL2_DAMAGE=6
BUL2_GRAVITY=2
BUL2_VELOCITY=120
--Bullet entities
BUL1_ENT={
	physical = false,
	timer=0,
	textures = {"bullet1.png"},
	lastpos={},
	collisionbox = {0,0,0,0,0,0},
}

BUL2_ENT={
	physical = false,
	timer=0,
	textures = {"bullet2.png"},
	lastpos={},
	collisionbox = {0,0,0,0,0,0},
}

BUL1_ENT.on_step = function(self, deltat)
	self.timer=self.timer+deltat
	local pos = self.object:getpos()
	local node = minetest.env:get_node(pos)
	if self.timer>0.4 then
		local objs = minetest.env:get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
		for k, obj in pairs(objs) do
			obj:set_hp(obj:get_hp()-BUL1_DAMAGE)
			if obj:get_entity_name() ~= "lulzpack:bul1_ent" then
				if obj:get_hp()<=0 then
					obj:remove()
				end
				self.object:remove()
			end
		end
	end

	--[[Become item when hitting a node
	if self.lastpos.x~=nil then --If there is no lastpos for some reason
		if node.name ~= "air" then
			minetest.env:add_item(self.lastpos, 'gunmod:usedbullet1 1')
			self.object:remove()
		end
	end
	self.lastpos={x=pos.x, y=pos.y, z=pos.z} -- Set lastpos-->Item will be added at last pos outside the node ]]--
end

BUL2_ENT.on_step = function(self, deltat)
	self.timer=self.timer+deltat
	local pos = self.object:getpos()
	local node = minetest.env:get_node(pos)
	if self.timer>0.4 then
		local objs = minetest.env:get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
		for k, obj in pairs(objs) do
			obj:set_hp(obj:get_hp()-BUL2_DAMAGE)
			if obj:get_entity_name() ~= "lulzpack:bul2_ent" then
				if obj:get_hp()<=0 then
					obj:remove()
				end
				self.object:remove()
			end
		end
	end
end


minetest.register_entity("lulzpack:bul1_ent", BUL1_ENT)
minetest.register_entity("lulzpack:bul2_ent", BUL2_ENT)

--Bullet Shooting
BUL1_SHOOT=function (item, player, pointed_thing)
	if player:get_inventory():contains_item("main", "lulzpack:bul1") then
		player:get_inventory():remove_item("main", "lulzpack:bul1")
			local pgpos=player:getpos()
			local obj=minetest.env:add_entity({x=pgpos.x,y=pgpos.y+1.5,z=pgpos.z}, "lulzpack:bul1_ent")
			local dir=player:get_look_dir()
			obj:setvelocity({x=dir.x*BUL1_VELOCITY, y=dir.y*BUL1_VELOCITY, z=dir.z*BUL1_VELOCITY})
			obj:setacceleration({x=dir.x*-3, y=-BUL1_GRAVITY, z=dir.z*-3})
	end
	return
end

BUL2_SHOOT=function (item, player, pointed_thing)
	if player:get_inventory():contains_item("main", "lulzpack:bul2") then
		player:get_inventory():remove_item("main", "lulzpack:bul2")
			local pgpos=player:getpos()
			local obj=minetest.env:add_entity({x=pgpos.x,y=pgpos.y+1.5,z=pgpos.z}, "lulzpack:bul2_ent")
			local dir=player:get_look_dir()
			obj:setvelocity({x=dir.x*BUL2_VELOCITY, y=dir.y*BUL2_VELOCITY, z=dir.z*BUL2_VELOCITY})
			obj:setacceleration({x=dir.x*-3, y=-BUL2_GRAVITY, z=dir.z*-3})
	end
	return
end

--Items
minetest.register_craftitem("lulzpack:ironpistol", {
	image = "ironpistol.png",
	on_place_on_ground = minetest.craftitem_place_item,
	on_use = BUL1_SHOOT,
	description = "Iron pistol"
})

minetest.register_craftitem("lulzpack:bul1", {
	image = "bul1_inv.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Iron pistol bullets"
})

minetest.register_craftitem("lulzpack:plasmapistol", {
	image = "plasmapistol.png",
	on_place_on_ground = minetest.craftitem_place_item,
	on_use = BUL2_SHOOT,
	description = "Plasma pistol"
})

minetest.register_craftitem("lulzpack:bul2", {
	image = "bul2_inv.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Plasma pistol bullets"
})

--Recipes

minetest.register_craft({
    output = 'lulzpack:ironpistol',
    recipe = {
    {'default:steel_ingot','',''},
    {'','default:steel_ingot','lulzpack:industrial_iron'},
    {'','default:steel_ingot','default:stick'},
    }
})

minetest.register_craft({
    output = 'lulzpack:bul1 6',
    recipe = {
    {'','default:redyz_ingot',''},
    {'lulzpack:industrial_iron','default:coal_lump','lulzpack:industrial_iron'},
    {'lulzpack:industrial_iron','default:coal_lump','lulzpack:industrial_iron'},
    }
})

minetest.register_craft({
    output = 'lulzpack:plasmapistol',
    recipe = {
    {'lulzpack:industrial_iron','lulzpack:industrial_iron',''},
    {'','lulzpack:industrial_iron','lulzpack:industrial_iron'},
    {'','lulzpack:industrial_iron','lulzpack:redyz_block'},
    }
})

minetest.register_craft({
    output = 'lulzpack:bul2 6',
    recipe = {
    {'','lulzpack:redyz_ingot',''},
    {'lulzpack:industrial_iron','lulzpack:redyz_lump','lulzpack:industrial_iron'},
    {'lulzpack:industrial_iron','lulzpack:lyra_lump','lulzpack:industrial_iron'},
    }
})




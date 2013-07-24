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
--CONSTANTS
GRAVITY_CONST=0
--ATTACH CONSTANTS
gb_camo_ac={x=0,y=2,z=0}
--SPEEDS
CAMO_GRAVBIKE_SPEED=6

--ENTITIES
local gb_camo = {
    physical = true,
    visual = "mesh",
    mesh = "inceptor.obj",
    textures = {"redyz.png"},
    pilot=nil,
	collisionbox = {-3,-.5,-.5, 2,1,1}
}

function gb_camo:on_rightclick (wanker) 
    if not wanker:is_player() or not wanker then return end
    if self.pilot==wanker then
        self.pilot=nil
        wanker:set_detach()
    elseif self.pilot==nil then
        self.pilot=wanker
        wanker:set_attach(self.object,"",gb_camo_ac,gb_camo_ac)
    end
end
    
function gb_camo:on_punch (puncher)
	self.object:remove()
	if puncher and puncher:is_player() then
		puncher:get_inventory():add_item("main", "lulzpack:gravbike_camo")
	end
end

function gb_camo:on_step(dtime)
    local vel=self.object:getvelocity()
    local acc=self.object:getacceleration()
    if self.pilot then
        local key=self.pilot:get_player_control()
        local ly=self.pilot:get_look_yaw()+161.7
        if key.up then 			
            acc.x = math.cos(ly+math.pi/2)*CAMO_GRAVBIKE_SPEED
			acc.z = math.sin(ly+math.pi/2)*CAMO_GRAVBIKE_SPEED
        else 
            acc.x = -vel.x/2
            acc.z = -vel.z/2
        end
        if key.down then
            acc.x = -vel.x*2
            acc.z = -vel.z*2
            vel.y = -0.5
        end
        if key.jump then
            vel.y = 1
        end
        self.object:setyaw(ly-1.5)
    end
    acc.y=acc.y-GRAVITY_CONST
    self.object:setvelocity(vel)
    self.object:setacceleration(acc)    
end


minetest.register_entity("lulzpack:gravbike_camo_ent",gb_camo)

--ITEMS

minetest.register_craftitem("lulzpack:gravbike_camo", {
    description = "Camo Gravbike",
    inventory_image = "gravbike_inv.png",
    wield_image = "gravbike_inv.png",
    
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		minetest.env:add_entity(pointed_thing.above, "lulzpack:gravbike_camo_ent")
		itemstack:take_item()
		return itemstack
	end,
})

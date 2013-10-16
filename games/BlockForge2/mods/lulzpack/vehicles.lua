--  _______          _     _______
-- (_______)        | |   (_______)                                  _
--  _____ ___   ____| |  _ _____ ___   ____ ____  ____   ____   ____| |_
-- |  ___) _ \ / ___) | / )  ___) _ \ / ___) _  |/ _  ) |  _ \ / _  )  _)
-- | |  | |_| | |   | |< (| |  | |_| | |  ( ( | ( (/ / _| | | ( (/ /| |__
-- |_|   \___/|_|   |_| \_)_|   \___/|_|   \_|| |\____|_)_| |_|\____)\___)
--                                        (_____|
--bomb1_shoot
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
INCEPTOR_ATC={x=0,y=0,z=0}
--SPEEDS
INCEPTOR_REDYZ_SPEED=6
INCEPTOR_BRETONIUM_SPEED=20
INCEPTOR_CRYOAS_SPEED=25
--WEAPONS CONSTANTS
BOMB1_DAMAGE=4
BOMB1_VELOCITY=40

--SHOTS
local bomb1={
    physical = false,
	textures = {name="bomb1.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1.0}},
    lastpos={},
    plastpos={},
    collisionbox = {0,0,0,0,0,0},
    on_step = function(self, dtime)
        local pos = self.object:getpos()
        local node = minetest.env:get_node(pos)
        local exs=true
        if self.lastpos.x~=nil then
        if node.name ~= "air" and exs then
            self.object:remove()
            flame_rocket_explode(pos,1,BOMB1_DAMAGE)
        end
        end
        checkState(self)
        self.plastpos=self.lastpos
        self.lastpos={x=pos.x, y=pos.y, z=pos.z}
    end
}
minetest.register_entity('lulzpack:bomb1_ent', bomb1)

bomb1_shoot=function (entity, player, pointed_thing)    
    entity.shot_time=entity.shot_time+1
    if entity.shot_time == 1 then
	    if player:get_inventory():contains_item("main", "lulzpack:bomb1") then
		    player:get_inventory():remove_item("main", "lulzpack:bomb1")
		    	local pgpos=player:getpos()
		    	local obj=minetest.env:add_entity({x=pgpos.x,y=pgpos.y-0.6,z=pgpos.z}, "lulzpack:bomb1_ent")
		    	local dir=player:get_look_dir()
		    	obj:setvelocity({x=dir.x*BOMB1_VELOCITY, y=0, z=dir.z*BOMB1_VELOCITY})
		    	obj:setacceleration({x=dir.x*-3, y=0, z=dir.z*-3})
	    end
	    return
    elseif entity.shot_time == 25 then entity.shot_time=0 end
end


--ENTITIES
registerInceptor(inceptor_redyz,"inceptor.obj",{"redyz.png"},"lulzpack:inceptor_redyz",INCEPTOR_REDYZ_SPEED,GRAVITY_CONST,INCEPTOR_ATC,{fleshy=30},bomb1_shoot)
registerInceptor(inceptor_bretonium,"inceptor.obj",{"bretonium.png"},"lulzpack:inceptor_bretonium",INCEPTOR_BRETONIUM_SPEED,GRAVITY_CONST,INCEPTOR_ATC,{fleshy=10},bomb1_shoot)
registerInceptor(inceptor_cryoas,"inceptor.obj",{"cryoas.png"},"lulzpack:inceptor_cryoas",INCEPTOR_CRYOAS_SPEED,GRAVITY_CONST,INCEPTOR_ATC,{fleshy=50})

--ITEMS
minetest.register_craftitem("lulzpack:inceptor_redyz", {
    description = "Redyz Inceptor",
    inventory_image = "inceptorredyz_inv.png",
    wield_image = "inceptorredyz_inv.png",
    stack_max=1,
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		minetest.env:add_entity(pointed_thing.above, "lulzpack:inceptor_redyz")
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("lulzpack:inceptor_bretonium", {
    description = "Bretonium Inceptor",
    inventory_image = "inceptorbretonium_inv.png",
    wield_image = "inceptorbretonium_inv.png",
    stack_max=1,
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		minetest.env:add_entity(pointed_thing.above, "lulzpack:inceptor_bretonium")
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("lulzpack:inceptor_cryoas", {
    description = "Cryoas Inceptor",
    inventory_image = "inceptorcryoas_inv.png",
    wield_image = "inceptorcryoas_inv.png",
    stack_max=1,
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		minetest.env:add_entity(pointed_thing.above, "lulzpack:inceptor_cryoas")
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("lulzpack:bomb1", {
	image = "bomb1_inv.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Bomb 1",
    stack_max=25
})

--RECIPES
minetest.register_craft({
    output = 'lulzpack:inceptor_redyz',
 	recipe = {
		{'', 'lulzpack:redyz_block', ''},
		{'lulzpack:iron_plate', 'lulzpack:electroblock', 'lulzpack:iron_plate'},
		{'lulzpack:iron_plate', 'lulzpack:basic_pilotsystem', 'lulzpack:iron_plate'},
	}   
})

minetest.register_craft({
    output = 'lulzpack:inceptor_bretonium',
 	recipe = {
		{'', 'lulzpack:bretonium_block', ''},
		{'lulzpack:hybrid_plate', 'lulzpack:electroblock', 'lulzpack:hybrid_plate'},
		{'lulzpack:hybrid_plate', 'lulzpack:basic_pilotsystem', 'lulzpack:hybrid_plate'},
	}   
})

minetest.register_craft({
    output = 'lulzpack:inceptor_cryoas',
 	recipe = {
		{'', 'lulzpack:cryoas_block', ''},
		{'lulzpack:iron_plate', 'lulzpack:electroblock', 'lulzpack:iron_plate'},
		{'lulzpack:iron_plate', 'lulzpack:basic_pilotsystem', 'lulzpack:iron_plate'},
	}   
})

minetest.register_craft({
    output = 'lulzpack:bomb1 5',
    recipe = {
    {'','lulzpack:redyz_ingot',''},
    {'lulzpack:iron_plate','lulzpack:lavablock','lulzpack:iron_plate'},
    {'lulzpack:iron_plate','lulzpack:obsidian_plate','lulzpack:iron_plate'},
    }
})

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

rocket1_DAMAGE=3
rocket1_GRAVITY=10
rocket1_VELOCITY=30

rocket2_DAMAGE=2
rocket2_GRAVITY=12
rocket2_VELOCITY=30

rocket3_DAMAGE=7
rocket3_GRAVITY=12
rocket3_VELOCITY=30

granade1_DAMAGE=2
granade1_GRAVITY=25
granade1_VELOCITY=20

granade2_DAMAGE=2
granade2_GRAVITY=20
granade2_VELOCITY=30

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
            rocket_explode(pos,2,rocket1_DAMAGE)
        end
        end
        checkState(self)
        self.plastpos=self.lastpos
        self.lastpos={x=pos.x, y=pos.y, z=pos.z}
    end
}
minetest.register_entity('lulzpack:rocket1_ent', rocket1)

local rocket2={
    physical = false,
	textures = {"rocket2.png"},
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
            flame_rocket_explode(pos,2,rocket2_DAMAGE)
        end
        end
        checkState(self)
        self.plastpos=self.lastpos
        self.lastpos={x=pos.x, y=pos.y, z=pos.z}
    end
}
minetest.register_entity('lulzpack:rocket2_ent', rocket2)

local rocket3={
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
            nuclear_explode(pos,4,rocket2_DAMAGE)
        end
        end
        checkState(self)
        self.plastpos=self.lastpos
        self.lastpos={x=pos.x, y=pos.y, z=pos.z}
    end
}
minetest.register_entity('lulzpack:rocket3_ent', rocket3)

local granade1={
    physical = false,
	textures = {"granade1.png"},
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
            rocket_explode(pos,3,granade1_DAMAGE)
        end
        end
        checkState(self)
        self.plastpos=self.lastpos
        self.lastpos={x=pos.x, y=pos.y, z=pos.z}
    end
}
minetest.register_entity('lulzpack:granade1_ent', granade1)

local granade2={
    physical = false,
	textures = {"granade2.png"},
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
            flame_rocket_explode(pos,2,granade2_DAMAGE)
        end
        end
        checkState(self)
        self.plastpos=self.lastpos
        self.lastpos={x=pos.x, y=pos.y, z=pos.z}
    end
}
minetest.register_entity('lulzpack:granade2_ent', granade2)

rocket1_shoot=function (item,player, pointed_thing)
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

rocket2_shoot=function (item, player, pointed_thing)
	if player:get_inventory():contains_item("main", "lulzpack:rocket2") then
		player:get_inventory():remove_item("main", "lulzpack:rocket2")
			local pgpos=player:getpos()
			local obj=minetest.env:add_entity({x=pgpos.x,y=pgpos.y+1.5,z=pgpos.z}, "lulzpack:rocket2_ent")
			local dir=player:get_look_dir()
			obj:setvelocity({x=dir.x*rocket2_VELOCITY, y=dir.y*rocket2_VELOCITY, z=dir.z*rocket2_VELOCITY})
			obj:setacceleration({x=dir.x*-3, y=-rocket2_GRAVITY, z=dir.z*-3})
	end
	return
end

rocket3_shoot=function (item,player, pointed_thing)
	if player:get_inventory():contains_item("main", "lulzpack:rocket3") then
		player:get_inventory():remove_item("main", "lulzpack:rocket3")
			local pgpos=player:getpos()
			local obj=minetest.env:add_entity({x=pgpos.x,y=pgpos.y+1.5,z=pgpos.z}, "lulzpack:rocket3_ent")
			local dir=player:get_look_dir()
			obj:setvelocity({x=dir.x*rocket3_VELOCITY, y=dir.y*rocket3_VELOCITY, z=dir.z*rocket3_VELOCITY})
			obj:setacceleration({x=dir.x*-3, y=-rocket3_GRAVITY, z=dir.z*-3})
	end
	return
end

granade1_shoot=function (item,player, pointed_thing)
	if player:get_inventory():contains_item("main", "lulzpack:granade") then
		player:get_inventory():remove_item("main", "lulzpack:granade")
			local pgpos=player:getpos()
			local obj=minetest.env:add_entity({x=pgpos.x,y=pgpos.y+1.5,z=pgpos.z}, "lulzpack:granade1_ent")
			local dir=player:get_look_dir()
			obj:setvelocity({x=dir.x*granade1_VELOCITY, y=dir.y*granade1_VELOCITY, z=dir.z*granade1_VELOCITY})
			obj:setacceleration({x=dir.x*-3, y=-granade1_GRAVITY, z=dir.z*-3})
	end
	return
end

granade2_shoot=function (player, pointed_thing)	  
	if player:get_inventory():contains_item("main", "lulzpack:granade2") then
		player:get_inventory():remove_item("main", "lulzpack:granade2")              	    
			local pgpos=player:getpos()
			local obj=minetest.env:add_entity({x=pgpos.x,y=pgpos.y+1.5,z=pgpos.z}, "lulzpack:granade2_ent")
			local dir=player:get_look_dir()
			obj:setvelocity({x=dir.x*granade2_VELOCITY, y=dir.y*granade2_VELOCITY, z=dir.z*granade2_VELOCITY})
			obj:setacceleration({x=dir.x*-3, y=-granade2_GRAVITY, z=dir.z*-3})
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

minetest.register_craftitem("lulzpack:flame_bazooka", {
	image = "flame_bazooka.png",
	on_place_on_ground = minetest.craftitem_place_item,
	on_use = rocket2_shoot,
	description = "Flame thrower Bazooka"
})

minetest.register_craftitem("lulzpack:rocket2", {
	image = "rocket2_inv.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Fire Rockets"
})

minetest.register_craftitem("lulzpack:nuclear_bazooka", {
	image = "bretonium_bazooka.png",
	on_place_on_ground = minetest.craftitem_place_item,
	on_use = rocket3_shoot,
	description = "Nuclear Bazooka"
})

minetest.register_craftitem("lulzpack:rocket3", {
	image = "rocket3_inv.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Bretonium Rockets"
})

minetest.register_craftitem("lulzpack:granade_launcher", {
	image = "granadelauncher.png",
	on_place_on_ground = minetest.craftitem_place_item,
	on_use = granade1_shoot,
	description = "Granade Launcher"
})

minetest.register_craftitem("lulzpack:granade", {
	image = "granade1.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Granade"
})

minetest.register_craftitem("lulzpack:flamethrower", {
	image = "flamethrower.png",
	on_place_on_ground = minetest.craftitem_place_item,
	on_use = granade2_shoot,
	description = "Flame thrower"
})

minetest.register_craftitem("lulzpack:granade2", {
	image = "granade2.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = "Flame Granade"
})


function checkState(ss)
    minetest.after(2, function(s)
    if s~=nil and s.plastpos==s.object:getpos() then
        s.object:remove()
        explode(s.object:getpos(),2)
    end
    end,ss)
end

function rocket_explode(pos,dmwc1,dmg) -- Based on https://github.com/RickyFF/CannonsMod-Minetest/tree/master/games/BlockForge2/mods/cannons
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
					        guns_destroy(pos)
							if minetest.get_node_group(node.name, "cracky")==1 or minetest.get_node_group(node.name, "obs")==1 then	destroyed=destroyed+1 end
						        else
							if math.random(1,5) <= 4 then
                                guns_destroy(pos)
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

function flame_rocket_explode(pos,dmwc1,dmg) -- Based on https://github.com/RickyFF/CannonsMod-Minetest/tree/master/games/BlockForge2/mods/cannons
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
					        guns_destroy(pos)
					        flamerocket_ignite(pos)
							if minetest.get_node_group(node.name, "cracky")==1 or minetest.get_node_group(node.name, "obs")==1 then	destroyed=destroyed+1 end
						        else
							if math.random(1,5) <= 4 then
                                guns_destroy(pos)
					            flamerocket_ignite(pos)
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

function guns_destroy(pos) -- Based on https://github.com/PilzAdam/TNT
    local nodename = minetest.env:get_node(pos).name
        if minetest.get_node_group(nodename, "puts_out_fire")==0 then
        minetest.env:remove_node(pos)
        nodeupdate(pos)
    end
end

function flamerocket_ignite(pos) -- Based on https://github.com/PilzAdam/TNT
	local nodename = minetest.env:get_node(pos).name
    if math.random(1,4) <= 1 then
	    if minetest.get_node_group(nodename, "puts_out_fire")==0 then
	    local nodepos = {x=pos.x,y=pos.y+1,z=pos.z}
		    minetest.env:add_node(nodepos, {name="fire:basic_flame"})
            if math.random(1,10) == 1 then
		        minetest.env:add_node(nodepos, {name="default:lava_flowing"})
            end           
            if math.random(1,150) == 1 then
		        minetest.env:add_node(nodepos, {name="default:lava_source"})
            end          
		    nodeupdate(pos)
        end
	end
end

function checkProtection(pos) end

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

minetest.register_craft({
    output = 'lulzpack:flame_bazooka',
    recipe = {
    {'lulzpack:industrial_iron','lulzpack:obsidian_plate','lulzpack:industrial_iron'},
    {'lulzpack:industrial_iron','lulzpack:obsidian_plate','lulzpack:industrial_iron'},
    {'lulzpack:industrial_iron','lulzpack:obsidian_plate','lulzpack:industrial_iron'},
    }
})

minetest.register_craft({
    output = 'lulzpack:rocket2 3',
    recipe = {
    {'','lulzpack:redyz_ingot',''},
    {'lulzpack:obsidian_plate','bucket:bucket_lava','lulzpack:obsidian_plate'},
    {'lulzpack:obsidian_plate','default:coal_lump','lulzpack:obsidian_plate'},
    }
})

minetest.register_craft({
    output = 'lulzpack:nuclear_bazooka',
    recipe = {
    {'lulzpack:obsidian','lulzpack:obsidian_plate','lulzpack:obsidian'},
    {'lulzpack:obsidian','lulzpack:obsidian_plate','lulzpack:obsidian'},
    {'lulzpack:obsidian','lulzpack:obsidian_plate','lulzpack:obsidian'},
    }
})

minetest.register_craft({
    output = 'lulzpack:rocket3 2',
    recipe = {
    {'','lulzpack:redyz_ingot',''},
    {'lulzpack:obsidian_plate','lulzpack:corrupted_bretonium_block','lulzpack:obsidian_plate'},
    {'lulzpack:obsidian_plate','default:coal_lump','lulzpack:obsidian_plate'},
    }
})

minetest.register_craft({
    output = 'lulzpack:granade_launcher',
    recipe = {
    {'lulzpack:iron_plate','lulzpack:obsidian','lulzpack:iron_plate'},
    {'','lulzpack:iron_plate','lulzpack:iron_plate'},
    {'','','lulzpack:iron_plate'},
    }
})

minetest.register_craft({
    output = 'lulzpack:granade 6',
    recipe = {
    {'','lulzpack:redyz_ingot',''},
    {'lulzpack:iron_plate','default:coal_lump','lulzpack:iron_plate'},
    }
})

minetest.register_craft({
    output = 'lulzpack:flamethrower',
    recipe = {
    {'lulzpack:obsidian_plate','lulzpack:obsidian','lulzpack:obsidian_plate'},
    {'','lulzpack:obsidian_plate','lulzpack:obsidian_plate'},
    {'','','lulzpack:obsidian_plate'},
    }
})

minetest.register_craft({
    output = 'lulzpack:granade2 4',
    recipe = {
    {'','lulzpack:redyz_ingot',''},
    {'lulzpack:iron_plate','bucket:bucket_lava','lulzpack:iron_plate'},
    {'','default:coal_lump',''},
    }
})







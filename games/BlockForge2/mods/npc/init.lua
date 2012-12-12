-- NPC max walk speed
walk_limit = 1

-- Player animation speed
animation_speed = 30

-- Player animation blending
-- Note: This is currently broken due to a bug in Irrlicht, leave at 0
animation_blend = 0

-- Default player appearance
default_model = "character.x"
default_textures = {"character.png", }

-- Frame ranges for each player model
function player_get_animations(model)
	if model == "character.x" then
		return {
		stand_START = 0,
		stand_END = 79,
		sit_START = 81,
		sit_END = 160,
		lay_START = 162,
		lay_END = 166,
		walk_START = 168,
		walk_END = 187,
		mine_START = 189,
		mine_END = 198,
		walk_mine_START = 200,
		walk_mine_END = 219
		}
	end
end

local player_model = {}
local player_anim = {}
local player_sneak = {}
local ANIM_STAND = 1
local ANIM_SIT = 2
local ANIM_LAY = 3
local ANIM_WALK  = 4
local ANIM_WALK_MINE = 5
local ANIM_MINE = 6

function player_update_visuals(self)
	--local name = get_player_name()

	visual = default_model
	player_anim = 0 -- Animation will be set further below immediately
	--player_sneak[name] = false
	prop = {
		mesh = default_model,
		textures = default_textures,
		visual = "mesh",
		visual_size = {x=1, y=1},
	}
	self.object:set_properties(prop)
end

BOAT_ENTITY = {
	physical = true,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = "character.x",
	textures = {"steve.jpg"},
	player_anim = 0,
	timer = 0,
	turn_timer = 0,
	vec = 0,
	yaw = 0,
	yawwer = 0,
	state = 1,
	jump_timer = 0,
}

BOAT_ENTITY.on_activate = function(self)
	player_update_visuals(self)
	self.anim = player_get_animations(visual)
	self.object:set_animation({x=self.anim.stand_START,y=self.anim.stand_END}, animation_speed_mod, animation_blend)
	self.player_anim = ANIM_STAND
	self.object:setacceleration({x=0,y=-10,z=0})
	self.state = 1
end

BOAT_ENTITY.on_step = function(self, dtime)
	self.timer = self.timer + 0.01
	self.turn_timer = self.turn_timer + 0.01
	self.jump_timer = self.jump_timer + 0.01
	if self.timer > math.random(1,20) then
		self.state = math.random(1,2)
		self.timer = 0
	end
	--STANDING
	if self.state == 1 then
		self.yawwer = true
		for  _,object in ipairs(minetest.env:get_objects_inside_radius(self.object:getpos(), 3)) do
			if object:is_player() then
				self.yawwer = false
				NPC = self.object:getpos()
				PLAYER = object:getpos()
				self.vec = {x=PLAYER.x-NPC.x, y=PLAYER.y-NPC.y, z=PLAYER.z-NPC.z}
				self.yaw = math.atan(self.vec.z/self.vec.x)+math.pi^2
				if PLAYER.x > NPC.x then
					self.yaw = self.yaw + math.pi
				end
				self.yaw = self.yaw - 2
				self.object:setyaw(self.yaw)
			end
		end
		
		if self.turn_timer > math.random(1,4) and yawwer == true then
			self.yaw = 360 * math.random()
			self.object:setyaw(self.yaw)
			self.turn_timer = 0
		end
		self.object:setacceleration({x=0,y=-10,z=0})
		self.object:setvelocity({x=0,y=self.object:getvelocity().y,z=0})
		if self.player_anim ~= ANIM_STAND then
			self.anim = player_get_animations(visual)
			self.object:set_animation({x=self.anim.stand_START,y=self.anim.stand_END}, animation_speed_mod, animation_blend)
			self.player_anim = ANIM_STAND
		end
	end
	--WALKING
	if self.state == 2 then
		--stop NPC from walking way toooooo fast!
		if self.object:getvelocity().x > walk_limit then
			self.object:setvelocity({x=walk_limit,y=self.object:getvelocity().y,z=self.object:getvelocity().z})
		end
		if self.object:getvelocity().x < walk_limit*-1 then
			self.object:setvelocity({x=walk_limit*-1,y=self.object:getvelocity().y,z=self.object:getvelocity().z})
		end
		if self.object:getvelocity().z > walk_limit then
			self.object:setvelocity({x=self.object:getvelocity().x,y=self.object:getvelocity().y,z=walk_limit})
		end
		if self.object:getvelocity().z < walk_limit*-1 then
			self.object:setvelocity({x=self.object:getvelocity().x,y=self.object:getvelocity().y,z=walk_limit*-1})
		end
		if self.turn_timer > math.random(1,4) then
			self.yaw = 360 * math.random()
			self.object:setyaw(self.yaw)
			self.turn_timer = 0
			self.direction = {x = math.sin(self.yaw)*-1, y = -10, z = math.cos(self.yaw)}
			self.object:setvelocity({x=0,y=self.object:getvelocity().y,z=0})
			self.object:setacceleration(self.direction)
		end
		if self.player_anim ~= ANIM_WALK then
			self.anim = player_get_animations(visual)
			self.object:set_animation({x=self.anim.walk_START,y=self.anim.walk_END}, animation_speed_mod, animation_blend)
			self.player_anim = ANIM_WALK
		end
		--jump
		
		if self.direction ~= nil then
			if self.jump_timer > 0.3 then
				--print(dump(minetest.env:get_node({x=self.object:getpos().x + self.direction.x,y=self.object:getpos().y-1,z=self.object:getpos().z + self.direction.z})))
				if minetest.env:get_node({x=self.object:getpos().x + self.direction.x,y=self.object:getpos().y-1,z=self.object:getpos().z + self.direction.z}).name ~= "air" then
					self.object:setvelocity({x=self.object:getvelocity().x,y=5,z=self.object:getvelocity().z})
					self.jump_timer = 0
				end
			end
		end
	end
end

minetest.register_entity("npc:npc", BOAT_ENTITY)

minetest.register_node("npc:spawnegg", {
	description = "spawnegg",
	image = "mobspawnegg.png",
	wield_image = "mobspawnegg.png",
	paramtype = "light",
	tiles = {"spawnegg.png"},
	is_ground_content = true,
	drawtype = "glasslike",
	groups = {crumbly=3},
	selection_box = {
		type = "fixed",
		fixed = {0,0,0,0,0,0}
	},
	sounds = default.node_sound_dirt_defaults(),
	on_place = function(itemstack, placer, pointed)
		pos = pointed.above
		pos.y = pos.y + 1
		minetest.env:add_entity(pointed.above,"npc:npc")
	end
})
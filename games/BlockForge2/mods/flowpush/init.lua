--[[FlowPush

function water_push(pos, node)
            local items= minetest.env:get_objects_inside_radius(pos, 1)
            for _,item in ipairs(items) do
                if item:get_luaentity() then  
                    vec=item:getvelocity()
                    local const=1
                    item:setvelocity({x=vec.x+const*math.random(-8,8),y=vec.y+const*math.random(1,3),z=vec.z+const*math.random(-5,5)})                       
                end
            end
end

minetest.register_abm ({
        nodenames = {"default:water_flowing"},
        interval = 1,
        chance = 1,
        action = water_push, 
})]]

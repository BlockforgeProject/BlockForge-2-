minetest.register_node("lulzpack:little_tnt", {
	description = "Little TNT",
	tiles ={"little_tnt.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_stone_defaults(),
})

--[[function explose_litte_tnt(pos,node)
    local axis={x=pos.x+1,y=pos.y,z=pos.z}
    for i=-3,3 do
        minetest.env:set_node( {x=axis.x,y=axis.y,z=axis.z+1},{name="air"})
    end
    local axis2={x=pos.x+2,y=pos.y,z=pos.z}
    for i=-3,3 do
        minetest.env:set_node( {x=axis2.x,y=axis2.y,z=axis2.z+i},{name="air"})
    end
    local axis3={x=pos.x,y=pos.y,z=pos.z}
    for i=-3,3 do
        minetest.env:set_node( {x=axis3.x,y=axis3.y,z=axis3.z+i},{name="air"})
    end
    local axis4={x=pos.x-1,y=pos.y,z=pos.z}
    for i=-3,3 do
        minetest.env:set_node( {x=axis4.x,y=axis4.y,z=axis4.z+i},{name="air"})
    end
    local axis5={x=pos.x-2,y=pos.y,z=pos.z}
    for i=-3,3 do
        minetest.env:set_node( {x=axis5.x,y=axis5.y,z=axis5.z+i},{name="air"})
    end
end
            
minetest.register_abm({
    nodenames={"lulzpack:little_tnt"},
    interval=5,
    chance=1,
    action=explose_little_tnt, })]]

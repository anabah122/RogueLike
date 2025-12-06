
local msgObj = {}
msgObj.__index = msgObj


function msgObj:new()
    return setmetatable( {} , self )
end


-- add add msg to queue
function msgObj:add( aura ) -- aura obj
    table.insert( self, 
        "{ type='ADD', id="..aura.id..", icon='interface/icons/"..aura.icon.."', description='"..aura.desc.."' }" 
    )
    return self
end


-- add del msg to queue
function msgObj:del( id ) -- aura obj

    if type( id )=='table' then
        table.insert( self, 
            "{ type='DEL' ,id="..id.id.." }" 
        )
    else
        table.insert( self, 
            "{ type='DEL' ,id="..id.." }" 
        )
    end
    return self
end


-- add del msg to queue
function msgObj:delAll( ) -- aura obj
    table.insert( self, 
        "{ type='ALL' }" 
    )
    return self
end


function msgObj:__add
    ( other )
    for i,v in ipairs( other ) do 
        table.insert( self, v )
    end
    return self 
end


-- push messages to frontend
function msgObj:pushMessages( player )
    player:SendAddonMessage("commandAuraDisplay", "return { "..table.concat(self,',').." }" , 7, player )
end



return msgObj
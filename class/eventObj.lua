
local msgObj = require'class.msgObj'


local eventObj = {}
eventObj.__index = eventObj


--[[
eventObj {
    start --function 
    stop  --function 
    triggers = { -- bool 
        onCombatStart , onCombatEnd , onLoggin, onSpellCast, onKillCreature, onQuestComplete, onPlayerHeal, onPlayerDamage
    }
    stopTrig
    id , desc , icon  
}
]]



function eventObj:new( args )
    return setmetatable( args , eventObj )
end



function eventObj:register( target )

    local guid
    if type( target )=='string' then 
        guid = target
    else
        guid = tostring( target:GetGUID() )
    end
    
    if not global.players[ guid ] then
        global.players[ guid ]={} 
    end

    local evList = global.players[ guid ]
    if evList[self.id] then 
        print("warning: try duplicate mods ! register for evObj "..self.id..' ignore')
        return self
    end

    if target:GetGUID() then 
        msgObj:new():add(self):pushMessages( target )
    end

    evList[self.id] = self 
    return self 

end


return eventObj
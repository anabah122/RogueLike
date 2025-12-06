

local keys = { 'onCombatStart' , 'onCombatEnd' , 'onLoggin', 'onSpellCast', 'onKillCreature', 'onQuestComplete' }

local effect = require'class.effect'
local msgObj = require'class.msgObj'


local eventObj = {}
eventObj.__index = eventObj

--[[
eventObj {
    id , amount, desc , icon 
    func --function( 'onCombatStart', { player, enemy ... } )
    triggers = { -- bool 
        onCombatStart , onCombatEnd , onLoggin, onSpellCast, onKillCreature, onQuestComplete, 
    }
}
]]


function eventObj:new( args )
    return setmetatable( args , self )
end


function eventObj:register( targ )

    local guid = targ:guid()

    if not global.players[ guid ] then 
        global.players[ guid ]={}
    end

    global.players[ guid ][ self.id ] = self 

    effect:new( self.id , self.amount ):preform( targ )
    msgObj:new()
        :add( { id=self.id, icon=self.icon, desc=self.desc } )
        :pushMessages( targ )

    return self
end


function eventObj:unregister( targ )
    
    local guid = targ:guid()

    global.players[ guid ][ self.id ]   = nil

    effect:new( self.id ):remove( targ )
    msgObj:new()
        :del( self.id )
        :pushMessages( targ )

    return self
end


return eventObj
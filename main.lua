
require'libs.printUtil'



_G.global = {
    players = {
        --[[ [ guid ] {
            [ eventId ] 
                = eventObj {
                    start function 
                    stop function 
                    startTrig
                    stopTrig
                    id , desc , icon  
                }
        }]]
    }
}




local msgObj = require'class.msgObj'

RegisterPlayerEvent( 3, function(event, player) 

    if not global.players[ player:guid() ] then return false end 

    local pObj = global.players[ player:guid() ]

    local msg = msgObj:new():delAll()
    for _,ev in pairs( pObj ) do 
        msg:add(ev)
    end

    msg:pushMessages( player ) 

end)

   



-- loading order
_G.eventsList = require'DATA.eventLoader'

local loader = require'DATA.dataLoader'
global.players = loader.load() or {}





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
    queue = {
        --[[
        [ guid ] {
            onCombatStart ={}, 
            onCombatEnd={}, 
            onLoggin={}, 
            onSpellCast={}, 
            onKillCreature={}, 
            onQuestComplete={}, 
        }
        ]]
    }
}


-- loading order

local effect = require'class.effect'
local msgObj = require'class.msgObj'






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


-- loading order
local loader = require'DATA.loader'
loader.load()

local effect = require'class.effect'
local msgObj = require'class.msgObj'




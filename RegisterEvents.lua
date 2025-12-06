

-- test block 
local eventObj = require'class.eventObj'

RegisterPlayerEvent(19, function(event, player, msg, Type, lang, receiver)
    if receiver==player and msg=='test' then
        
        eventObj:new({
            id=16789 , 
            desc='Гнев|при входе в бой увеличивает наносимый физический урон и скорость атаки на 50|на 15 сек' , 
            icon='spell_shadow_unholyfrenzy',
            
            func = function( self, eventName, args ) 
                local player, enemy = unpack( args )
                player:AddAura( self.id , player )
            end ,
            
            triggers = { -- bool 
                onCombatStart=true
            }
        }):register( player )

    end
end)
-- test block 


local keys = { 'onCombatStart' , 'onCombatEnd' , 'onLoggin', 'onSpellCast', 'onKillCreature', 'onQuestComplete' }

local function QueueTrigger( trigName, args )

    local guid = args[1]:guid()
    if not guid then return nil end

    local evList = global.players[ guid ]
    if not evList then return nil end

    for _,ev in pairs( evList ) do 
        if ev.triggers[ trigName ] then
            ev:func( trigName, args )
        end
    end

end



-- PLAYER MUST BE FIRST IN ARGS TBL

-- onCombatStart
RegisterPlayerEvent( 33 , 
function(event, player, enemy)
    QueueTrigger( 'onCombatStart', { player, enemy } )
end)

-- onCombatEnd
RegisterPlayerEvent( 34 , 
function(event, player)
    QueueTrigger( 'onCombatEnd', { player } )
end)

-- onLoggin
RegisterPlayerEvent( 3 , 
function(event, player)
    QueueTrigger( 'onLoggin', { player } )
end)

-- onSpellCast
RegisterPlayerEvent( 5 , 
function(event, player, spell, skipCheck)
    QueueTrigger( 'onSpellCast', { player, spell, skipCheck } )
end)

-- onKillCreature
RegisterPlayerEvent( 7 , 
function(event, player, killed)
    QueueTrigger( 'onKillCreature', { player, killed } )
end)

-- onQuestComplete
RegisterPlayerEvent( 54 , 
function(event, player, quest)
    QueueTrigger( 'onQuestComplete', { player, quest } )
end)

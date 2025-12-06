local eventObj = require'class.eventObj'

local eventsList = {}


eventsList['rage'] = 
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
    })


eventsList['fury'] = 
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
    })

    

for k,ev in pairs( eventsList ) do 
    ev.listkey = k
end


return eventsList 
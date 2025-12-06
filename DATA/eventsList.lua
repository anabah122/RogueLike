local eventObj = require'class.eventObj'

local eventsList = {}

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


eventsList['rage'] = 
    eventObj:new({
        id=16789 , 
        desc='Гнев|при входе в бой увеличивает наносимый физический урон и скорость атаки на 50|на 15 сек' , 
        icon='spell_shadow_unholyfrenzy',
        
        func = function( self, eventName, args ) 

            local player, enemy = unpack( args )
            local group = player:GetGroup()
            group = group or { player }

            for _, p in ipairs( group ) do 
                player:AddAura( self.id , p )
            end

        end ,
        
        triggers = { -- bool 
            onCombatStart=true
        }
    })


eventsList['herb'] = 
    eventObj:new({
        id=21955 , 
        desc='Целебный корень|при входе в бой востанавилвает 600 здоровья и маны в течение 10 сек' , 
        icon='inv_misc_herb_07',
        
        func = function( self, eventName, args ) 

            local player, enemy = unpack( args )
            local group = player:GetGroup()
            group = group or { player }

            for _, p in ipairs( group ) do 
                player:AddAura( self.id , p )
            end

        end ,
        
        triggers = { -- bool 
            onCombatStart=true
        }
    })


eventsList['axe'] = 
    eventObj:new({
        id=16075 , 
        desc='Бросок топора|при входе в бой кидает тяжелый топор в произвольного противника, нанося 1750 урона и оглушая его на 2 сек' , 
        icon='inv_axe_08',
        
        func = function( self, eventName, args ) 
            local player, enemy = unpack( args )
            player:CastSpell( enemy, self.id , true )
        end ,
        
        triggers = { -- bool 
            onCombatStart=true
        }
    })

eventsList['tunderShield'] = 
    eventObj:new({
        id=64187 , 
        desc='Щит бурь|наносит 250 урона от сил природы атакующим, когда по нему проходит удар|невосприимчивость к эффектам оглушения' , 
        icon='spell_nature_lightningshield',
        
        func = function( self, eventName, args ) 
            local player, enemy = unpack( args )
            player:CastSpell( enemy, self.id , true )
        end ,
        
        triggers = { -- bool 
            onLoggin=true
        }
    })

    


--

for k,ev in pairs( eventsList ) do 
    ev.listkey = k
end


return eventsList 
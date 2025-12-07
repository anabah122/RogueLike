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
            local group = player:GetGroup()
            group = group or { player }

            for _, p in ipairs( group ) do 
                player:CastSpell( p, self.id , true )
            end
        end ,
        
        triggers = { -- bool 
            onLoggin=true, onCombatStart=true
        }
    })

    
eventsList['shadowShield'] = 
    eventObj:new({
        id=22417 , 
        desc='Щит Тени|при входе в бой на 30 сек вы получаете щит который поглощает до 400 урона' , 
        icon='spell_shadow_antishadow',
        
        func = function( self, eventName, args ) 
            local player, enemy = unpack( args )
            local group = player:GetGroup()
            group = group or { player }

            for _, p in ipairs( group ) do 
                player:AddAura( self.id , p )
            end
        end ,
        
        triggers = { -- bool 
            onLoggin=true, onCombatStart=true
        }
    })


eventsList['wildHeal'] = 
    eventObj:new({
        id=9616 , 
        desc='Дикое востановление|при победой над противником c 20% шансом восполняет члену группы 23-37 здоровья раз в 2 сек. в течение 20 сек' , 
        icon='spell_nature_rejuvenation',
        
        func = function( self, eventName, args ) 
            local player, enemy = unpack( args )
            local group = player:GetGroup()
            group = group or { player }

            for _, p in ipairs( group ) do 
                if math.random(10)<2 then 
                    player:AddAura( self.id , p )
                end
            end
        end ,
        
        triggers = { -- bool 
            onKillCreature=true
        }
    })

eventsList['manaTitan'] = 
    eventObj:new({
        id=50983 , 
        desc='Титан магии|при исцелении и нанесения урона магическими умениями с шансом 2% члены группы могут получить эффект|восполнение 10% маны в секунду в течение 10 сек, получаемый урон повышается на 400%.' , 
        icon='ability_mage_shattershield',
        
        func = function( self, eventName, args ) 
            local player, enemy = unpack( args )
            local group = player:GetGroup()
            group = group or { player }

            for _, p in ipairs( group ) do 
                if math.random(100)<2 and p:HasCasterSpec() then 
                    player:AddAura( self.id , p )
                end
            end
        end ,
        
        triggers = { -- bool 
            onSpellCast=true
        }
    })

    


--

for k,ev in pairs( eventsList ) do 
    ev.listkey = k
end


return eventsList 
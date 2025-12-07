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

-- on combat and login
eventsList['rage'] = 
    eventObj:new({
        id=16789 , 
        desc='Гнев|при входе в бой увеличивает наносимый физический урон и скорость атаки на 50|на 15 сек' , 
        icon='spell_shadow_unholyfrenzy',
        
        func = function( self, eventName, args ) 

            local player, enemy = unpack( args )
            local group = player:GroupTbl()

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
            local group = player:GroupTbl()

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
            local group = player:GroupTbl()

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
            local group = player:GroupTbl()

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
            local group = player:GroupTbl()

            for _, p in ipairs( group ) do 
                if math.random(10)<=2 then 
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
            local group = player:GroupTbl()

            for _, p in ipairs( group ) do 
                if math.random(100)<=2 and p:HasCasterSpec() then 
                    player:AddAura( self.id , p )
                end
            end
        end ,
        
        triggers = { -- bool 
            onSpellCast=true
        }
    })

    
eventsList['admiral'] = 
    eventObj:new({
        id=12022 , 
        desc='Автоматическая адмиральская шляпа|повышает выносливость участников группы, находящихся в радиусе 30 м на 10|обновляется при входе в бой' , 
        icon='inv_helmet_66',
        
        func = function( self, eventName, args ) 
            local player, enemy = unpack( args )
            player:AddAura( self.id , player )
        end ,
        
        triggers = { -- bool 
            onLoggin=true, onCombatStart=true
        }
    })


eventsList['moonLuck'] = 
    eventObj:new({
        id=26522 , 
        desc='Лунная удача|повышает здоровье на 250|обновляется при входе в бой' , 
        icon='achievement_halloween_spider_01',
        
        func = function( self, eventName, args ) 
            local player, enemy = unpack( args )
            local group = player:GroupTbl()

            for _, p in ipairs( group ) do 
                player:AddAura( self.id , p )
            end
        end ,
        
        triggers = { -- bool 
            onLoggin=true, onCombatStart=true
        }
    })

eventsList['criticalstrike'] = 
    eventObj:new({
        id=13847 , 
        desc='Безрассудство|при входе в бой, с шансом 25%, на 15 секунд все атаки становятся критическими, броня ослаблена на 35%' , 
        icon='ability_criticalstrike',
        
        func = function( self, eventName, args ) 
            local player, enemy = unpack( args )
            local group = player:GroupTbl()

            for _, p in ipairs( group ) do 
                if math.random(100)<=25 then 
                    player:AddAura( self.id , p )
                end
            end
        end ,
        
        triggers = { -- bool 
            onCombatStart=true
        }
    })


eventsList['diplomacy'] = 
    eventObj:new({
        id=38916 , 
        desc='Дипломатическая неприкосновенность|при действиях с шансом 20% накладывает на одного члена группы неуязвимость на на 6 секунд' , 
        icon='inv_scroll_01',
        
        func = function( self, eventName, args ) 
            local player, enemy = unpack( args )
            local group = player:GroupTbl()

            for _, p in ipairs( group ) do 
                if math.round(100)<=20 and p:GetHealthPct()<20 then 
                    player:AddAura( self.id , p )
                    break
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
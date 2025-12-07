



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

--[[





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



]]

local eventsList = {}
for fpath in io.popen('dir "lua_scripts/rogueLike/events" /b /a-d'):lines() do
    local fname = fpath:match("(.+)%.[^%.]*$")
    eventsList[ fname ] = dofile('lua_scripts/rogueLike/events/'..fpath)
end


return eventsList 
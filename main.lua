

_G.global = {
    players = {
        --[[ [ guid ] {
            list_ids        >> effects={}, 
            lambdaList      >> events={}
            lambdaList      >> eventsToRemove={}
        }]]
    }
}

local effect = require'effect'
local msgObj = require'msgObj'


RegisterPlayerEvent(19, function(event, player, msg, Type, lang, receiver)
    if receiver==player then

        --[[
        effect:new( 9331 , 100 ):preform( player )
        
        msgObj:new()
            :delAll()
            :add( {id=73828,icon='ability_druid_mastershapeshifter',desc='тест русский|фыв'} )
            :pushMessages( player )
        ]]

        msgObj:new()
            :del( 73828 )
            :pushMessages( player )

    end
end)





--[[


RegisterPlayerEvent(19, function(event, player, msg, Type, lang, receiver)
    player:SendAddonMessage("commandAuraDisplay", "return { { type='ADD' , icon='Interface/Icons/Spell_Nature_Lightning', description='Духовная крепость' } }", 7, player )
end)

RegisterPlayerEvent( 33, function(event, player, enemy)

    local aura = enemy:AddAura( 73828, enemy )
    aura:SetStackAmount( enemy:GetLevel() * 2  ) -- 80*2  * val 25 -- spell power  || max 6 375

    local aura = enemy:AddAura( 9331, enemy )
    aura:SetStackAmount( 10 )--enemy:GetLevel() * 2  ) -- 80*2  * val 20 --  damage  || max 25500

    local hp = enemy:GetMaxHealth() + ( enemy:GetLevel() * 12  )
    enemy:SetMaxHealth( hp )
    enemy:SetHealth( hp )

end)

]]
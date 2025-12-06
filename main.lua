

_G.global = {
    players = {
        --[[ [ player guid ] {
            [ eventId ] 
                eventObj {
                    id , amount, desc , icon 
                    func --function( 'onCombatStart', { player, enemy ... } )
                    triggers = { -- bool 
                        onCombatStart , onCombatEnd , onLoggin, onSpellCast, onKillCreature, onQuestComplete, 
                    }
                }
        }]]
    }
}


local loader = require'DATA.loader'

require'class.playerG'
require'RegisterEvents'



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
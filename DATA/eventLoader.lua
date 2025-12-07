

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



local eventsList = {}
for fpath in io.popen('dir "lua_scripts/rogueLike/events" /b /a-d'):lines() do
    local fname = fpath:match("(.+)%.[^%.]*$")
    eventsList[ fname ] = dofile('lua_scripts/rogueLike/events/'..fpath)
end


return eventsList 
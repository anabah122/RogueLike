

function regGossipEv( npcId , evObj )

    local f1 = RegisterCreatureGossipEvent(npcId, 1, function(event, player, creature)
        player:GossipMenuAddItem(0, evObj.name, 0, evObj.id)
        player:GossipSendMenu(1, creature)
    end)

    local f2 = RegisterCreatureGossipEvent(npcId, 2, function(event, player, creature, sender, intid, code, menu_id)
        if intid == evObj.id then
            player:SendBroadcastMessage("Вы получили улучшение "..evObj.name)
            evObj:register( player )
            player:GossipComplete()
        end
    end)

    return f1,f2
end


_G.eventsList = {}

for fpath in io.popen('dir "lua_scripts/rogueLike/events" /b /a-d'):lines() do
    local fname = fpath:match("(.+)%.[^%.]*$")
    eventsList[ fname ] = dofile('lua_scripts/rogueLike/events/'..fpath)
end


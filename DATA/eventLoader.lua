

function regGossipEv( npcId , name )

    local f1 = RegisterCreatureGossipEvent(npcId, 1, function(event, player, creature)
        player:GossipMenuAddItem(0, name, 0, 128)
        player:GossipSendMenu(1, creature)
    end)

    local f2 = RegisterCreatureGossipEvent(npcId, 2, function(event, player, creature, sender, intid, code, menu_id)
        if intid == 128 then
            player:SendBroadcastMessage("Вы получили улучшение "..name)
            eventObj:register( player )
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



-- on add combat bonus 
RegisterPlayerEvent( 33 , 
function(event, player, enemy)

    local guid = tostring( player:GetGUID() )

    if guid and global.players[ guid ] then
        
        local evList = global.players[ guid ].events
        for _,fu in ipairs( evList ) do 
            fu( player, global.players[ guid ], enemy )
        end
    end

end)


-- on remove combat bonus 
RegisterPlayerEvent( 34 , 
function(event, player)

    local guid   = tostring( player:GetGUID() )

    if guid and global.players[ guid ] then
        local evList = global.players[ guid ].eventsToRemove
        local enemys = global.players[ guid ].enemys

        for _,fu in ipairs( evList ) do 
            fu( player, global.players[ guid ] )
        end
    end

end)
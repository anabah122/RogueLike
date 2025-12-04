        --[[
RegisterPlayerEvent(19, function(event, player, msg, Type, lang, receiver)
    if receiver==player then


        effect:new( 9331 , 100 ):preform( player )
        
        msgObj:new()
            :delAll()
            :add( {id=73828,icon='ability_druid_mastershapeshifter',desc='тест русский|фыв'} )
            :pushMessages( player )
        

        msgObj:new()
            :del( 73828 )
            :pushMessages( player )
        
    end
end)
]]



local function QueueTrigger( trigName, player )

    local guid = player:GetGUID()
    if not guid then return nil end

    local q = global.queue[ guid ]
    if not q then return nil end

    local _q = q[ trigName ]
    if not _q then return nil end 

    for _,EV in ipairs( _q ) do 
        EV.mainFunc()
    end

end



-- on combat start
RegisterPlayerEvent( 33 , 
function(event, player, enemy)
    QueueTrigger( 'onCombatStart', player )
end)


-- on combat stop
RegisterPlayerEvent( 34 , 
function(event, player)
    QueueTrigger( 'onCombatEnd', player )
end)


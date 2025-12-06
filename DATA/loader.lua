
local ser = require'libs/serpRG'
local F = require'libs/file'

local dataPath = '../playersDATA.dump'

local loader = {}

function loader.save ()
    local saveData = {}

    for guid, p in pairs( global ) do
        saveData[ guid ] = {}
        for evId, ev in pairs( p ) do
            saveData[ guid ][ evId ]=true
        end
    end
    F:path( dataPath ):w( ser.block( saveData , {comment=false} ) )
end

function loader.load()
    local t = F:path( dataPath ):r()
    print( t )
    local ok, tbl = ser.load( t )
    return tbl
end


--ALE_EVENT_ON_LUA_STATE_CLOSE
RegisterServerEvent( 16, function( _ ) loader.save() end)

-- on server shutdown
RegisterServerEvent( 15, function( _ ) loader.save() end)


return loader

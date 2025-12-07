
local ser = require'libs/serpRG'
local F = require'libs/file'
local dataPath = 'lua_scripts/rogueLike/DATA/playersData.luaM'

local loader = {}

function loader.save ()
    print( 'save on' )
    
    local toSave = {}
    for guid,p in pairs( global.players ) do
        toSave[ guid ] = {}
        for _, ev in pairs( p ) do 
            table.insert( toSave[ guid ] , ev.name )
        end
    end

    F:path( dataPath ):w( ser.block( toSave , {comment=false} ) )
end

function loader.load()
    local t = F:path( dataPath ):r()
    local ok, tbl = ser.load( t )
    local res = {}

    for guid,pObj in pairs( tbl ) do
        res[ guid ] = {}
        for _,evKey in pairs( pObj ) do 
            local evObj = _G.eventsList[ evKey ]
            res[ guid ][ evObj.id ] = evObj 
        end
    end

    return res
end


--ALE_EVENT_ON_LUA_STATE_CLOSE
RegisterServerEvent( 16, function( _ ) loader.save() end)


return loader

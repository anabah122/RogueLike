
local rand  = math.random 

function math.chance( arg )
    return rand( 100 )<=arg
end
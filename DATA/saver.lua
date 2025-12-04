
local binser = require'../binser'
local dataPath = '../DATA.bin'
local saver = {}

function saver.save ( tbl )
   binser.w( dataPath, tbl )
end

function saver.load ()
    local d, len = binser.r( dataPath )
    return d[1]
end


return saver

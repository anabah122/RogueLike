
local file = {}
file.__index = file 


function file:path( path )
    return setmetatable( { path = path }, file )
end

function file:read()
    local f = assert(io.open(self.path, "r"))
    local t = f:read("*all")
    f:close()
    return t  
end

function file:write( dataStr )
    local file = assert(io.open(self.path, "w"))
    file:write(dataStr)
    file:close()
    return self 
end

function file:append( dataStr )
    local file = assert(io.open(self.path, "a"))
    file:write(dataStr)
    file:close()
    return self 
end

file.r, file.w, file.a = file.read, file.write, file.append

return file 


function Player:guid()
    return tostring( self:GetGUID() )
end


function Player:GroupTbl()
    local group = self:GetGroup()
    if group then 
        group = group:GetMembers()
    else
        group = { player }
    end
    return group
end
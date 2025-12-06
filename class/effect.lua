local effect = {}
effect.__index = effect


function effect:new( id , amount )
    amount = amount or nil
    return setmetatable( { id = id, amount = amount } , self )
end


function effect:preform( targ )

    local aura = targ:AddAura( self.id, targ )
    if not aura then  return nil end

    if self.amount then 
        aura:SetStackAmount( self.amount )
    end
    return aura

end


function effect:remove( targ )

    local aura = targ:GetAura( self.id )
    if aura then 
        aura:Remove()
    end

end


return effect
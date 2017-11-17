hook.Add("PhysgunPickup", "PhysgunFreeze.PhysgunPickup", function(pl, ent)
	if ent:IsPlayer() and pl:IsAdmin() then
		--ent.physAdmin = pl
		ent:Freeze(true)
		ent:SetMoveType(MOVETYPE_NOCLIP)
		return true
	end
end)

hook.Add("PhysgunDrop", "PhysgunFreeze.PhysgunDrop", function(pl, ent)
	if ent:IsPlayer() and pl:IsAdmin() then
		if pl:KeyPressed(IN_ATTACK2) then return end

		--ent.physAdmin = nil
		ent:DropToFloor()
		ent:Freeze(false)
		ent:SetMoveType(MOVETYPE_WALK)
	end
end)

hook.Add("playerCanChangeTeam", "PhysgunFreeze.playerCanChangeTeam", function(ply)
	if ply:IsFrozen() then
		return false, "You can't change jobs while frozen, duh"
	end
end)

print("Crident Physgun Freeze Loaded")
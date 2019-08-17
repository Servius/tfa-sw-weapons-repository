if SERVER then AddCSLuaFile() end

GMSNX = {}
GMSNX.StatusEffects = {
	["heal"] = {
		["string"] = "Healing",
		["function"] =
			function(target, dealer, effect, duration, amount)
				local mult
				if target == dealer then
					mult = 0.25
				else
					mult = 1
				end
				local hpam = amount*mult
				local hpdur = duration
				local hptick = (amount/duration)*mult

				local HealAmount
				for i = 1, hpdur*hptick do
					timer.Simple(i/hptick, function()
						if !target:IsValid() then return end
						local futureheal = ( hpam/hpdur )/hptick

						if (target:GetMaxHealth()*2) - target:Health() >= futureheal then
							HealAmount = futureheal
						else
							HealAmount = ((target:GetMaxHealth()*2) - target:Health())
						end

						target:SetHealth( target:Health() + HealAmount )
					end)
				end

				if effect then
					local ED_Heal = EffectData()
					ED_Heal:SetOrigin( target:GetPos() )
					ED_Heal:SetEntity( target )
					ED_Heal:SetMagnitude( hpam )
					ED_Heal:SetScale( hpdur )
					util.Effect("snx_passive_heal", ED_Heal, true, true)
				end
			end
		},
	["stun"] = {
		["string"] = "Stun",
		["function"] =
			function(target, dealer, effect, duration)
				local function RemoveFrozen(target)
					if target:IsValid() then
						target.SNXStatFrozen = false

						if target:IsPlayer() then
							target:ScreenFade( SCREENFADE.IN, Color( 0, 200, 255, 125 ), 0.4, 0.2 )
							target:Freeze( false )
						elseif target:IsNPC() then
							target:SetCondition( 68 )
							if target:Health() < 1 then
								target:SetNPCState(7)
							end
						end
					end
				end

				if ((target:IsPlayer() and target ~= dealer) or target:IsNPC()) then
					if target.SNXStatFrozen then
						if target:Health() < 1 then
							RemoveFrozen(target)
						end
					else
						target.SNXStatFrozen = true

						if target:IsPlayer() then
							target:ScreenFade( SCREENFADE.OUT, Color( 0, 200, 255, 125 ), 0.2, 2.5 )
							target:Freeze( true ) 
						elseif target:IsNPC() then
							target:SetSchedule( SCHED_NPC_FREEZE )
							target:StopMoving()
						end

						timer.Simple( duration, function()
							RemoveFrozen(target)
						end )
					end

					if effect then
						local ED_Stun = EffectData()
						ED_Stun:SetOrigin( target:GetPos() )
						ED_Stun:SetEntity( target )
						ED_Stun:SetScale( duration )
						util.Effect("snx_passive_stun", ED_Stun, true, true)
					end
				end
			end
		},
	["poison"] = {
		["string"] = "Poison",
		["function"] =
			function(target, dealer, effect, duration, damage)
				if !(target:IsPlayer() or target:IsNPC()) then return false end
				local tick = damage/duration
				if target:IsPlayer() then
					local playerdead = false
				end
				for i = 1, duration do
					timer.Simple(i-1, function()
						if target:IsPlayer() then
							if !target:Alive() then 
								playerdead = true
							end
							if playerdead then return end
						end
						if !target:IsValid() then return end
						local futdmg = ( damage/duration )
						target:TakeDamage(futdmg, dealer, dealer)
					end)
				end

				if effect then
					local ED_Poison = EffectData()
					ED_Poison:SetOrigin( target:GetPos() )
					ED_Poison:SetEntity( target )
					ED_Poison:SetMagnitude( damage )
					ED_Poison:SetScale( duration )
					util.Effect("snx_passive_poison", ED_Poison, true, true)
				end

			end
		},
}

function GMSNX:AddStatus(target, dealer, type, a, b, c)
	if target:IsPlayer() or target:IsNPC() then
		GMSNX.StatusEffects[type]["function"](target, dealer, c, a, b)
	end
end
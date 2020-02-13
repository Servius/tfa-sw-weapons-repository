--[[
Coded by TFA ( http://steamcommunity.com/profiles/76561198161775645 )
Commissioned by Servius ( http://steamcommunity.com/profiles/76561198036188853/ )
Written: 1/19/2017
Begun: 9:52 PM CDT
Draft 1 Finished: 11:49 PM CDT
]]--

--[[Documentation]]--

--[[Stunning]]--

--For GENERAL USAGE, use TFA_RP_Stun( ply, duration, effect )
--ply is the player to stun, duration is the length to stun, and effect is the Lua effect to use
--Leaving the effect to nil will give it a pronounced lightning effect.  Or, setting it to "BGOLightning" will give it a nice lightning effect which lasts for a set length of 5 seconds.
--Example: TFA_RP_Stun( Entity(1), 5, "TeslaHitBoxes" )

--For SWEPs, use TFA_RP_StunEasy( a,b,c, length, effect )
--This function is easily placed in a bullet callback; length and effect are optional, but not required.  Length will default to 3.
--TFA Base example:
--SWEP.CustomBulletCallback = function(a,b,c)
--	TFA_RP_StunEasy(a,b,c)
--end

--[[Melting]]--

--For GENERAL USAGE, use TFA_RP_Melt( ent, fade, duration, recovery, fx, snd, col  )
--ent is the entity to melt ( please use carefully ), fade is the "fade-in" of the melting animation, duration is the recovery to remain melted, and recovery is the "fade-out" of the melting animation
--optionally: fx is the Lua effect to use, snd is the melt sound, and col is the melt color ( defined as a Color(r,g,b,a) )
--Example:  TFA_RP_Melt( Entity(1):GetEyeTrace().Entity, 1, 15, 1, "Explosion", "misc/bomb.wav", Color(255,0,0,255)  )

--For SWEPs, use TFA_RP_MeltEasy( a,b,c, duration, fx, snd, col )
--This function is easily placed in a bullet callback; Duration is optional, but not required, and will default to 15.
--TFA Base example:
--SWEP.CustomBulletCallback = function(a,b,c)
--	TFA_RP_MeltEasy(a,b,c)
--end

--[[ Important Funcs/Vars ]]--

local wrongsound = "common/warning.wav" --Error sound for easy SWEP accessors
local MeltColor = Color( 0,0,0, 255 ) --Default melt color

function TFA_RP_StunEasy( a,b,c, length, effect )
	if IsValid(b.Entity) and b.Entity:IsPlayer() then
		TFA_RP_Stun( b.Entity, length or 3, effect or "BGOLightning" )
	elseif IsValid(b.Entity) and ( not b.Entity:IsWorld() ) and surface then
		surface.PlaySound( wrongsound )
	end
end

function TFA_RP_Stun( ent, duration, effect )
	ent:SetNW2Float("TFA_RP_StunEnd", CurTime() + duration )
	if ent.GetActiveWeapon and IsValid( ent:GetActiveWeapon() ) then
		local wep = ent:GetActiveWeapon()
		wep:SetNextPrimaryFire( math.max( wep:GetNextPrimaryFire(), CurTime() + duration ) )
		wep:SetNextSecondaryFire(wep:GetNextPrimaryFire() )
	end
	effect = effect or "TeslaHitBoxes"
	if effect == "BGOLightning" then
		ent.NextBGOLightning = ent.NextBGOLightning  or 0
		if CurTime() > ent.NextBGOLightning then
			ParticleEffectAttach("tfa_lightning_model", PATTACH_ABSORIGIN_FOLLOW, ent, 0)
			ent.NextBGOLightning  = CurTime() + 1
		end
		ent:SetNW2String("TFA_RP_StunFX","")
	else
		local fx = EffectData()
		fx:SetOrigin( ent:GetShootPos() )
		fx:SetNormal( Vector(0,0,1) )
		fx:SetEntity(ent)
		fx:SetScale(1)
		fx:SetMagnitude(1)
		util.Effect(effect,fx)
		ent:SetNW2String("TFA_RP_StunFX",effect)
	end
end

function TFA_RP_MeltEasy( a,b,c, duration, ... )
	duration = duration or 15
	if IsValid(b.Entity) and b.Entity:GetClass() == "prop_physics" then
		TFA_RP_Melt( b.Entity, 1, duration, 1, ... )
	elseif IsValid(b.Entity) and ( not b.Entity:IsWorld() ) and b.Entity:GetClass() ~= "prop_physics" and surface then
		surface.PlaySound( wrongsound )
	end
end

function TFA_RP_Melt( ent, fade, duration, recovery, fx, snd, col  )
	if not SERVER then return end
	local ct = CurTime()
	ent.Melt_FadeStart = ent.Melt_FadeStart or ct
	local fade2 = fade - ( ct - ent.Melt_FadeStart )
	ent.Melt_PreMeltColor = ent.Melt_PreMeltColor or ent:GetColor()
	ent.Melt_HideStart = ct + fade2
	ent.Melt_RecoverStart = ct + fade2 + duration
	ent.Melt_RecoverEnd = ct + fade2 + duration + recovery
	ent.Melt_FinishEffect = fx or "ManhackSparks"
	ent.Melt_FinishSound = snd or "Explosion"
	ent.Melt_FinishColor = col or MeltColor
	local hkid = ent:EntIndex() .. "melt"
	hook.Add("Tick",hkid, function()
		local mt = TFA_RP_MeltThink(ent)
		if not mt then
			hook.Remove( "Tick", hkid )
		end
	end)
end

--[[ Acid ]]--

local l_Lerp = Lerp
local l_Clamp = math.Clamp
local tmpcol = Color(0,0,0,255)

local function MixCol(fac, from, to)
	tmpcol.r = l_Lerp(fac, from.r, to.r)
	tmpcol.g = l_Lerp(fac, from.g, to.g)
	tmpcol.b = l_Lerp(fac, from.b, to.b)
	tmpcol.a = l_Lerp(fac, from.a, to.a)

	return tmpcol
end

local function CalcFac( t, startv, endv )
	return l_Clamp( ( t - startv ) / ( endv - startv ), 0, 1 )
end

local upvec = Vector(0,0,1)

local function MeltEnt( ent )
	if not IsValid(ent) then return end
	if ent.IsMelted then return end
	ent.IsMelted = true
	local fx = EffectData()
	fx:SetOrigin(ent:GetPos())
	fx:SetEntity(ent)

	util.Effect( ent.Melt_FinishEffect or "ManhackSparks", fx)
	fx:SetScale(0.1)
	fx:SetMagnitude(0.1)
	fx:SetNormal( upvec )
	if ent.Melt_FinishSound and ent.Melt_FinishSound == "Explosion" then
		util.Effect("Explosion", fx)
	elseif ent.Melt_FinishSound then
		ent:EmitSound( ent.Melt_FinishSound )
	end
	if not ent.GetPhysicsObject then return end
	local phys = ent:GetPhysicsObject()

	if IsValid(phys) and IsValid(ent) then
		ent.Melt_OldMotion = ent.Melt_OldMotion or phys:IsMotionEnabled()
		ent.Melt_OldCollisions = ent.Melt_OldCollisions or phys:IsCollisionEnabled()
		ent.Melt_OldCollisionGroup = ent.Melt_OldCollisionGroup or ent:GetCollisionGroup()
		phys:EnableMotion(false)
		phys:EnableCollisions(false)
		ent:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

		ent.Melt_OldRenderMode = ent.Melt_OldRenderMode or ent:GetRenderMode()
		ent:SetRenderMode(RENDERMODE_TRANSALPHA)
	end
end

local function UnMeltEnt( ent )
	if not IsValid(ent) then return end
	if not ent.IsMelted then return end
	if not ent.GetPhysicsObject then return end
	local phys = ent:GetPhysicsObject()
	if IsValid(phys) then
		phys:EnableMotion( ent.Melt_OldMotion )
		phys:EnableCollisions( ent.Melt_OldCollisions )
		ent:SetCollisionGroup( ent.Melt_OldCollisionGroup or COLLISION_GROUP_NONE)
		ent:SetRenderMode( ent.Melt_OldRenderMode or RENDERMODE_NORMAL)
		ent.Melt_OldCollisions = nil
		ent.Melt_OldCollisionGroup = nil
		ent.Melt_OldRenderMode = nil
		ent.Melt_OldMotion = nil
	end
	ent.IsMelted = false
end

function TFA_RP_MeltThink( ent )
	if not IsValid(ent) then return false end
	if not ent.Melt_FadeStart then return false end
	if not ent.Melt_HideStart then return false end
	if not ent.Melt_RecoverStart then return false end
	if not ent.Melt_RecoverEnd then return false end
	local color_begin = ent.Melt_PreMeltColor or color_white
	local color_end = ent.Melt_FinishColor or MeltColor
	local ct = CurTime()
	if ct > ent.Melt_RecoverEnd then
		ent.Melt_FadeStart = nil
		ent.Melt_HideStart = nil
		ent.Melt_RecoverStart = nil
		ent.Melt_RecoverEnd = nil
		ent.Melt_PreMeltColor = nil
		ent.IsMelted = false
		ent:SetColor( color_begin )
	elseif ct > ent.Melt_RecoverStart then
		local fac = CalcFac( CurTime(), ent.Melt_RecoverStart, ent.Melt_RecoverEnd )
		ent:SetColor( MixCol( fac, color_end, color_begin ) )
		UnMeltEnt( ent )
	elseif ct > ent.Melt_HideStart then
		MeltEnt( ent )
		ent:SetColor( ColorAlpha( color_end, 50 ) )
	elseif ct > ent.Melt_FadeStart then
		local fac = CalcFac( CurTime(), ent.Melt_FadeStart, ent.Melt_HideStart )
		ent:SetColor( MixCol( fac, color_begin, color_end ) )
	end
	return true
end

--[[ Stunning! ]]--

game.AddParticles("particles/sv_tfa_lightningfx.pcf")
PrecacheParticleSystem("tfa_lightning_model")

hook.Add("Move","TFA_RPStun_Move",function(ent,mv,cmd) end)
hook.Add("SetupMove","TFA_RPStun_Move",function(ent,mv,cmd)
	if CurTime() < ( ent:GetNW2Float("TFA_RP_StunEnd",-1) or -1 ) then
		mv:SetMaxSpeed(0.01)
		mv:SetMaxClientSpeed(0.01)
		mv:SetButtons(0)
		cmd:RemoveKey( IN_ATTACK )
		cmd:RemoveKey( IN_ATTACK2 )
		cmd:RemoveKey( IN_ZOOM )
		--if SERVER then
		local str = ent:GetNW2String("TFA_RP_StunFX")
		if str and str ~= "" then
			local fx = EffectData()
			fx:SetOrigin( ent:GetShootPos() )
			fx:SetNormal( Vector(0,0,1) )
			fx:SetEntity(ent)
			fx:SetScale(1)
			fx:SetMagnitude(1)
			util.Effect(str,fx)
		end
		--end
	end
end)
hook.Add("PlayerSwitchWeapon","TFA_RPStun_PSW",function(ply,owp,nwp)
	if CurTime() < ( ply:GetNW2Float("TFA_RP_StunEnd",-1) or -1 ) then
		return true
	end
end)
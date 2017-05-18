
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Flame"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Can you feel Air Exchange?"
ENT.Category		= "Combine Units +PLUS+"

ENT.Spawnable		= false
ENT.AdminOnly		= false

local COLLISION_RADIUS = 3
local LIFE_TIME = 0.35
local sndEngulf = Sound( "Fire.Engulf" )

if SERVER then

function ENT:Initialize()	
	self:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
	self:SetNoDraw( true )
	self:DrawShadow( false )
	self:PhysicsInitSphere( COLLISION_RADIUS )
	self:SetCollisionBounds( Vector( -COLLISION_RADIUS, -COLLISION_RADIUS, -COLLISION_RADIUS ), Vector( COLLISION_RADIUS, COLLISION_RADIUS, COLLISION_RADIUS ) )
	self:SetNotSolid( true )
	self:SetTrigger( true )
	self:SetMoveType( MOVETYPE_FLY )
	self:SetMoveCollide( MOVECOLLIDE_FLY_SLIDE )
	self.Owner = self:GetOwner() or self
	if not self.Owner:IsValid() then self.Owner = self end
	
	self.Weapon = self.Owner:GetActiveWeapon()
	if not self.Weapon:IsValid() then self.Weapon = self end
	self.DamageModifier = 1
	self.BaseDamage = 1
	self.NextTouch = CurTime()
	self:Fire( "kill", "", LIFE_TIME )
	self.KillTime = CurTime() + LIFE_TIME
	
end


function ENT:SetDamage( mindmg, maxdmg )

	self.DamageModifier = ( maxdmg - mindmg ) / LIFE_TIME
	self.BaseDamage = mindmg

end


function ENT:Touch( ent )

	-- ent == self.Owner or ent:IsWorld() then return end
	
	--if ent:GetClass()=="cup_fuel_tank" and ent:GetClass()=="npc_stalker" or ent:GetClass()=="npc_combine_s" or ent:GetClass()=="npc_metropolice" or ent:GetClass()=="npc_cscanner" or ent:GetClass()=="npc_manhack" or ent:GetClass()=="npc_strider" or ent:GetClass()=="npc_hunter" or ent:GetClass()=="npc_rollermine" or ent:GetClass()=="npc_clawscanner" or ent:GetClass()=="npc_turret_floor" or ent:GetClass()=="npc_turret_ceiling" or ent:GetClass()=="npc_combine_camera" or ent:GetClass()=="npc_combinedropship" or ent:GetClass()=="npc_combinegunship" or ent:GetClass()=="npc_helicopter" or ent:GetClass()=="npc_turret_ground" or ent:GetClass()=="npc_apcdriver" then return end
	
	if ent.wearsuit == true then return end
	
	if self.NextTouch > CurTime() then return end
	self.NextTouch = CurTime() + 0.05
	
	-- Die under water
	--if self:WaterLevel() >= 1 then
	--	self:Remove()
	--	return
	--end
	
	-- Stop moving since we hit something
	self:SetMoveType( MOVETYPE_NONE )

	-- Make sure the owner and weapon are still around, otherwise we would error out
	if not self.Owner:IsValid() then self.Owner = self end
	if not self.Weapon:IsValid() then self.Weapon = self end
	
	-- Apply damage based on how long the projectile has been alive
	local dmg = ( self.KillTime - CurTime() ) * self.DamageModifier + self.BaseDamage
	if dmg < 0 then dmg = 0 end
	ent:TakeDamage( dmg, self.Owner, self.Weapon )
	
	-- Play that cool igniting sound if this entity is being ignited for the first time
	if not ent:IsOnFire() then
		ent:EmitSound( sndEngulf )
	end
	
	-- Ignite the entity
	--if ent:IsPlayer() then
		ent:Ignite( math.random( 5, 6 ), 0 ) -- Go easier on players
	--else
	--	ent:Fire( "IgniteLifeTime", math.random( 10, 12 ), 0 ) -- garry done broke ent:Ignite(), so we have to use this
	--end

end

end

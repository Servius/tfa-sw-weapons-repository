AddCSLuaFile( )
DEFINE_BASECLASS( "base_anim" )

ENT.IsDODSTNT = true
ENT.TotalExplosions = 1
ENT.AutomaticFrameAdvance = true

util.PrecacheModel( "models/weapons/w_swrcdeton.mdl" )
util.PrecacheSound( "buttons/spark6.wav" )
util.PrecacheSound( "ambient/fire/mtov_flame2.wav" )

if CLIENT then
	ENT.Mat = Material( "sprites/redglow1" )
	ENT.Mat2 = Material( "cable/redlaser" )
	
	ENT.LP = Vector( -.5, 1, 2 )
end

function ENT:SetupDataTables( )
	self:NetworkVar( "Float", 0, "Defuse" )
	self:NetworkVar( "Float", 1, "Fuse" )
	
	self:NetworkVar( "Int", 0, "BurnAdjust" )
	
	self:NetworkVar( "Bool", 0, "Live" )
end

function ENT:Draw( )

	
	local bone, n, light
	
	bone = self:GetAttachment( self:LookupAttachment( "wick" ) )
	
	if not bone then
		return
	end
	
	self:DrawModel( )
	
	if self:GetDefuse( ) < 1 then
		
		--if self.BurnSound then
			--self.BurnSound:PlayEx( .5, 170 )
		--end
	else
		if self.BurnSound then
			self.BurnSound:Stop( )
		end
	end
end

function ENT:OnRemove( )
	if self.BurnSound then
		self.BurnSound:Stop( )
	end
end

function ENT:Use(activator, caller)
	self.Entity:ActivateX(1)
end

function ENT:ActivateX( scale )
	if not self:GetLive( ) then
		self:SetLive( true )
		self:SetBurnAdjust( scale or 1 )
		
		seq = self:LookupSequence( "w_tnt_wick" )
		self:ResetSequence( seq )
		self:SetPlaybackRate( 1 / self:GetBurnAdjust( ) )
		
		if not self.BurnSound then
			self.BurnSound = CreateSound( self, Sound( "weapons/sw_detonator.wav" ) )
		end
		self.BurnSound:Play( )
	end
end

function ENT:OnTakeDamage( info )
	self:TakePhysicsDamage( info )
	if info and self:IsValid( ) and not self.Refuse then
		if info:IsExplosionDamage( ) then
			self:Explode( )
		end
	end
end

function ENT:Initialize( )
	self:SetModel( "models/weapons/w_swrcdeton.mdl" )
	
	if SERVER then
		self:SetDefuse( 0 )
		self:SetFuse( 0 )
		
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		
		self:PhysWake( )
	end
end

function ENT:Think( )
	local now, delta
	
	
	if CLIENT then
		return
	end
	
	now = CurTime( )
	
	delta = now - ( self.LastThink or now )
	
	self.LastThink = now
	
	if self:GetLive( ) then
		if not self.Used then
			self:SetDefuse( math.Clamp( self:GetDefuse( ) - delta * .5, 0, 1 ) )
		end
	end
	
	if self:GetDefuse( ) >= 1 and self:GetLive( ) then
		self:SetLive( false )
		
		self:EmitSound( "buttons/spark6.wav", 100, 63 )
		self:SetPlaybackRate( 0 )
	end
	
	if self:GetLive( ) then
		self:SetFuse( math.Clamp( self:GetFuse( ) + delta / ( self:GetBurnAdjust( ) * 19 ), 0, 1 ) )
		
		if self:GetFuse( ) >= 0.20 and SERVER then
			self:SetLive( false )
			self:Explode( )
		end
	end
	
	if self:GetLive( ) and self:WaterLevel( ) > 0 then
		self:SetLive( false )
		self:SetDefuse( 1 )
	end
	
	self.Used = false
end

local function Spin( vector, up, right, forward )
	local ang
	
	ang = ( vector * 1 ):Angle( )
	
	ang:RotateAroundAxis( ang:Up( ), math.random( -up / 2 , up / 2 ) )
	ang:RotateAroundAxis( ang:Right( ), math.random( -right / 2 , right / 2 ) )
	ang:RotateAroundAxis( ang:Forward( ), math.random( -forward / 2 , forward / 2 ) )
	
	return ang:Forward( )
end

function ENT:Explode( )
	if self.Refuse then
		return
	end
	
	self.Refuse = true
	
	for k, v in pairs (ents.FindInSphere(self.Entity:GetPos(), 250)) do
		v:Fire("EnableMotion", "", math.random(0, 0.5))
	end
	
	local explode = ents.Create( "env_explosion" )
	explode:SetPos( self:GetPos() )
	explode:SetKeyValue( "iMagnitude", "250" )
	explode:EmitSound( "weapon_AWP.Single", 100, 100 )
	explode:Spawn()
	explode:Activate()
	explode:Fire( "Explode", "", 0 )
	
	self:Remove()
end
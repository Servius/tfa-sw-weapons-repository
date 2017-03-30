

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "Detonator: Small"			
	SWEP.Author				= "TFA, Servius"
	SWEP.Slot				= 4
	SWEP.SlotPos			= 1
	
end


SWEP.Base	  = "tfa_swsft_base"
SWEP.Category = "TFA Star Wars"

SWEP.Spawnable				= true
SWEP.AdminOnly			= true

SWEP.HoldType = "slam"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/cstrike/c_rif_famas.mdl"
SWEP.WorldModel = "models/weapons/w_irifle.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.UseHands = true
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(2.427, 1.802, 0.259), angle = Angle(0, 0, 0) },
	["v_weapon.famas"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.VMPos = Vector(1, -2.814, -3.862)
SWEP.VMAng = Vector(3.032, 3.306, 0)

SWEP.IronSightsPos = Vector(-1.56, -17.848, 0.261) - SWEP.VMPos
SWEP.IronSightsAng = Vector(2.163, 1.187, 0) - SWEP.VMAng

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound = Sound ("weapons/DC17M_AT_fire.wav");
SWEP.Primary.ReloadSound = Sound ("weapons/DC17M_AT_reload.wav");

SWEP.Primary.Recoil			= 10
SWEP.Primary.Damage			= 200
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.05
SWEP.Primary.ClipSize		= 1
SWEP.Primary.RPM = 60/1
SWEP.Primary.DefaultClip	= 3
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "rpg_round"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.ProjectileEntity = "sent_swrc_det" --Entity to shoot
SWEP.ProjectileVelocity = 1 --Entity to shoot's velocity

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/props/starwars/weapons/detpack.mdl", bone = "v_weapon.famas", rel = "", pos = Vector(2, 6, 14), angle = Angle(180	, 0, -94), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/props/starwars/weapons/detpack.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2, 1.5, 4), angle = Angle(0, 90, 180), size = Vector(.7, .8, .7), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2.5

SWEP.Scoped				= false
SWEP.Secondary.UseElcan			= true

SWEP.Secondary.IronFOV = 15

SWEP.ScopeScale = .9--Scale of the scope overlay
SWEP.ReticleScale = .65 --Scale of the reticle overlay

if surface then
	SWEP.Secondary.ScopeTable = nil --[[
		{
			scopetex = surface.GetTextureID("scope/gdcw_closedsight"),
			reticletex = surface.GetTextureID("scope/gdcw_acogchevron"),
			dottex = surface.GetTextureID("scope/gdcw_acogcross")
		}
	]]--
end

function SWEP:PlaceTNT( )
	self:SendWeaponAnim( ACT_VM_DRAW )
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	
	if CLIENT then
		return
	end
	
	local tnt, res
	
	res = util.TraceLine{ start = self.Owner:GetShootPos( ), endpos = self.Owner:GetShootPos( ) + 115 * self.Owner:GetAimVector( ), filter = self.Owner }
	
	if res.Hit then
		tnt = ents.Create( "sent_swrc_det" )
			tnt:SetPos( res.HitPos + res.HitNormal )
			res.HitNormal.z = -res.HitNormal.z
			tnt:SetAngles( res.HitNormal:Angle( ) - Angle( 90, 180, 0 ) )
		tnt:Spawn( )
		
		constraint.NoCollide( tnt, self.Owner )
		
		if IsValid( res.Entity ) and not res.Entity.IsDODSTNT then
			if not ( res.Entity:IsNPC( ) or res.Entity:IsPlayer( ) ) and res.Entity:GetPhysicsObject( ):IsValid( )  then
				constraint.Weld( tnt, res.Entity, 0, 0, 0, true, false )
			end
		else
			tnt:SetMoveType( MOVETYPE_NONE )
		end
		
		--tnt:ActivateX( self:GetFuseAdjust( ) )
		
		timer.Simple( 1, function( ) self:SendWeaponAnim( ACT_VM_IDLE ) end )
	end
end

function SWEP:TossTNT( )
	self:SendWeaponAnim( ACT_VM_DRAW )
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	
	self:SendWeaponAnim( ACT_VM_DRAW )
	
	if CLIENT then
		return
	end

	local tnt, nang

	nang = self.Owner:GetAimVector( )

	nang.z = -nang.z

	tnt = ents.Create( "sent_swrc_det" )
		tnt:SetPos( self.Owner:GetShootPos( ) )
		tnt:SetAngles( nang:Angle( ) )
		tnt:SetOwner( self.Owner )
	tnt:Spawn( )

	self:EmitSound( self.Sounds.ThrowSound )

    tnt:ActivateX( self:GetFuseAdjust( ) )

    tnt:GetPhysicsObject( ):ApplyForceCenter( 1500 * self.Owner:GetAimVector( ) + self.Owner:GetVelocity( ) )

    timer.Simple( .2, function( ) tnt:SetOwner( NULL ) end )
    timer.Simple( 1, function( ) self:SendWeaponAnim( ACT_VM_IDLE ) end )
end

function SWEP:PrimaryAttack( )
	self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	
	self:SetNextPrimaryFire( CurTime( ) + 4 )
	self:SetNextSecondaryFire( CurTime( ) + 4 )
	
	timer.Simple( 2, function( ) self:PlaceTNT( ) end )
end

function SWEP:SecondaryAttack( )
--[[
	self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	
	self:SetNextPrimaryFire( CurTime( ) + 3.5 )
	self:SetNextSecondaryFire( CurTime( ) + 3.5 )
	
	timer.Simple( 2, function( ) self:TossTNT( ) end )
]]--
end
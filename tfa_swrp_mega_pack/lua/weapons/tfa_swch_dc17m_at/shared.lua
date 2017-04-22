

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "DC-17m Anti-Armor"			
	SWEP.Author				= "Syntax_Error752"
	SWEP.ViewModelFOV      	= 50
	SWEP.Slot				= 4
	SWEP.SlotPos			= 1
	SWEP.WepSelectIcon 		= surface.GetTextureID("HUD/killicons/DC17M_AT")
	
	killicon.Add( "weapon_752_dc17m_at", "HUD/killicons/DC17M_AT", Color( 255, 80, 0, 255 ) )
	
end

SWEP.HoldType				= "rpg"
SWEP.Base					= "tfa_swsft_base"
SWEP.Category = "TFA Star Wars"

SWEP.Spawnable				= true
SWEP.AdminOnly			= true

SWEP.ViewModel				= "models/weapons/v_DC17M_AT.mdl"
SWEP.WorldModel				= "models/weapons/w_DC17M_AT.mdl"

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound = Sound ("weapons/explosives_cannons_superlazers/dc17m_at_fire.ogg");
SWEP.Primary.ReloadSound = Sound ("weapons/shared/standard_reload.ogg");

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

SWEP.IronSightsPos 			= Vector (-1, -12, 2.5)
SWEP.IronSightsAng 			= Vector (0,0,0)

SWEP.Scoped = true
SWEP.Secondary.IronFOV = 30


SWEP.ProjectileEntity = "dc17m_at_rocket2" --Entity to shoot
SWEP.ProjectileVelocity = 500 --Entity to shoot's velocity

function SWEP:Think()
	if self.Weapon:Clip1() > 0 then
		self.Weapon:SendViewModelAnim(ACT_VM_IDLE_DEPLOYED)
	end
end
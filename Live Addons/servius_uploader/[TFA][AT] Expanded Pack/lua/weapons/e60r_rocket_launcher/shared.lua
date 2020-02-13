


if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "E-60R Rocket Launcher"			
	SWEP.Author			= "ahnok"
	SWEP.ViewModelFOV      		= 60
	SWEP.Slot			= 4
	SWEP.SlotPos			= 1
	SWEP.WepSelectIcon 		= surface.GetTextureID("HUD/killicons/E60R")
	
	killicon.Add( "weapon_jew_e60r", "HUD/killicons/E60R", Color( 255, 80, 0, 255 ) )
	
end

SWEP.HoldType			= "rpg"
SWEP.Base				= "tfa_swsft_base"
SWEP.Category			= "TFA Star Wars: CIS"

SWEP.Spawnable			= true
SWEP.AdminOnly			= true

SWEP.ViewModel			= "models/weapons/v_E60R.mdl"
SWEP.WorldModel			= "models/weapons/w_E60R.mdl"

SWEP.Weight			= 20
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound		= Sound ("weapons/e60r_rocket_launcher/smartlauncher_fire.wav");

SWEP.Primary.Recoil		= 10
SWEP.Primary.Damage		= 200
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone		= 0.15
SWEP.Primary.ClipSize		= 1
SWEP.Primary.Delay		= 1
SWEP.Primary.DefaultClip	= 3
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		= "rpg_round"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.ProjectileEntity = "dc17m_at_rocket2" --Entity to shoot
SWEP.ProjectileVelocity = 500 --Entity to shoot's velocity

SWEP.Scoped				= true
SWEP.Secondary.UseGreenDuplex		= true
SWEP.ScopeScale = 0.6 
SWEP.Secondary.IronFOV = 30


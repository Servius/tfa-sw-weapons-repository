if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "T-21"			
	SWEP.Author				= "Servius"
	SWEP.ViewModelFOV      	= 50
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/T21")
	
	killicon.Add( "weapon_752_t21", "HUD/killicons/T21", Color( 255, 80, 0, 255 ) )

end

SWEP.Author				= "Servius" --Author Tooltip
SWEP.Contact				= "http://steamcommunity.com/profiles/76561198036188853/" --Contact Info Tooltip
SWEP.Purpose				= "Shoot some people" --Purpose Tooltip
SWEP.Instructions				= "Left click to shoot...dummy." --Instructions Tooltip

SWEP.HoldType				= "ar2"
SWEP.Base					= "tfa_swsft_base_servius"

SWEP.Category = "TFA Star Wars"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel				= "models/weapons/v_T21.mdl"
SWEP.WorldModel				= "models/weapons/w_T21.mdl"

SWEP.Primary.Sound = Sound ("weapons/T21_fire.wav");
SWEP.Primary.ReloadSound = Sound ("weapons/T21_reload.wav");

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.0125
SWEP.Primary.ClipSize		= 50
SWEP.Primary.RPM = 60/0.175
SWEP.Primary.DefaultClip	= 150
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"
SWEP.TracerName = "effect_sw_laser_red"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"


SWEP.Secondary.IronFOV = 70

SWEP.IronSightsPos = Vector(-4.06, 3, -3)
SWEP.IronSightsAng = Vector(0.85, 0.209, 0)
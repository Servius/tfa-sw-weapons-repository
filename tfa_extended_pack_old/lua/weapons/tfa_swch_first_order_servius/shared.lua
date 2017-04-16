

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "F-11D"			
	SWEP.Author				= "Servius, Lightcruiser, Syntax"
	SWEP.ViewModelFOV		= 55
	SWEP.Slot			= 2
	SWEP.SlotPos			= 3
	
	SWEP.WepSelectIcon 		= surface.GetTextureID("HUD/killicons/sw")
	
	killicon.Add( "sw_weapon_first_order_f11d", "HUD/killicons/f11_icon", Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType				= "ar2"
SWEP.Base				= "tfa_swsft_base"

SWEP.Category 				= "TFA Star Wars Battlefront"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel				= "models/weapons/starwars/firstorder/v_f11.mdl"
SWEP.WorldModel				= "models/weapons/w_F-11D.mdl"
SWEP.UseHands 				= false --Use gmod c_arms system.

SWEP.Weight				= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound 			= Sound ("weapons/starwars/f11_fire.wav");
SWEP.Primary.ReloadSound 		= Sound ("weapons/starwars/f11_reload.wav");

SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots			= 1

SWEP.Primary.Spread			= 0.0125
SWEP.Primary.IronAccuracy = .003	-- Ironsight accuracy, should be the same for shotguns

SWEP.Primary.ClipSize			= 45
SWEP.Primary.RPM 			= 60/0.175
SWEP.Primary.DefaultClip		= 60
SWEP.Primary.Automatic			= true
SWEP.Primary.Ammo			= "ar2"
SWEP.TracerName 			= "effect_sw_laser_red"

SWEP.Secondary.Automatic		= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos 			= Vector(1, -5, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.SelectiveFire = true
SWEP.FireModes = {
	"Auto",
	"3Burst",
	"Single"
}
local weaponcol = Color(0.435*255,0.10*255,0.7*255,255)

SWEP.IronSightsSensitivity = 0.25 --Useful for a RT scope.  Change this to 0.25 for 25% sensitivity.  This is if normal FOV compenstaion isn't your thing for whatever reason, so don't change it for normal scopes.
SWEP.BlowbackVector = Vector(0,-1,0.05)
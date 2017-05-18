

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "EE-3"			
	SWEP.Author				= "Servius"
	SWEP.ViewModelFOV      	= 50
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
	SWEP.WepSelectIcon 		= surface.GetTextureID("HUD/killicons/EE3")
	
	killicon.Add( "weapon_752_ee3", "HUD/killicons/EE3", Color( 255, 80, 0, 255 ) )
	
end

SWEP.HoldType				= "ar2"
SWEP.Base				= "tfa_swsft_base"

SWEP.Category 				= "TFA Star Wars Battlefront"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel				= "models/weapons/synbf3/c_EE3.mdl"
SWEP.WorldModel				= "models/weapons/synbf3/w_EE3.mdl"
SWEP.UseHands 				= true --Use gmod c_arms system.

SWEP.Weight				= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound = Sound ("weapons/EE3_fire.wav");
SWEP.Primary.ReloadSound = Sound ("weapons/EE3_reload.wav");

SWEP.Primary.Recoil			= 0.3



SWEP.Primary.Damage		= 20					-- Damage, in standard damage points.
SWEP.Primary.HullSize = 0 --Big bullets, increase this value.  They increase the hull size of the hitscan bullet.
SWEP.DamageType = DMG_SHOCK--See DMG enum.  This might be DMG_SHOCK, DMG_BURN, DMG_BULLET, etc.
SWEP.Primary.NumShots	= 5 --The number of shots the weapon fires.  SWEP.Shotgun is NOT required for this to be >1.
SWEP.Primary.Automatic			= false					-- Automatic/Semi Auto
SWEP.Primary.RPM				= 120					-- This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Semi				= nil					-- RPM for semi-automatic or burst fire.  This is in Rounds Per Minute / RPM
SWEP.FiresUnderwater = false

SWEP.Primary.Spread		= .05					--This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .05	-- Ironsight accuracy, should be the same for shotguns

SWEP.Primary.ClipSize			= 20

SWEP.Primary.DefaultClip		= 60

SWEP.Primary.Ammo			= "ar2"
SWEP.TracerName 			= "effect_sw_laser_red"

SWEP.Secondary.Automatic		= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos 			= Vector(1, -5, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)


SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/rtcircle.mdl", bone = "v_thompson.root5", rel = "", pos = Vector(-9.931, -2.225, 0.28), angle = Angle(0, -180, 0), size = Vector(0.18, 0.18, 0.18), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {} }
}




SWEP.IronSightsSensitivity = 0.25 --Useful for a RT scope.  Change this to 0.25 for 25% sensitivity.  This is if normal FOV compenstaion isn't your thing for whatever reason, so don't change it for normal scopes.
SWEP.BlowbackVector = Vector(0,-1,0.05)
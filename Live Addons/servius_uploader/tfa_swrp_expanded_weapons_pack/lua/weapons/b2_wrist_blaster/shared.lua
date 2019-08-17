

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "B2 Wrist Blaster"			
	SWEP.Author				= "ahnok"
	SWEP.ViewModelFOV      	= 70
	SWEP.Slot				= 1
	SWEP.SlotPos			= 5
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/DC15SA")
	
	killicon.Add( "weapon_752_dc15sa", "HUD/killicons/DC15SA", Color( 255, 80, 0, 255 ) )
	
end

SWEP.Author				= "Servius, ahnok" --Author Tooltip
SWEP.Contact				= "http://steamcommunity.com/profiles/76561198036188853/" --Contact Info Tooltip
SWEP.Purpose				= "Assault" --Purpose Tooltip
SWEP.Instructions				= "Left click to shoot" --Instructions Tooltip

SWEP.HoldType				= "pistol"
SWEP.Base					= "tfa_swsft_base_servius"

SWEP.Category = "TFA Star Wars: CIS"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel				= "models/weapons/c_sw_free_hands.mdl"
SWEP.WorldModel				= "models/weapons/c_sw_free_hands.mdl"

local MaxTimer				=64
local CurrentTimer			=0
SWEP.Weight					= 0
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound = Sound ("weapons/1misc_guns/wpn_btldroid_laser_shoot_01.ogg")
SWEP.Primary.ReloadSound  = Sound ("weapons/b2_wrist_blaster/b2_wrist_blaster_reload.ogg")
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 10
SWEP.Primary.NumShots		= 2
SWEP.Primary.Spread			= 0.0065
SWEP.Primary.IronAccuracy = .005	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 250
SWEP.Primary.RPM = 460
SWEP.Primary.DefaultClip	= 500
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "battery"
SWEP.TracerName = "effect_sw_laser_red"
SWEP.UseHands = true

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos 			= Vector (-3.9, -6, 2.5)
SWEP.IronSightsAng 			= Vector (-0.3, -0.05, 0)
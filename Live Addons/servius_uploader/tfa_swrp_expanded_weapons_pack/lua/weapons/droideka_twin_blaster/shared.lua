

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "Droideka Twin-Blaster"			
	SWEP.Author				= "ahnok"
	SWEP.ViewModelFOV      	= 70
	SWEP.Slot				= 1
	SWEP.SlotPos			= 5
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/DC15SA")
	
	killicon.Add( "weapon_752_dc15sa", "HUD/killicons/DC15SA", Color( 255, 80, 0, 255 ) )
	
end

SWEP.Author				= "Servius" --Author Tooltip
SWEP.Contact				= "http://steamcommunity.com/profiles/76561198036188853/" --Contact Info Tooltip
SWEP.Purpose				= "Shoot some people" --Purpose Tooltip
SWEP.Instructions				= "Left click to shoot...dummy." --Instructions Tooltip

SWEP.HoldType				= "duel"
SWEP.Base					= "tfa_swsft_base_servius"

SWEP.Category = "TFA Star Wars: CIS"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel				= "models/weapons/c_sw_free_hands.mdl"
SWEP.WorldModel				= "models/weapons/c_sw_free_hands.mdl"

SWEP.Primary.Sound = Sound ("weapons/1misc_guns/wpn_fg_rg_droideka_blaster.ogg");

local MaxTimer				=64
local CurrentTimer			=0
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 20
SWEP.Primary.NumShots		= 2
SWEP.Primary.Spread			= 0.0025
SWEP.Primary.IronAccuracy = .005	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 100
SWEP.Primary.RPM = 260
SWEP.Primary.DefaultClip	= 300
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "battery"
SWEP.TracerName = "effect_sw_laser_red"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos 			= Vector (-3.9, -6, 2.5)
SWEP.IronSightsAng 			= Vector (-0.3, -0.05, 0)
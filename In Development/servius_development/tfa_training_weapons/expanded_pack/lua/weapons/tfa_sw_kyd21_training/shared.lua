if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end
if ( CLIENT ) then
	SWEP.PrintName			= "KYD-21"			
	SWEP.Author				= "Servius"
	SWEP.ViewModelFOV      	= 70
	SWEP.Slot				= 1
	SWEP.SlotPos			= 5
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/KYD21")
	killicon.Add( "weapon_752_kyd21", "HUD/killicons/KYD21", Color( 255, 80, 0, 255 ) )
end
SWEP.Author				= "Servius" --Author Tooltip
SWEP.Contact				= "http://steamcommunity.com/profiles/76561198036188853/" --Contact Info Tooltip
SWEP.Purpose				= "Shoot some people" --Purpose Tooltip
SWEP.Instructions				= "Left click to shoot...dummy." --Instructions Tooltip
SWEP.HoldType				= "pistol"
SWEP.Base					= "tfa_swsft_base_servius_training"
SWEP.Category = "TFA Star Wars: Training"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.ViewModel				= "models/weapons/v_KYD21.mdl"
SWEP.WorldModel				= "models/weapons/w_KYD21.mdl"
SWEP.Primary.Sound 			= Sound("weapons/kyd21/KYD21_fire.ogg")
SWEP.Primary.ReloadSound = Sound ("weapons/shared/standard_reload.ogg");
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 0
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.0125
SWEP.Primary.IronAccuracy = .005	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 25
SWEP.Primary.RPM = 60/0.2
--= 75
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "battery"
SWEP.TracerName = "effect_sw_laser_red"
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.IronSightsPos 			= Vector (-3.6, -4, 2.5)
SWEP.IronSightsAng = Vector(0.8,0.1,0)
SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2
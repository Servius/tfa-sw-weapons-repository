if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end
if ( CLIENT ) then
	SWEP.PrintName			= "EE-3"			
	SWEP.Author				= "Syntax_Error752"
	SWEP.ViewModelFOV      	= 50
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
	SWEP.WepSelectIcon 		= surface.GetTextureID("HUD/killicons/EE3")	
	killicon.Add( "weapon_752_ee3", "HUD/killicons/EE3", Color( 255, 80, 0, 255 ) )	
end
SWEP.HoldType				= "ar2"
SWEP.Base					= "tfa_3dscoped_base"
SWEP.Category = "TFA Star Wars"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.ViewModel				= "models/weapons/v_EE3.mdl"
SWEP.WorldModel				= "models/weapons/w_EE3.mdl"
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Primary.Sound = Sound ("weapons/ee3/EE3_fire.ogg");
SWEP.Primary.ReloadSound = Sound ("weapons/shared/standard_reload.ogg");
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 70
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread		    = 0.0125				--This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy   = 0.0111
SWEP.Primary.ClipSize		= 50
--= 150
SWEP.Primary.Automatic = false -- Automatic/Semi Auto
SWEP.Primary.RPM = 600 -- This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst = 600 -- RPM for burst fire, overrides semi.  This is in Rounds Per Minute / RPM
SWEP.Primary.BurstDelay = nil -- Delay between bursts, leave nil to autocalculate
SWEP.Primary.Ammo			= "battery"
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
--Range Related
SWEP.Primary.Range = 500 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 0.25 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.
-- Selective Fire Stuff
 SWEP.FireModes = {
"3Burst",
"Single"
}
SWEP.SelectiveFire = true --Allow selecting your firemode?
SWEP.OnlyBurstFire = true --No auto, only burst/single?
SWEP.DefaultFireMode = "3Burst" --Default to auto or whatev
SWEP.IronSightsPos = Vector(-4.64, -8, 1.059)
SWEP.IronSightsAng = Vector(0, 0, -0.491)
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/rtcircle.mdl", bone = "v_thompson.root5", rel = "", pos = Vector(-2.362, -2.445, 0.17), angle = Angle(0, 180, 90), size = Vector(0.259, 0.259, 0.259), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {} }
}
SWEP.IronSightsSensitivity = 0.25 --Useful for a RT scope.  Change this to 0.25 for 25% sensitivity.  This is if normal FOV compenstaion isn't your thing for whatever reason, so don't change it for normal scopes.
SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2.5
----Swft Base Code
SWEP.TracerCount = 1
SWEP.MuzzleFlashEffect = ""
SWEP.TracerName = "effect_sw_laser_red"
SWEP.Secondary.IronFOV = 70
SWEP.Primary.KickUp = 0.2
SWEP.Primary.KickDown = 0.1
SWEP.Primary.KickHorizontal = 0.1
SWEP.Primary.KickRight = 0.1
SWEP.DisableChambering = true
SWEP.ImpactDecal = "FadingScorch"
SWEP.ImpactEffect = "effect_sw_impact" --Impact Effect
SWEP.RunSightsPos = Vector(2.127, 0, 1.355)
SWEP.RunSightsAng = Vector(-15.775, 10.023, -5.664)
SWEP.BlowbackEnabled = true
SWEP.BlowbackVector = Vector(0,-3,0.1)
SWEP.Blowback_Shell_Enabled = false
SWEP.Blowback_Shell_Effect = ""
SWEP.ThirdPersonReloadDisable=false
SWEP.Primary.DamageType = DMG_SHOCK
SWEP.DamageType = DMG_SHOCK
--3dScopedBase stuff
SWEP.RTMaterialOverride = 0
SWEP.RTScopeAttachment = -1
SWEP.Scoped_3D = true
SWEP.ScopeReticule = "scope/gdcw_red_nobar" 
SWEP.Secondary.ScopeZoom = 8
SWEP.ScopeReticule_Scale = {2.5,2.5}
SWEP.Secondary.UseACOG			= false	 --Overlay option
SWEP.Secondary.UseMilDot			= false			 --Overlay option
SWEP.Secondary.UseSVD			= false		 --Overlay option
SWEP.Secondary.UseParabolic		= false		 --Overlay option
SWEP.Secondary.UseElcan			= false	 --Overlay option
SWEP.Secondary.UseGreenDuplex		= false		 --Overlay option
if surface then
	SWEP.Secondary.ScopeTable = nil --[[
		{
			scopetex = surface.GetTextureID("scope/gdcw_closedsight"),
			reticletex = surface.GetTextureID("scope/gdcw_acogchevron"),
			dottex = surface.GetTextureID("scope/gdcw_acogcross")
		}
	]]--
end
DEFINE_BASECLASS( SWEP.Base )
if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end
if ( CLIENT ) then
	SWEP.PrintName = "Dl-44"	
	SWEP.Author = "TFA, Servius"
	SWEP.ViewModelFOV = 60
	SWEP.Slot = 2
	SWEP.SlotPos = 3
end
SWEP.Base = "tfa_3dscoped_base"
SWEP.Category = "TFA Star Wars: Training"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 60
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/synbf3/c_dh17.mdl"
SWEP.WorldModel = "models/weapons/w_dl44.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.UseHands = true
SWEP.Primary.Sound = Sound ("weapons/dl44/dl44_fire.ogg");
SWEP.Primary.ReloadSound = Sound ("weapons/shared/standard_reload.ogg");
SWEP.Primary.KickUp = 2
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Primary.Recoil = 0.3
SWEP.Primary.Damage = 60
SWEP.Primary.NumShots = 1
SWEP.Primary.Spread = 0.0125
SWEP.Primary.IronAccuracy = .01 -- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize = 15
SWEP.Primary.RPM = 200
--= 50
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "battery"
--Fire Mode
SWEP.SelectiveFire = false --Allow selecting your firemode?
SWEP.DisableBurstFire = false --Only auto/single?
SWEP.OnlyBurstFire = false --No auto, only burst/single?
SWEP.DefaultFireMode = "" --Default to auto or whatev
SWEP.FireModeName = nil --Change to a text value to override it
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.IronFOV = 70
SWEP.Primary.Range = -1 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 0.8 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.
SWEP.IronSightsPos = Vector(-5.4, 3, 2.6)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.ViewModelBoneMods = {
	["v_dh17_reference001"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(-0, 0, 0), angle = Angle(0, 0, 0) }
}
SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/weapons/w_dl44.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10, 0.4, -4.676), angle = Angle(-10.52, 5.843, 180), size = Vector(0.959, 0.959, 0.959), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.VElements = {
	["element_scope"] = { type = "Model", model = "models/rtcircle.mdl", bone = "v_dh17_reference001", rel = "element_reference", pos = Vector(-8.921, 0.289, 1.639), angle = Angle(0, -180, 0), size = Vector(0.27, 0.27, 0.27), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {} },
	["element_reference"] = { type = "Model", model = "models/weapons/w_dl44.mdl", bone = "v_dh17_reference001", rel = "", pos = Vector(1, -5, 1.7), angle = Angle(0, 90, 0), size = Vector(0.82, 0.82, 0.82), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.BlowbackVector = Vector(0,-3,0.025)
SWEP.Blowback_Only_Iron  = false
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
if ( SERVER ) then --serversided

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then --clientsided

	SWEP.PrintName			= "ACP Array Gun"			
	SWEP.Author				= "TFA & Servius"
	SWEP.ViewModelFOV      	= 70
	SWEP.Slot				= 3
	SWEP.SlotPos			= 5
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/hud/acparray")--remove this, rename this vmt to your weapon classname
	
	killicon.Add( "weapon_impcannon", "vgui/hud/acparray", Color( 255, 80, 0, 255 ) )--save this

end


SWEP.ViewModelBoneMods = {
	["v_rt97c_reference001"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}--also save this

SWEP.VElements = {
	["ACP"] = { type = "Model", model = "models/swbf3/outerrim/weapons/scattergun.mdl", bone = "v_rt97c_reference001", rel = "", pos = Vector(-0.5, 8, -1.5), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}--save this too

SWEP.WElements = {
	["ArrayGun"] = { type = "Model", model = "models/swbf3/outerrim/weapons/scattergun.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11, 1, 1), angle = Angle(10, 180, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.HoldType				= "ar2"
SWEP.Base					= "tfa_gun_base"

SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false

SWEP.Category				= "TFA Star Wars Battlefront"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel = "models/weapons/synbf3/c_rt97c.mdl"
SWEP.WorldModel = "models/weapons/synbf3/w_rt97c.mdl"

SWEP.ForceDryFireOff = true --Disables dryfire.  Set to false to enable them.
SWEP.DisableIdleAnimations = true --Disables idle animations.  Set to false to enable them.
SWEP.ForceEmptyFireOff = true --Disables empty fire animations.  Set to false to enable them.

SWEP.Primary.Sound = Sound ("weapons/acp_fire.wav");
SWEP.Primary.ReloadSound = Sound ("weapons/synbf3/dlt19_reload.wav");

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.ImpactDecal = "FadingScorch"

SWEP.DoMuzzleFlash = false --Do a muzzle flash?
SWEP.CustomMuzzleFlash = false --Disable muzzle anim events and use our custom flashes?
SWEP.AutoDetectMuzzleAttachment = false --For multi-barrel weapons, detect the proper attachment?
SWEP.MuzzleFlashEffect = "" --Change to a string of your muzzle flash effect.  Copy/paste one of the existing from the base.


SWEP.Primary.Spread		= .05					--This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .05	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 30
SWEP.Primary.NumShots		= 5
SWEP.Primary.Cone			= 0.05
SWEP.Primary.ClipSize		= 8
SWEP.Primary.RPM				= 120
SWEP.Primary.DefaultClip	= 75
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "ar2"

SWEP.IronSightsPos 			= Vector(-3, 3, 3.9)
SWEP.IronSightsAng = Vector(-1, -0.801, 0)

SWEP.Primary.KickUp			= 0.2					-- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown			= 0.2					-- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.3					-- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0.05 	--Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.


SWEP.Primary.Range = 50 / 5280 * 0.75 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 0.5 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.


SWEP.ImpactEffect = "effect_sw_impact" --Impact Effect
SWEP.Tracer				= 0		--Bullet tracer.  TracerName overrides this.
SWEP.TracerName 		= "effect_sw_laser_yellow" 	--Change to a string of your tracer name.  Can be custom.

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.EventTable = {
	[ACT_VM_RELOAD] = {
		{ ['time'] = 0.0, ['type'] = "sound", ['value'] = SWEP.Primary.ReloadSound }
	}
}
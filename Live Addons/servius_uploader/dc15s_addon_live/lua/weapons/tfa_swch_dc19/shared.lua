if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end
if ( CLIENT ) then
	SWEP.PrintName			= "DC-19 Stealth Carbine"			
	SWEP.Author				= "TFA, Servius, AussiWozzi"
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
end
SWEP.Base					= "tfa_3dscoped_base"
SWEP.Category = "TFA Star Wars"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/servius/starwars/c_ashuradc15s.mdl"
SWEP.WorldModel = "models/servius/starwars/w_ashuradc15s.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.UseHands = true
SWEP.Primary.Sound 					= Sound ("weapons/dc19fire.ogg");
SWEP.Primary.ReloadSound 			= Sound ("weapons/bf3/standard_reload2.ogg");

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.SafetyPos =  Vector(0, 0, 0)
SWEP.SafetyAng = Vector(-10, 10, 0)

SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.009
SWEP.Primary.IronAccuracy = .001	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 30
SWEP.Primary.RPM = 260
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "ar2"
SWEP.DisableChambering 				= true

SWEP.Primary.Force 			= nil
SWEP.Primary.Knockback 		= nil
SWEP.Primary.Recoil			= 0
SWEP.Primary.KickUp			= 0

SWEP.Primary.SpreadMultiplierMax 	= nil							-- How far the spread can expand when you shoot. Example val: 2.5
SWEP.Primary.SpreadIncrement 	= 1/2.9							-- What percentage of the modifier is added on, per shot.  Example val: 1/3.5

SWEP.Tracer							= 0
SWEP.TracerName 					= "effect_sw_laser_white"
SWEP.TracerCount 					= 1
SWEP.TracerLua 						= false
SWEP.TracerDelay					= 0.01
SWEP.ImpactEffect 					= "effect_sw_impact"
SWEP.ImpactDecal 					= "FadingScorch"
SWEP.SelectiveFire		= true --Allow selecting your firemode?
SWEP.DisableBurstFire	= false --Only auto/single?
SWEP.OnlyBurstFire		= true --No auto, only burst/single?
SWEP.DefaultFireMode 	= "auto" --Default to auto or whatev
SWEP.FireModeName = nil --Change to a text value to override it
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.IronFOV = 90
SWEP.IronSightsPos = Vector(-2.901, -5.051, 1.37)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.BlowbackVector = Vector(0,0,0)
SWEP.Blowback_Only_Iron  = false
SWEP.DoProceduralReload = false
SWEP.ProceduralReloadTime = 1.5

SWEP.MuzzleFlashEffect 		= "tfa_muzzleflash_cryo"
		
SWEP.GrappleHookSound			= "weapons/rpg/shotdown.wav"
SWEP.GrappleMoveSound			= "weapons/tripwire/ropeshoot.wav"

SWEP.VElements = {
	["lasersight"] = { type = "Model", 
    model = "models/sw_battlefront/props/flashlight/flashlight.mdl", 
    bone = "DC15_S", rel = "", 
    pos = Vector(0.99, 6.752, 0.518), 
    angle = Angle(0, -90, 180), 
    size = Vector(0.5, 0.5, 0.5), 
    color = Color(255, 255, 255, 255), 
    surpresslightning = false, 
    material = "", 
    skin = 0, 
    bodygroup = {}, 
    bonermerge = true,
    active = true  },

  ["laser"] = { type = "Model", 
    model = "models/tfa/lbeam.mdl", 
    bone = "DC15_S", 
    rel = "lasersight", 
    pos = Vector(0, 0, 0), 
    angle = Angle(0, 0, 0),
    size = Vector(1.274, 1.274, 1.274), 
    color = Color(255, 255, 255, 255), 
    surpresslightning = false, 
    material = "", 
    skin = 0, 
    bodygroup = {}, 
    bonermerge = true, 
    active = false   },

 ["render"] = { type = "Model", model = "models/rtcircle.mdl",
 bone = "DC15_S", rel = "element_name",
 pos = Vector(2.299, 0.569, 1.149),
 angle = Angle(0, 0, 0),
 size = Vector(0.301, 0.301, 0.301),
 color = Color(255, 255, 255, 255),
 surpresslightning = false, 
 material = "!tfa_rtmaterial",
 skin = 0,
 bodygroup = {} },

["element_name"] = { type = "Model", model = "models/wystan/attachments_tfa/aimpoint.mdl",
 bone = "DC15_S", rel = "",
 pos = Vector(-0.601, 0, 1),
 angle = Angle(0, 90, 0),
 size = Vector(1, 1, 1),
 color = Color(255, 255, 255, 255),
 surpresslightning = false,
 material = "",
 skin = 0,
 bodygroup = {} }
}


SWEP.WElements = {
	["lazer"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "lazersight", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.755, 0.755, 0.755), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = false  },
	["lazersight"] = { type = "Model", model = "models/sw_battlefront/props/flashlight/flashlight.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(17, 2.2, -6), angle = Angle(-10.52, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = true },
	["scope"] = { type = "Model", model = "models/wystan/attachments_tfa/aimpoint.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.699, 0.55, -4.7), angle = Angle(169.481, 0, 0), size = Vector(1.34, 1.34, 1.34), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["render"] = { type = "Model", model = "models/rtcircle.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "scope", pos = Vector(-2.6, 0.768, 1.57), angle = Angle(0, 180, 0), size = Vector(0.432, 0.432, 0.432), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {} }
}


SWEP.Attachments = {
	[1] = { offset = { 0, 0 }, atts = { "lazersight4"}, order = 1 },
	[2] = { offset = { 0, 0 }, atts = { "clipexpand2"}, order = 2 },
--	[3] = { offset = { 0, 0 }, atts = { "grapplehookatt","mod_stun5_servius","mod_stun10_servius","mod_stun15_servius","mod_stun20_servius","mod_stun5_servius2"}, order = 3 },
	

}

--3dScopedBase stuff
SWEP.RTMaterialOverride = -1
SWEP.RTScopeAttachment = -1
SWEP.Scoped_3D = true
SWEP.ScopeReticule = "scope/star_ret" 
SWEP.Secondary.ScopeZoom = 8
SWEP.ScopeReticule_Scale = {1.5,1.5}
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

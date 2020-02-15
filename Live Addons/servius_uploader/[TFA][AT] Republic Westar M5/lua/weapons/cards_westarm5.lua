SWEP.Gun							= ("gun_base")
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "tfa_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Base							= "tfa_gun_base"
SWEP.Category						= "TFA StarWars Reworked Republic"
SWEP.Manufacturer 					= ""
SWEP.Author							= "ChanceSphere574 & Servius"
SWEP.Contact						= ""
SWEP.Spawnable						= true
SWEP.AdminSpawnable					= true
SWEP.DrawCrosshair					= true
SWEP.DrawCrosshairIS 				= false
SWEP.PrintName						= "Westar-M5"
SWEP.Type							= "Alpha ARC Rifle"
SWEP.DrawAmmo						= true
SWEP.data 							= {}
SWEP.data.ironsights				= 1
SWEP.Secondary.IronFOV				= 75
SWEP.Slot							= 3
SWEP.SlotPos						= 100

SWEP.FiresUnderwater 				= true

SWEP.IronInSound 					= nil
SWEP.IronOutSound 					= nil
SWEP.CanBeSilenced					= false
SWEP.Silenced 						= false

SWEP.DoMuzzleFlash 					= true
SWEP.CustomMuzzleFlash 				= true
SWEP.MuzzleFlashEffect 				= "rw_sw_muzzleflash_blue"

SWEP.SelectiveFire					= true
SWEP.DisableBurstFire				= false
SWEP.OnlyBurstFire					= false
SWEP.DefaultFireMode 				= "Automatic"
SWEP.FireModeName 					= nil
SWEP.DisableChambering 				= true

SWEP.Primary.ClipSize				= 75
SWEP.Primary.DefaultClip			= 75*5
SWEP.Primary.RPM					= 400
SWEP.Primary.RPM_Burst				= 620
SWEP.Primary.Ammo					= "ar2"
SWEP.Primary.AmmoConsumption 		= 1
SWEP.Primary.Range 					= -1
SWEP.Primary.RangeFalloff 			= -1
SWEP.Primary.NumShots				= 1
SWEP.Primary.Automatic				= true
SWEP.Primary.RPM_Semi				= nil
SWEP.Primary.BurstDelay				= 0.2
SWEP.Primary.Sound 					= Sound ("weapons/westarm5/westarm5_fire.wav");
SWEP.Primary.ReloadSound 			= Sound ("weapons/bf3/standard_reload2.ogg");
SWEP.Primary.PenetrationMultiplier 	= 0
SWEP.Primary.Damage					= 45
SWEP.Primary.HullSize 				= 0
SWEP.DamageType 					= nil

SWEP.DoMuzzleFlash 					= false

SWEP.FireModes = {
	"Automatic",
	"3Burst",
	"Single"
}


SWEP.IronRecoilMultiplier			= 0.45
SWEP.CrouchRecoilMultiplier			= 0.55
SWEP.JumpRecoilMultiplier			= 2
SWEP.WallRecoilMultiplier			= 1.1
SWEP.ChangeStateRecoilMultiplier	= 1.2
SWEP.CrouchAccuracyMultiplier		= 0.8
SWEP.ChangeStateAccuracyMultiplier	= 1
SWEP.JumpAccuracyMultiplier			= 2.5
SWEP.WalkAccuracyMultiplier			= 1.8
SWEP.NearWallTime 					= 0.5
SWEP.ToCrouchTime 					= 0.25
SWEP.WeaponLength 					= 35
SWEP.SprintFOVOffset 				= 12
SWEP.ProjectileVelocity 			= 9

SWEP.ProjectileEntity 				= nil
SWEP.ProjectileModel 				= nil

SWEP.ViewModel						= "models/servius/starwars/c_westarm5_noscope.mdl"
SWEP.WorldModel						= "models/servius/starwars/w_westar_noscope.mdl"
SWEP.ViewModelFOV					= 70
SWEP.ViewModelFlip					= false
SWEP.MaterialTable 					= nil
SWEP.UseHands 						= true
SWEP.HoldType 						= "ar2"
SWEP.ReloadHoldTypeOverride 		= "smg"

SWEP.ShowWorldModel = false

SWEP.BlowbackEnabled 				= true
SWEP.BlowbackVector 				= Vector(0,-1.5,-0.05)
SWEP.BlowbackCurrentRoot			= 0
SWEP.BlowbackCurrent 				= 0
SWEP.BlowbackBoneMods 				= nil
SWEP.Blowback_Only_Iron 			= true
SWEP.Blowback_PistolMode 			= false
SWEP.Blowback_Shell_Enabled 		= false
SWEP.Blowback_Shell_Effect 			= "None"

SWEP.Tracer							= 0
SWEP.TracerName 					= "rw_sw_laser_blue"
SWEP.TracerCount 					= 1
SWEP.TracerLua 						= false
SWEP.TracerDelay					= 0.01
SWEP.ImpactEffect 					= "effect_sw_impact"
SWEP.ImpactDecal 					= "FadingScorch"

SWEP.VMPos = Vector(0, 0, 0)
SWEP.VMAng = Vector(0, 0, 0)

SWEP.IronSightTime 					= 0.65
SWEP.Primary.KickUp					= 0.04
SWEP.Primary.KickDown				= 0.03
SWEP.Primary.KickHorizontal			= 0.01
SWEP.Primary.StaticRecoilFactor 	= 0.65
SWEP.Primary.Spread					= 0.01
SWEP.Primary.IronAccuracy 			= 0.001
SWEP.Primary.SpreadMultiplierMax 	= 1.5
SWEP.Primary.SpreadIncrement 		= 0.35
SWEP.Primary.SpreadRecovery 		= 0.98
SWEP.DisableChambering 				= true
SWEP.MoveSpeed 						= 1.15
SWEP.IronSightsMoveSpeed 			= 1

SWEP.IronSightsPos = Vector(-3.08, -0.202, 2.039)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(5.226, -2, 0)
SWEP.RunSightsAng = Vector(-18, 36, -13.5)
SWEP.InspectPos = Vector(8, -4.8, -3)
SWEP.InspectAng = Vector(11.199, 38, 0)


SWEP.VElements = {
	["lasersight"] = { type = "Model", model = "models/sw_battlefront/props/flashlight/flashlight.mdl", bone = "weapon", rel = "", pos = Vector(1.2, -1, 7.791), angle = Angle(90, 90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(80, 80, 80, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = true  },
	["laser3"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "weapon", rel = "lasersight", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1.144, 1.144, 1.144), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = false   },
	["scope"] = { type = "Model", model = "models/servius/starwars/w_scope.mdl", bone = "weapon", rel = "", pos = Vector(4.139, -5.93, -17), angle = Angle(0, 0, -90), size = Vector(1.36, 1.36, 1.36), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = false },
	["reticle"] = { type = "Model", model = "models/rtcircle.mdl", bone = "weapon", rel = "scope", pos = Vector(-4.14, 12.1, -2.721), angle = Angle(0, 90, 0), size = Vector(0.337, 0.337, 0.337), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {}, bonermerge = true, active = false },
	["ironsight"] = { type = "Model", model = "models/sw_battlefront/props/e11r_scope/e11r_scope.mdl", bone = "weapon", rel = "", pos = Vector(0.015, -2.9, 0.8), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), color = Color(80, 80, 80, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = true },


	["barrel"] = { type = "Model", model = "models/barrel/barrel.mdl", bone = "weapon", rel = "", pos = Vector(0.019, -0.95, 12.899), angle = Angle(-90, 0, 0), size = Vector(1.2, 0.899, 0.899), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false }

}

SWEP.WElements = {
	["westar"] = { type = "Model", model = "models/servius/starwars/w_westar_noscope.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.75, 0, -05.5), angle = Angle(-15, 0, 180), size = Vector(1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["scope"] = { type = "Model", model = "models/servius/starwars/w_scope.mdl", bone = "", rel = "westar", pos = Vector(-19.8, 2.85, 0), angle = Angle(180, 90, 0), size = Vector(1.299, 1.299, 1.299), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = false  },
	["lazer"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "lazersight", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.755, 0.755, 0.755), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = false  },
	["lazersight"] = { type = "Model", model = "models/sw_battlefront/props/flashlight/flashlight.mdl", bone = "", rel = "westar", pos = Vector(8, -02, -0.3), angle = Angle(0, 0, 180), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = true },
	["ironsight"] = { type = "Model", model = "models/sw_battlefront/props/e11r_scope/e11r_scope.mdl", bone = "", rel = "westar", pos = Vector(-04, -1.05, 2), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), color = Color(80, 80, 80, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = true },


	["barrel"] = { type = "Model", model = "models/barrel/barrel.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(21.6, 0.689, -6.5), angle = Angle(10.519, -178, 3.506), size = Vector(1, 0.85, 1), color = Color(251, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false }

}

SWEP.Attachments = {
	[1] = { offset = { 0, 0 }, atts = { "westar_laser"}, order = 1 },
	[2] = { offset = { 0, 0 }, atts = { "westar_barrel"}, order = 2 },
	[3] = { offset = { 0, 0 }, atts = { "westar_scope" }, order = 3 },
	[4] = { offset = { 0, 0 }, atts = { "westar_heavy_ammo","clipexpand_westar" }, order = 4 },

}

SWEP.IronSightsPos_Westar = Vector(-3.09, -2.5, 1.744)
SWEP.IronSightsAng_Westar= Vector(0, 0, 0)

SWEP.ThirdPersonReloadDisable		=false
SWEP.Primary.DamageType 			= DMG_BULLET
SWEP.DamageType 					= DMG_BULLET
SWEP.RTScopeAttachment				= -1
SWEP.Scoped_3D 						= false
SWEP.ScopeReticule 					= "#sw/visor/sw_ret_redux_blue" 
SWEP.Secondary.ScopeZoom 			= 7
SWEP.ScopeReticule_Scale 			= {1.1,1.1}
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
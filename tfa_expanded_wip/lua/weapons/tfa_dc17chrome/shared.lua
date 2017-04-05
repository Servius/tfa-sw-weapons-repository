

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "DC-17: Chrome"			
	SWEP.Author				= "TFA, Servius"
	SWEP.ViewModelFOV      	= 50
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
end

SWEP.Base					= "tfa_swsft_base_servius"

SWEP.Category = "TFA Star Wars"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 56
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/synbf3/c_dh17.mdl"
SWEP.WorldModel = "models/weapons/w_dc15sa.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.UseHands = true

SWEP.ViewModelBoneMods = {
	["v_dh17_reference001"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger21"] = { scale = Vector(1, 1, 1), pos = Vector(-0.556, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0.555, -0.556, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger32"] = { scale = Vector(1, 0.996, 1), pos = Vector(-0.556, -0.186, 0.185), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0.185, -0.556, 0.185), angle = Angle(-3.333, 0, 0) },
	["ValveBiped.Bip01_R_Finger2"] = { scale = Vector(0.961, 0.961, 0.961), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger22"] = { scale = Vector(0.904, 0.85, 0.904), pos = Vector(-0.556, -0.186, 0.185), angle = Angle(5.556, 0, 0) },
	["ValveBiped.Bip01_R_Finger01"] = { scale = Vector(0.924, 0.924, 0.924), pos = Vector(-0.186, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(0.85, 0.85, 0.85), pos = Vector(-1.297, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.Primary.Sound = Sound("weapons/DC17_fire.wav")
SWEP.Primary.ReloadSound = Sound("weapons/DC17_reload.wav")

SWEP.Primary.KickUp			= 2

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 110
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.0125
SWEP.Primary.IronAccuracy = .001	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 15
SWEP.Primary.RPM = 450
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"
SWEP.TracerName = "effect_sw_laser_blue"

SWEP.SelectiveFire		= true --Allow selecting your firemode?
SWEP.DisableBurstFire	= false --Only auto/single?
SWEP.OnlyBurstFire		= false --No auto, only burst/single?
SWEP.DefaultFireMode 	= "" --Default to auto or whatev
SWEP.FireModeName = nil --Change to a text value to override it

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.Secondary.IronFOV = 70

SWEP.IronSightsPos = Vector(-6.5, -3, .6)
SWEP.IronSightsAng = Vector(1, -7, -2)

SWEP.WElements = {
	["element_name2"] = { type = "Model", model = "models/dc17chrome/dc17chrome.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.599, 0.899, 0), angle = Angle(12.857, -176.495, 180), size = Vector(1.399, 1.399, 1.399), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/dc17chrome/dc17chrome.mdl", bone = "v_dh17_reference001", rel = "", pos = Vector(0.4, 0.28, -0.519), angle = Angle(-1.17, -82.987, -1.17), size = Vector(1.144, 1.144, 1.144), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


SWEP.BlowbackVector = Vector(0,-3,0.025)
SWEP.Blowback_Only_Iron  = false

SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2.5
--[[
SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/synbf3/c_dh17.mdl"
SWEP.WorldModel = "models/weapons/w_DC17.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["v_dh17_reference001"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger21"] = { scale = Vector(1, 1, 1), pos = Vector(-0.556, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0.555, -0.556, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger32"] = { scale = Vector(1, 0.996, 1), pos = Vector(-0.556, -0.186, 0.185), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0.185, -0.556, 0.185), angle = Angle(-3.333, 0, 0) },
	["ValveBiped.Bip01_R_Finger2"] = { scale = Vector(0.961, 0.961, 0.961), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger22"] = { scale = Vector(0.904, 0.85, 0.904), pos = Vector(-0.556, -0.186, 0.185), angle = Angle(5.556, 0, 0) },
	["ValveBiped.Bip01_R_Finger01"] = { scale = Vector(0.924, 0.924, 0.924), pos = Vector(-0.186, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(0.85, 0.85, 0.85), pos = Vector(-1.297, 0, 0), angle = Angle(0, 0, 0) }
}
SWEP.WElements = {
	["element_name2"] = { type = "Model", model = "models/dc17chrome/dc17chrome.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.599, 0.899, 0), angle = Angle(12.857, -176.495, 180), size = Vector(1.399, 1.399, 1.399), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/dc17chrome/dc17chrome.mdl", bone = "v_dh17_reference001", rel = "", pos = Vector(0.4, 0.28, -0.519), angle = Angle(-1.17, -82.987, -1.17), size = Vector(1.144, 1.144, 1.144), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
--]]
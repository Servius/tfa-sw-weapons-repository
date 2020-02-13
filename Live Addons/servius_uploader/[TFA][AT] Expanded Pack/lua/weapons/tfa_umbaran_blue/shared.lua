if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end
if ( CLIENT ) then
	SWEP.PrintName			= "Umbaran Rifle"			
	SWEP.Author				= "TFA, Servius"
	SWEP.ViewModelFOV      	= 62.51256281407
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
end
SWEP.Base					= "tfa_swsft_base_servius"
SWEP.Category = "TFA Star Wars"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.HoldType = "rpg"
SWEP.ViewModelFOV = 62.51256281407
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.WorldModel = "models/weapons/synbf3/w_a280.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.UseHands = true
SWEP.Primary.Sound = Sound ("weapons/umbaran/wpn_umbaran_rifle_shoot_03.ogg");
SWEP.Primary.ReloadSound = Sound("weapons/shared/standard_reload.ogg");
SWEP.Primary.KickUp			= 0.2
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.015
SWEP.Primary.IronAccuracy = .001	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 40
SWEP.Primary.RPM = 250
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "ar2"
SWEP.TracerName = "rw_sw_laser_green"
SWEP.SelectiveFire		= false --Allow selecting your firemode?
SWEP.DisableBurstFire	= false --Only auto/single?
SWEP.OnlyBurstFire		= false --No auto, only burst/single?
SWEP.DefaultFireMode 	= "" --Default to auto or whatev
SWEP.FireModeName = nil --Change to a text value to override it
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.IronFOV = 70
SWEP.IronSightsPos = Vector(-6.433, -0.403, 2.009)
SWEP.IronSightsAng = Vector(0, 0, 7)
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0.925, 0.185, -0.186), angle = Angle(0, 0, 0) },
	["v_weapon.awm_parent"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 2.407, 0.555), angle = Angle(0, 0, 0) }
}
SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/servius/starwars/cwa2/umbaran_rifle.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-3.901, 0.899, 1), angle = Angle(-106, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/servius/starwars/cwa2/umbaran_rifle.mdl", bone = "v_weapon.awm_parent", rel = "", pos = Vector(-0.301, -1, 7), angle = Angle(180, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.BlowbackVector = Vector(0,-1,0.025)
SWEP.Blowback_Only_Iron  = false
SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2.5
--[[
SWEP.HoldType = "rpg"
SWEP.ViewModelFOV = 62.51256281407
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.WorldModel = "models/weapons/synbf3/w_a280.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0.925, 0.185, -0.186), angle = Angle(0, 0, 0) },
	["v_weapon.awm_parent"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 2.407, 0.555), angle = Angle(0, 0, 0) }
}
SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/servius/starwars/cwa2/umbaran_purple_rifle.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-3.901, 0.899, 1), angle = Angle(-106, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/servius/starwars/cwa2/umbaran_purple_rifle.mdl", bone = "v_weapon.awm_parent", rel = "", pos = Vector(-0.301, -1, 7), angle = Angle(180, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.IronSightsPos = Vector(-6.433, -0.403, 2.009)
SWEP.IronSightsAng = Vector(0, 0, 7)
--]]
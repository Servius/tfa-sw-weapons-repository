if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end
if ( CLIENT ) then
	SWEP.PrintName			= "WESTAR-35 Blaster Carbine"			
	SWEP.Author				= "TFA, Servius, ahnok"
	SWEP.ViewModelFOV      	= 70
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
end
SWEP.Base					= "tfa_swsft_base_servius"
SWEP.Category = "TFA Star Wars: Deathwatch"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.WorldModel = "models/weapons/w_dc15sa.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.UseHands = true
SWEP.Primary.Sound = Sound ("weapons/deathwatch_mando/WPN_MandoBlaster_Shoot_2.ogg");
SWEP.Primary.ReloadSound = Sound("weapons/shared/standard_reload.ogg");
SWEP.Primary.KickUp			= 0.2
SWEP.Weight					= 10
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 60
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.0075
SWEP.Primary.IronAccuracy = .001	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 40
SWEP.Primary.RPM = 220
SWEP.Primary.DefaultClip	= 400
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"
SWEP.TracerName = "effect_sw_laser_yellow"
SWEP.SelectiveFire		= false --Allow selecting your firemode?
SWEP.DisableBurstFire	= false --Only auto/single?
SWEP.OnlyBurstFire		= false --No auto, only burst/single?
SWEP.DefaultFireMode 	= "" --Default to auto or whatev
SWEP.FireModeName = nil --Change to a text value to override it
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.IronFOV = 70
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0.185, -1.668, 0.185), angle = Angle(0, 0, 0) },
	["v_weapon.awm_parent"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(-0.186, -0.186, -0.556), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(-0.186, -0.186, 0.185), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.185, 0), angle = Angle(0, 0, 0) }
}
SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/servius/starwars/cwa2/cadbane_rifle.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.9, 0.6, -0.101), angle = Angle(-106, -2.401, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/servius/starwars/cwa2/cadbane_rifle.mdl", bone = "v_weapon.awm_parent", rel = "", pos = Vector(-0.301, -1, 1.7), angle = Angle(180, -90, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.IronSightsPos = Vector(-7.16, 0, 3.319)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.BlowbackVector = Vector(0,-1,0.025)
SWEP.Blowback_Only_Iron  = false
SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2.5
--[[
SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.WorldModel = "models/weapons/w_dc15sa.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0.185, -1.668, 0.185), angle = Angle(0, 0, 0) },
	["v_weapon.awm_parent"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(-0.186, -0.186, -0.556), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(-0.186, -0.186, 0.185), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.185, 0), angle = Angle(0, 0, 0) }
}
SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/servius/starwars/cwa2/cadbane_rifle.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.9, 0.6, -0.101), angle = Angle(-106, -2.401, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/servius/starwars/cwa2/cadbane_rifle.mdl", bone = "v_weapon.awm_parent", rel = "", pos = Vector(-0.301, -1, 1.7), angle = Angle(180, -90, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.IronSightsPos = Vector(-7.16, 0, 3.319)
SWEP.IronSightsAng = Vector(0, 0, 0)
--]]
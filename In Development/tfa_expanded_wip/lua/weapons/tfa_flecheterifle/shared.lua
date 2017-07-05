if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end
if ( CLIENT ) then
	SWEP.PrintName			= "Flechete Rifle"			
	SWEP.Author				= "TFA, Servius"
	SWEP.ViewModelFOV      	= 50
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
end
SWEP.HoldType				= "ar2"
SWEP.Base					= "tfa_swsft_base_servius"
SWEP.Category = "TFA Star Wars"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.ViewModelFOV = 56
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.WorldModel = "models/weapons/w_irifle.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.UseHands = true
SWEP.ViewModelBoneMods = {
	["v_weapon.awm_parent"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0.338, 2.914, 0.18), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 1.447, 0) }
}
SWEP.Primary.Sound = Sound ("weapons/1misc_guns/WPN_B2_BTLDROID_HVY_LASER_SHOOT_01.ogg");
SWEP.Primary.ReloadSound = Sound("weapons/shared/standard_reload.ogg");
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.BlowbackEnabled = true
SWEP.Blowback_Only_Iron = false --Only do blowback on ironsights
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 20
SWEP.Primary.NumShots		= 6
SWEP.Primary.Spread			= 0.0225
SWEP.Primary.IronAccuracy = 0.0125	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 8
SWEP.Primary.RPM = 170
SWEP.Primary.DefaultClip	= 150
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"
SWEP.TracerName = "effect_sw_laser_green"
SWEP.Primary.KickUp = 2 -- This is the maximum upwards recoil (rise)
SWEP.Primary.PenetrationMultiplier = 1
SWEP.MaxPenetrationCounter = 1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.MoveSpeed = .8 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = 0.8 --Multiply the player's movespeed by this when sighting.
SWEP.Secondary.IronFOV = 70
SWEP.IronSightsPos = Vector(-7, -10, 2.2)
SWEP.IronSightsAng = Vector(-1, -3.1, 10)
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/star wars the force unleashed/flechette.mdl", bone = "v_weapon.awm_parent", rel = "", pos = Vector(-1, -1.5, -3.7), angle = Angle(170, 90, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["element_name2"] = { type = "Model", model = "models/star wars the force unleashed/flechette.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7, 2.5, -1.5), angle = Angle(90, -80, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.BlowbackVector = Vector(0,-3,0.025)
SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2.5

if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end
if ( CLIENT ) then
	SWEP.PrintName			= "DC-15A"			
	SWEP.Author				= "TFA"
	SWEP.ViewModelFOV      	= 50
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/DC15A")
	killicon.Add( "weapon_752_dc15a", "HUD/killicons/DC15A", Color( 255, 80, 0, 255 ) )
end
SWEP.HoldType				= "ar2"
SWEP.Base					= "tfa_swsft_base"
SWEP.Category = "TFA Star Wars"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 56
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.WorldModel = "models/weapons/w_irifle.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.UseHands = true
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0.736, 5.183, 1.149), angle = Angle(-1.825, 2.803, -0.527) },
	["v_weapon.awm_parent"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}
SWEP.Primary.Sound = Sound ("weapons/dc15a/DC15A_fire.ogg");
SWEP.Primary.ReloadSound = Sound ("weapons/shared/standard_reload.ogg");
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
-- Selective Fire Stuff
SWEP.SelectiveFire		= true --Allow selecting your firemode?
SWEP.DisableBurstFire	= false --Only auto/single?
SWEP.OnlyBurstFire		= false --No auto, only burst/single?
SWEP.DefaultFireMode 	= "" --Default to auto or whatev
SWEP.FireModeName = nil --Change to a text value to override it
SWEP.Primary.Spread			= 0.0125
SWEP.Primary.IronAccuracy = .005	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.SpreadMultiplierMax = 2 --How far the spread can expand when you shoot.
--Range Related
SWEP.Primary.Range = -1 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = -1 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.
--Penetration Related
SWEP.MaxPenetrationCounter=1 --The maximum number of ricochets.  To prevent stack overflows.
SWEP.Primary.ClipSize		= 50
SWEP.Primary.RPM = 60/0.175
--= 150
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "battery"
SWEP.TracerName = "effect_sw_laser_blue"
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.IronFOV = 70
SWEP.IronSightsPos = Vector(-7.401, -16.251, 1.47)
SWEP.IronSightsAng = Vector(0.209, 0.212, 0)
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/weapons/w_dc15a_neue.mdl", bone = "v_weapon.awm_parent", rel = "", pos = Vector(0, -2.437, -4.307), angle = Angle(0, 180, 90), size = Vector(0.755, 0.755, 0.755), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/weapons/w_dc15a_neue.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.35, 0.547, -2.832), angle = Angle(-1.767, -85.473, 166.1), size = Vector(0.675, 0.675, 0.675), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.BlowbackVector = Vector(0,-3,0.025)
SWEP.Blowback_Only_Iron  = false
SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2.5
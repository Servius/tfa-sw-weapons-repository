

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "DC-15A Clone Guard Edition"			
	SWEP.Author				= "Servius & StrickenNZ"
	SWEP.ViewModelFOV      	= 50
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/DC15A")
	
	killicon.Add( "weapon_tfa_dc15acg", "HUD/killicons/DC15A", Color( 255, 80, 0, 255 ) )
	
end

SWEP.HoldType				= "ar2"
SWEP.Base					= "tfa_swsft_base_servius"

SWEP.Category = "TFA Star Wars: Color Force"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 56
SWEP.ViewModelFlip = false

SWEP.ViewModel				= "models/weapons/v_clg5A.mdl"
SWEP.WorldModel				= "models/weapons/w_clg5A.mdl"

SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.UseHands = false

--SWEP.ViewModelBoneMods = {
	--["v_weapon.awm_parent"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	--["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0.338, 2.914, 0.18), angle = Angle(0, 0, 0) },
	--["ValveBiped.Bip01_L_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 1.447, 0) }
--}

SWEP.Primary.Sound = Sound ("weapons/dc15a/DC15A_fire.ogg");
SWEP.Primary.ReloadSound = Sound ("weapons/shared/standard_reload.ogg");
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.0125
SWEP.Primary.IronAccuracy = .005	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 50
SWEP.Primary.RPM = 60/0.175
SWEP.Primary.DefaultClip	= 150
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"
SWEP.TracerName = "effect_sw_laser_blue"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.Secondary.IronFOV = 70

SWEP.IronSightsPos = Vector(-4.5, -7, -.5)
SWEP.IronSightsAng = Vector(1, 0, 0)
--[[
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/weapons/w_dc15a_neue2.mdl", bone = "v_weapon.awm_parent", rel = "", pos = Vector(-0.011, -2.924, -5.414), angle = Angle(180, 0, -89.595), size = Vector(0.95, 0.95, 0.95), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
--]]
--SWEP.WElements = {
	--["element_name2"] = { type = "Model", model = "models/weapons/w_dc15a_neue2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.279, 0.584, -4.468), angle = Angle(0, -90, 160.731), size = Vector(0.884, 0.884, 0.884), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
--}


SWEP.BlowbackVector = Vector(0,-3,0.025)
SWEP.Blowback_Only_Iron  = false

SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2.5
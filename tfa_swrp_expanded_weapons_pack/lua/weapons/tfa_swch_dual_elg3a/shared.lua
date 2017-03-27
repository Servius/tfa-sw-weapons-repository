if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "TFA Dual ELG-3A"			
	SWEP.Author				= "Servius"
	SWEP.ViewModelFOV      	= 76
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/ELG3A")
	
	killicon.Add( "tfa_sw_dual_elg3a", "HUD/killicons/EKG3A", Color( 255, 80, 0, 255 ) )
	
end

SWEP.Author				= "Servius" --Author Tooltip
SWEP.Contact				= "http://steamcommunity.com/profiles/76561198036188853/" --Contact Info Tooltip
SWEP.Purpose				= "Shoot some people" --Purpose Tooltip
SWEP.Instructions				= "Left click to shoot...dummy." --Instructions Tooltip

SWEP.HoldType = "duel"
SWEP.ViewModelFOV = 72.160804020101
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cstrike/c_pist_elite.mdl"
SWEP.WorldModel = "models/weapons/w_ELG3A.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.Akimbo = true
SWEP.ViewModelBoneMods = {
	["v_weapon.Hands_parent"] = { scale = Vector(0.961, 1.001, 0.961), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["v_weapon.elite_right"] = { scale = Vector(0.018, 0.018, 0.018), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["v_weapon.Left_Hand"] = { scale = Vector(1.016, 1.016, 1.016), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["v_weapon.Right_Arm"] = { scale = Vector(1, 1, 1), pos = Vector(-3.149, -1.297, 0.185), angle = Angle(0, 0, 0) },
	["v_weapon.elite_left"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["elg3a"] = { type = "Model", model = "models/weapons/w_ELG3A.mdl", bone = "v_weapon.elite_left", rel = "", pos = Vector(-0.519, -1.558, 4.675), angle = Angle(90, -99.351, 15.194), size = Vector(0.69, 0.69, 0.69), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["elg3a+"] = { type = "Model", model = "models/weapons/w_ELG3A.mdl", bone = "v_weapon.elite_right", rel = "", pos = Vector(-0.519, -1.558, 4.675), angle = Angle(90, -99.351, 15.194), size = Vector(0.69, 0.69, 0.69), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


SWEP.WElements = {
	["elg3a"] = { type = "Model", model = "models/weapons/w_ELG3A.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(9.362, 1.738, 3.665), angle = Angle(0, 0, 0), size = Vector(0.827, 0.827, 0.827), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.Base					= "tfa_swsft_base_servius"

SWEP.Category				= "TFA Star Wars"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound 			= Sound("TFA_SW_ELG3A.1")				-- This is the sound of the weapon, when you shoot.

SWEP.Callback = {}
SWEP.Callback.ChooseProceduralReloadAnim = function(self)
	self:EmitSound("TFA_SW_ELG3A.Reload")
end

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread		= 0.0125
SWEP.Primary.IronAccuracy = .005	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 50
SWEP.Primary.Delay			= 0.35
SWEP.Primary.DefaultClip	= 75
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "ar2"
SWEP.TracerName 		= "effect_sw_laser_green_akimbo_pu"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos = Vector(-1.16, 0, 1.09)
SWEP.IronSightsAng = Vector(-0.101, 1, -1.407)

SWEP.Akimbo = true

SWEP.ProceduralHolsterAng = Vector(-45,0,0)

SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2

SWEP.LuaShellEject = true
SWEP.LuaShellEffect = ""

SWEP.BlowbackEnabled = false
if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "TFA Dual KYD-21"			
	SWEP.Author				= "Servius"
	SWEP.ViewModelFOV      	= 70
	SWEP.Slot				= 1
	SWEP.SlotPos			= 5
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/KYD21")
	
	killicon.Add( "weapon_752_kyd21", "HUD/killicons/KYD21", Color( 255, 80, 0, 255 ) )
	
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
SWEP.WorldModel = "models/weapons/w_KYD21.mdl"

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
	["kyd21"] = { type = "Model", model = "models/weapons/w_KYD21.mdl", bone = "v_weapon.elite_left", rel = "", pos = Vector(-1.5, -2, 4.675), angle = Angle(180, 0, 270), size = Vector(.85, .85, .85), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["kyd21+"] = { type = "Model", model = "models/weapons/w_KYD21.mdl", bone = "v_weapon.elite_right", rel = "", pos = Vector(-.5, -1.85, 4.675), angle = Angle(180, 0, 270), size = Vector(.85, .85, .85), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


SWEP.WElements = {
	["kyd21"] = { type = "Model", model = "models/weapons/w_KYD21.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(10, 2, 3.665), angle = Angle(360, 270, 360), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.Base					= "tfa_swsft_base_servius"

SWEP.Category				= "TFA Star Wars"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound 			= Sound("weapons/KYD21_fire.wav")				-- This is the sound of the weapon, when you shoot.

SWEP.Callback = {}
SWEP.Callback.ChooseProceduralReloadAnim = function(self)
	self:EmitSound("weapons/KYD21_reload.wav")
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
SWEP.TracerName 		= "effect_sw_laser_red_akimbo_pu"

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


if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "RPS-6"			
	SWEP.Author				= "TFA"
	SWEP.Slot				= 4
	SWEP.SlotPos			= 1
	
end

SWEP.HoldType				= "rpg"
SWEP.Base					= "tfa_swsft_base"
SWEP.Category = "TFA Star Wars"

SWEP.Spawnable				= true
SWEP.AdminOnly			= true

SWEP.HoldType = "rpg"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/cstrike/c_rif_famas.mdl"
SWEP.WorldModel = "models/weapons/w_irifle.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.UseHands = true
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(2.427, 1.802, 0.259), angle = Angle(0, 0, 0) },
	["v_weapon.famas"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.VMPos = Vector(1, -2.814, -3.862)
SWEP.VMAng = Vector(3.032, 3.306, 0)

SWEP.IronSightsPos = Vector(-1.56, -17.848, 0.261) - SWEP.VMPos
SWEP.IronSightsAng = Vector(2.163, 1.187, 0) - SWEP.VMAng

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound = Sound ("weapons/DC17M_AT_fire.wav");
SWEP.Primary.ReloadSound = Sound ("weapons/DC17M_AT_reload.wav");

SWEP.Primary.Recoil			= 30
SWEP.Primary.Damage			= 10000
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.05
SWEP.Primary.ClipSize		= 1
SWEP.Primary.RPM = 60/1
SWEP.Primary.DefaultClip	= 3
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "rpg_round"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.ProjectileEntity = "world_ender" --Entity to shoot
SWEP.ProjectileVelocity = 800 --Entity to shoot's velocity

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/weapons/w_clonelauncher.mdl", bone = "v_weapon.famas", rel = "", pos = Vector(-0.156, 0.57, 18.426), angle = Angle(3.334, -1.02, -90.359), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/weapons/w_clonelauncher.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.072, 1.34, -2.241), angle = Angle(0, -93.96, 171.779), size = Vector(0.814, 0.814, 0.814), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2.5

SWEP.Scoped				= true
SWEP.Secondary.UseGreenDuplex		= true
SWEP.ScopeScale = 0.6 
SWEP.Secondary.IronFOV = 30
if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if ( CLIENT ) then
	SWEP.PrintName			= "Grenade Launcher"			
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
	["v_weapon.awm_parent"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(-3, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-1, 2, 0.18), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(-1, -1, 1), angle = Angle(0, 1.447, 0) }
}
SWEP.Primary.Sound = Sound ("NPC_Combine.GrenadeLaunch");
SWEP.Primary.ReloadSound = Sound ("weapons/shared/battlefront_standard_reload.ogg");
SWEP.Weight					= 50
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Primary.Recoil			= 2
SWEP.Primary.Damage			= 200
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.05
SWEP.Primary.ClipSize		= 3
SWEP.Primary.RPM = 200
SWEP.Primary.DefaultClip	= 12
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "rpg_round"
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.ProjectileEntity = "ent_baby_explosive2" --Entity to shoot
SWEP.ProjectileVelocity = 1000 --Entity to shoot's velocity
SWEP.Scoped				= false
SWEP.Secondary.UseGreenDuplex		= false
SWEP.Secondary.IronFOV = 70
SWEP.IronSightsPos = Vector(-7.401, -10, 0)
SWEP.IronSightsAng = Vector(-1.89, 0.282, 0)
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/props/starwars/weapons/grenade_launcher.mdl", bone = "v_weapon.awm_parent", rel = "", pos = Vector(0, 3, -10), angle = Angle(-90, 90, 0), size = Vector(0.95, 0.95, 0.95), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["element_name2"] = { type = "Model", model = "models/props/starwars/weapons/grenade_launcher.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10, 0.584, 2), angle = Angle(180, -180, 0), size = Vector(0.884, 0.884, 0.884), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.BlowbackVector = Vector(0,.1,0)
SWEP.Blowback_Only_Iron  = false
SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2.5
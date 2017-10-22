if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if ( CLIENT ) then
	SWEP.PrintName			= "Republic Launcher"			
	SWEP.Author				= "TFA"
	SWEP.Slot				= 4
	SWEP.SlotPos			= 1
end
SWEP.HoldType				= "rpg"
SWEP.Base					= "tfa_swsft_base"
SWEP.Category = "TFA Star Wars"
SWEP.Spawnable				= true
SWEP.AdminOnly			= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/cstrike/c_rif_famas.mdl"
SWEP.WorldModel = "models/weapons/w_irifle.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.UseHands = true
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(2.427, 1.802, 0.259), angle = Angle(-12, 0, 0) },
	["v_weapon.famas"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(-12, 0, 0) }
}
SWEP.VMPos = Vector(1, -2.814, -3.862)
SWEP.VMAng = Vector(3.032, 3.306, 0)
SWEP.IronSightsPos = Vector(-1.56, -17.848, 0.261) - SWEP.VMPos
SWEP.IronSightsAng = Vector(2.163, 1.187, 0) - SWEP.VMAng
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Primary.Sound = Sound ("weapons/explosives_cannons_superlazers/dc17m_at_fire.ogg");
SWEP.Primary.ReloadSound = Sound ("weapons/shared/standard_reload.ogg");
SWEP.Primary.Recoil			= 10
SWEP.Primary.Damage			= 200
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.05
SWEP.Primary.ClipSize		= 1
SWEP.Primary.RPM = 60/1
SWEP.Primary.DefaultClip	= 3
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "rpg_round"
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.ProjectileEntity = "dc17m_at_rocket2" --Entity to shoot
SWEP.ProjectileVelocity = 500 --Entity to shoot's velocity
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/props/starwars/weapons/rep_launcher.mdl", bone = "v_weapon.famas", rel = "", pos = Vector(-0, 2, 11), angle = Angle(90, 0, -90), size = Vector(.8, .8, .8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/props/starwars/weapons/rep_launcher.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0, 2, 2 ), angle = Angle(0, 0, 190), size = Vector(.6, .6, .7), color = Color(255, 255, 255, 255), surpresslightning = true, material = "", skin = 0, bodygroup = {} }
}
SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2.5
SWEP.Scoped				= true
SWEP.Secondary.UseGreenDuplex		= true
SWEP.ScopeScale = .9--Scale of the scope overlay
SWEP.ReticleScale = .65 --Scale of the reticle overlay
SWEP.Secondary.IronFOV = 30
if surface then
	SWEP.Secondary.ScopeTable = nil --[[
		{
			scopetex = surface.GetTextureID("scope/gdcw_closedsight"),
			reticletex = surface.GetTextureID("scope/gdcw_acogchevron"),
			dottex = surface.GetTextureID("scope/gdcw_acogcross")
		}
	]]--
end

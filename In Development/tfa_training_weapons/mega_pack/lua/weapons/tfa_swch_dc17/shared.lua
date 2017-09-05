if (SERVER) then
	AddCSLuaFile("shared.lua")
end

if (CLIENT) then
	SWEP.PrintName = "DC-17"
	SWEP.Author = "Syntax_Error752"
	SWEP.ViewModelFOV = 70
	SWEP.Slot = 1
	SWEP.SlotPos = 5
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/DC17")
	killicon.Add("weapon_752_dc17", "HUD/killicons/DC17", Color(255, 80, 0, 255))
end

SWEP.HoldType = "pistol"
SWEP.Base = "tfa_swsft_base"
SWEP.Category = "TFA Star Wars"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/v_DC17.mdl"
SWEP.WorldModel = "models/weapons/w_DC17.mdl"
SWEP.Primary.Sound = Sound("weapons/dc17/DC17_fire.ogg")
SWEP.Primary.ReloadSound = Sound ("weapons/shared/standard_reload.ogg");
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Primary.Recoil = 0.5
SWEP.Primary.Damage = 50
SWEP.Primary.NumShots = 1
SWEP.Primary.Spread = 0.0125
SWEP.Primary.ClipSize = 25
SWEP.Primary.RPM = 60 / 0.2
SWEP.Primary.DefaultClip = 75
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "ar2"
SWEP.TracerName = "effect_sw_laser_blue"
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.IronSightsPos = Vector(-3.6, -5, 1.7)
SWEP.IronSightsAng = Vector(0.7, 0.3, 0)
SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2
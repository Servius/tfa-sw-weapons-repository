if (SERVER) then
	AddCSLuaFile("shared.lua")
end

if (CLIENT) then
	SWEP.PrintName = "DC-17m Sniper Rifle"
	SWEP.Author = "Syntax_Error752"
	SWEP.Slot = 2
	SWEP.SlotPos = 3
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/DC17M_SN")
	killicon.Add("weapon_752_dc17m_sn", "HUD/killicons/DC17M_SN", Color(255, 80, 0, 255))
end

SWEP.HoldType = "ar2"
SWEP.Base = "tfa_swsft_base"
SWEP.Category = "TFA Star Wars"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/v_DC17M_SN.mdl"
SWEP.WorldModel = "models/weapons/w_DC17M_SN.mdl"
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Primary.Sound = Sound("weapons/dc17m_sn/dc17m_sn_fire.ogg")
SWEP.Primary.ReloadSound = Sound("weapons/shared/standard_reload.ogg")
SWEP.Primary.Recoil = 1
SWEP.Primary.Damage = 100
SWEP.Primary.NumShots = 1
SWEP.Primary.Spread = 0.00625
SWEP.Primary.ClipSize = 5
SWEP.Primary.RPM = 60 / 1
SWEP.Primary.DefaultClip = 15
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "ar2"
SWEP.TracerName = "effect_sw_laser_blue"
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.ViewModelFOV = 60
SWEP.Secondary.IronFOV = 40
SWEP.IronSightsPos = Vector(-4.705, -25, -0.515)
SWEP.IronSightsAng = Vector()


if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "DC-15S"			
	SWEP.Author				= "Syntax_Error752"
	SWEP.ViewModelFOV      	= 50
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/DC15S")
	
	killicon.Add( "weapon_752_dc15s", "HUD/killicons/DC15S", Color( 255, 80, 0, 255 ) )
	
end

SWEP.HoldType				= "ar2"
SWEP.Base					= "tfa_swsft_base"

SWEP.Category = "TFA Star Wars"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel				= "models/weapons/v_DC15S.mdl"
SWEP.WorldModel				= "models/weapons/w_DC15S.mdl"

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound = Sound ("weapons/dc15s/DC15S_fire.ogg");
SWEP.Primary.ReloadSound = Sound ("weapons/shared/standard_reload.ogg");

SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.0125
SWEP.Primary.ClipSize		= 50
SWEP.Primary.RPM = 60/0.25
--= 150
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "battery"
SWEP.TracerName = "effect_sw_laser_blue"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos = Vector(-4.06, -9.219, 1.395)
SWEP.IronSightsAng = Vector(-0.454, 0.7, 0.5)

SWEP.ShowWorldModel = false

SWEP.ViewModelBoneMods = {
	["v_thompson"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/swbf3/rep/blaster.mdl", bone = "v_thompson.root5", rel = "", pos = Vector(1.904, 5.247, -0.265), angle = Angle(0.699, 2.354, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/swbf3/rep/blaster.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10.491, 0.898, 0.773), angle = Angle(-11.723, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}



if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "Wrist Blaster Red"			
	SWEP.Author				= "Servius"
	SWEP.ViewModelFOV      	= 70
	SWEP.Slot				= 1
	SWEP.SlotPos			= 5
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/DC15SA")
	
	killicon.Add( "weapon_752_dc15sa", "HUD/killicons/DC15SA", Color( 255, 80, 0, 255 ) )
	
end

SWEP.Author				= "Servius" --Author Tooltip
SWEP.Contact				= "http://steamcommunity.com/profiles/76561198036188853/" --Contact Info Tooltip
SWEP.Purpose				= "Shoot some people" --Purpose Tooltip
SWEP.Instructions				= "Left click to shoot...dummy." --Instructions Tooltip

SWEP.HoldType				= "pistol"
SWEP.Base					= "tfa_swsft_base_servius_training"

SWEP.Category = "TFA Star Wars: Training"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel				= "models/weapons/c_sw_free_hands.mdl"
SWEP.WorldModel				= "models/weapons/c_sw_free_hands.mdl"

SWEP.Primary.Sound = Sound ("weapons/dc15sa/DC15SA_fire.ogg");

local MaxTimer				=64
local CurrentTimer			=0
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 0
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.0125
SWEP.Primary.IronAccuracy = .005	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 8
SWEP.Primary.RPM = 60/0.2
SWEP.Primary.DefaultClip	= 8
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "battery"
SWEP.TracerName = "effect_sw_laser_red"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos 			= Vector (-3.9, -6, 2.5)
SWEP.IronSightsAng 			= Vector (-0.3, -0.05, 0)

function SWEP:Think()
	if (self.Weapon:Clip1() < self.Primary.ClipSize) and SERVER then
		if (CurrentTimer <= 0) then 
			CurrentTimer = MaxTimer
			self.Weapon:SetClip1( self.Weapon:Clip1() + 1 )
		else
			CurrentTimer = CurrentTimer-1
		end
	end
end

function SWEP:Reload()

end


if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "DH-17"			
	SWEP.Author				= "Servius, Lightcruiser, Syntax"
	SWEP.ViewModelFOV		= 62
	SWEP.Slot			= 1
	SWEP.SlotPos			= 5
	
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/hud/weapon_752bf3_dh17")
	
	killicon.Add( "weapon_752bf3_dh17", "vgui/hud/weapon_752bf3_dh17", Color( 255, 255, 255, 255 ) )

end

SWEP.HoldType				= "pistol"
SWEP.Base				= "tfa_swsft_base"

SWEP.Category 				= "TFA Star Wars Battlefront"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel				= "models/weapons/synbf3/c_dh17.mdl"
SWEP.WorldModel				= "models/weapons/synbf3/w_dh17.mdl"
SWEP.UseHands 				= true --Use gmod c_arms system.

SWEP.Weight				= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound 			= Sound ("weapons/synbf3/dh17_fire.wav");
SWEP.Primary.ReloadSound 		= Sound ("weapons/synbf3/dh17_reload.wav");

SWEP.Primary.Recoil			= 0.85
SWEP.Primary.Damage			= 17
SWEP.Primary.NumShots			= 1

SWEP.Primary.Spread			= 0.006
SWEP.Primary.IronAccuracy = .01	-- Ironsight accuracy, should be the same for shotguns

SWEP.Primary.ClipSize			= 25
SWEP.Primary.RPM = 60/.09
SWEP.Primary.DefaultClip		= 25
SWEP.Primary.Automatic			= true
SWEP.Primary.Ammo			= "battery"
SWEP.TracerName 			= "effect_sw_laser_red"

SWEP.Secondary.Automatic		= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos 			= Vector(1, -5, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

local MaxTimer				=64
local CurrentTimer			=0

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

SWEP.SelectiveFire = true
SWEP.FireModes = {
	"3Burst",
	"Single"
}





	
local weaponcol = Color(0.435*255,0.10*255,0.7*255,255)

SWEP.IronSightsSensitivity = 0.25 --Useful for a RT scope.  Change this to 0.25 for 25% sensitivity.  This is if normal FOV compenstaion isn't your thing for whatever reason, so don't change it for normal scopes.
SWEP.BlowbackVector = Vector(0,-1,0.05)


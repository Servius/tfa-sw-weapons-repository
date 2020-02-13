

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "Deathwatch Wrist Rocket"			
	SWEP.Author				= "ahnok"
	SWEP.ViewModelFOV      	= 70
	SWEP.Slot				= 1
	SWEP.SlotPos			= 5
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/DC15SA")
	
	killicon.Add( "weapon_752_dc15sa", "HUD/killicons/DC15SA", Color( 255, 80, 0, 255 ) )
	
end

SWEP.Author				= "Servius, ahnok" --Author Tooltip
SWEP.Contact				= "http://steamcommunity.com/profiles/76561198036188853/" --Contact Info Tooltip
SWEP.Purpose				= "Assault" --Purpose Tooltip
SWEP.Instructions				= "Left click to shoot" --Instructions Tooltip

SWEP.HoldType				= "pistol"
SWEP.Base					= "tfa_swsft_base_servius"

SWEP.Category = "TFA Star Wars: Deathwatch"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel				= "models/weapons/c_sw_free_hands.mdl"
SWEP.WorldModel				= "models/weapons/c_sw_free_hands.mdl"

local MaxTimer				=64
local CurrentTimer			=0
SWEP.Weight					= 0
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound = Sound ("weapons/dw_wrist_rocket/dw_wrist_rocket_fire.ogg")
SWEP.Primary.ReloadSound  = Sound ("weapons/shared/standard_reload.ogg")
SWEP.Primary.Recoil			= 2.5
SWEP.Primary.Damage			= 125
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.010
SWEP.Primary.IronAccuracy = .005	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 1
SWEP.Primary.RPM = 60/1
SWEP.Primary.DefaultClip	= 3
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "rpg_round"

SWEP.ProjectileEntity = "dc17m_at_rocket2" --Entity to shoot
SWEP.ProjectileVelocity = 500 --Entity to shoot's velocity

SWEP.UseHands = true

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos 			= Vector (-3.9, -6, 2.5)
SWEP.IronSightsAng 			= Vector (-0.3, -0.05, 0)
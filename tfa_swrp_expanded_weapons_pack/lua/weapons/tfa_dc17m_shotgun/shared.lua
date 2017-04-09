

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "DC-17m Shotgun"			
	SWEP.Author				= "Servius"
	SWEP.ViewModelFOV      	= 50
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/DC17M_BR")
	
	killicon.Add( "weapon_752_dc17m_br", "HUD/killicons/DC17M_BR", Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType				= "ar2"
SWEP.Base					= "tfa_swsft_base_servius"

SWEP.Category = "TFA Star Wars"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel				= "models/weapons/v_dc17m_at.mdl"
SWEP.WorldModel				= "models/weapons/w_dc17m_at.mdl"

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound = Sound ("weapons/DLT19_fire.wav");
SWEP.Primary.ReloadSound = Sound ("weapons/DLT19_reload.wav");



SWEP.Primary.Recoil			= 0.9
SWEP.Primary.Damage			= 10
SWEP.Primary.NumShots		= 6
SWEP.Primary.Spread			= 0.05
SWEP.Primary.IronAccuracy = .005	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 20
SWEP.Primary.RPM = 12/0.13125
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "ar2"
SWEP.TracerName = "effect_sw_laser_blue"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos 			= Vector (-4.7, -6, 0.3)
SWEP.IronSightsAng 			= Vector (0.25,0,0)

function SWEP:Think()	
	local ClipPercentage = ((100/self.Primary.ClipSize)*self.Weapon:Clip1());
	
	if (ClipPercentage < 1) then
		self.Owner:GetViewModel():SetSkin( 10 )
		return
	end
	if (ClipPercentage < 11) then
		self.Owner:GetViewModel():SetSkin( 9 )
		return
	end
	if (ClipPercentage < 21) then
		self.Owner:GetViewModel():SetSkin( 8 )
		return
	end
	if (ClipPercentage < 31) then
		self.Owner:GetViewModel():SetSkin( 7 )
		return
	end
	if (ClipPercentage < 41) then
		self.Owner:GetViewModel():SetSkin( 6 )
		return
	end
	if (ClipPercentage < 51) then
		self.Owner:GetViewModel():SetSkin( 5 )
		return
	end
	if (ClipPercentage < 61) then
		self.Owner:GetViewModel():SetSkin( 4 )
		return
	end
	if (ClipPercentage < 71) then
		self.Owner:GetViewModel():SetSkin( 3 )
		return
	end
	if (ClipPercentage < 81) then
		self.Owner:GetViewModel():SetSkin( 2 )
		return
	end
	if (ClipPercentage < 91) then
		self.Owner:GetViewModel():SetSkin( 1 )
		return
	end
	if (ClipPercentage < 101) then
		self.Owner:GetViewModel():SetSkin( 0 )
	end
end

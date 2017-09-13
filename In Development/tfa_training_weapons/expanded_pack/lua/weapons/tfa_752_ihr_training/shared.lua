if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end
if ( CLIENT ) then
	SWEP.PrintName			= "Imperial Heavy Repeater"			
	SWEP.Author				= "TFA, Servius"
	SWEP.ViewModelFOV      	= 50
	SWEP.Slot				= 2
	SWEP.SlotPos			= 3
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/killicons/IHR")
	killicon.Add( "tfa_752_ihr", "HUD/killicons/IHR", Color( 255, 80, 0, 255 ) )
end
SWEP.HoldType				= "ar2"
SWEP.Base					= "tfa_swsft_base_servius_training"
SWEP.Category = "TFA Star Wars: Training"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.ViewModel = "models/weapons/v_IHR.mdl"
SWEP.WorldModel = "models/weapons/w_IHR.mdl"
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Primary.Sound = Sound ("weapons/ihr/IHR_fire.ogg");
SWEP.Primary.ReloadSound = Sound ("weapons/shared/standard_reload.ogg");
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 40
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.08
SWEP.Primary.IronAccuracy = .03	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 45
SWEP.Primary.RPM = 425
--= 180
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "battery"
SWEP.TracerName = "effect_sw_laser_yellow"
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.IronSightsPos 			= Vector (-4.7, -6, 0.3)
SWEP.IronSightsAng 			= Vector (-1,0,0)
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
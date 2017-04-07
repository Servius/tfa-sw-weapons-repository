

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "Repeating Blaster T2"			
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

SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 56
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.WorldModel = "models/weapons/w_dc15sa.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.UseHands = true

SWEP.ViewModelBoneMods = {
	["v_weapon.awm_parent"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(2.036, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Finger01"] = { scale = Vector(1.052, 1.052, 1.052), pos = Vector(-0.186, 0.555, 0), angle = Angle(3.332, 0, 0) },
	["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(0.961, 0.961, 0.961), pos = Vector(0.925, -2.037, -6.112), angle = Angle(18.888, 0, 0) },
	["ValveBiped.Bip01_L_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0.185, 0.185, 0.185), angle = Angle(21.111, 0, 0) },
	["ValveBiped.Bip01_L_Finger0"] = { scale = Vector(1.09, 1.09, 1.09), pos = Vector(0, 0, 0.555), angle = Angle(7.777, 0, 0) }
}

SWEP.Primary.Sound = Sound ("weapons/synbf3/dlt19_fire.wav");
SWEP.Primary.ReloadSound = Sound ("weapons/DC15A_reload.wav");

SWEP.Primary.KickUp			= 2

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Recoil			= 0.1
SWEP.Primary.Damage			= 45
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.0125
SWEP.Primary.IronAccuracy = .001	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.ClipSize		= 50
SWEP.Primary.RPM = 60/0.175
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"
SWEP.TracerName = "effect_sw_laser_red"

SWEP.SelectiveFire		= true --Allow selecting your firemode?
SWEP.DisableBurstFire	= false --Only auto/single?
SWEP.OnlyBurstFire		= false --No auto, only burst/single?
SWEP.DefaultFireMode 	= "single" --Default to auto or whatev
SWEP.FireModeName = nil --Change to a text value to override it

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.Secondary.IronFOV = 70

SWEP.IronSightsPos = Vector(-8, -4, 1.429)
SWEP.IronSightsAng = Vector(0, 3.517, 3.517)

SWEP.VElements = {
	["element_scope"] = { type = "Model", model = "models/rtcircle.mdl", bone = "v_weapon.awm_parent", rel = "element_gun", pos = Vector(10.5, -1.28, 4.76), angle = Angle(0, 0, -90), size = Vector(0.239, 0.239, 0.239), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {} },
	["element_gun"] = { type = "Model", model = "models/w_rptnblstr_002.mdl", bone = "v_weapon.awm_parent", rel = "", pos = Vector(-0.519, -2.597, -5.715), angle = Angle(87.662, -1.17, -85.325), size = Vector(0.95, 0.95, 0.95), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["element_gun"] = { type = "Model", model = "models/w_rptnblstr_002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.869, 0.518, -3.701), angle = Angle(12.857, 180, -180), size = Vector(0.788, 0.788, 0.788), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.BlowbackVector = Vector(0,-3,0.025)
SWEP.Blowback_Only_Iron  = false

SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2.5

local function  drawFilledCircle( x, y, radius, seg )
	local kirkle = {}

	table.insert(kirkle, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert(kirkle, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 ) -- This is need for non absolute segment counts
	table.insert(kirkle, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 0.5 + 0.4, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly(kirkle)
end
	
local weaponcol = Color(0.435*255,0.10*255,0.7*255,255)

local ceedee = {}

SWEP.RTMaterialOverride = -1 --the number of the texture, which you subtract from GetAttachment

SWEP.RTOpaque = true

local g36
if surface then
	g36 = surface.GetTextureID("scope/gdcw_nvgilluminatedduplex") --the texture you vant to use
end

SWEP.RTCode = function( self, mat )
	
	render.OverrideAlphaWriteEnable( true, true)
	surface.SetDrawColor(color_white)
	surface.DrawRect(-256,-256,512,512)
	render.OverrideAlphaWriteEnable( true, true)
	
	local ang = self.Owner:EyeAngles()
	
	local AngPos = self.Owner:GetViewModel():GetAttachment(1)
	
	if AngPos then
	
		ang = AngPos.Ang
		
		ang:RotateAroundAxis(ang:Right(), 3.3)
		ang:RotateAroundAxis(ang:Up(), 0.2)

	end
	

	
	ceedee.angles = ang
	ceedee.origin = self.Owner:GetShootPos()
	
	ceedee.x = 0
	ceedee.y = 0
	ceedee.w = 512	
	ceedee.h = 512
	ceedee.fov = 5
	ceedee.drawviewmodel = false
	ceedee.drawhud = false
	
	
	if self.CLIronSightsProgress>0.01 then
		render.RenderView(ceedee)
	end
		
	render.OverrideAlphaWriteEnable( false, true)
	
	
	cam.Start2D()
		draw.NoTexture()
		surface.SetDrawColor(ColorAlpha(color_black,0))
		surface.DrawTexturedRect(0,0,512,512)
		surface.SetDrawColor(color_white)
		surface.SetTexture(g36)
		surface.DrawTexturedRect(-256,-256,1024,1024)
		draw.NoTexture()
		surface.SetDrawColor(ColorAlpha(color_black,(1-self.CLIronSightsProgress)*255))
		surface.DrawTexturedRect(0,0,512,512)
	cam.End2D()
	
end
--[[

SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.WorldModel = "models/weapons/w_dc15sa.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["v_weapon.awm_parent"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(2.036, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Finger01"] = { scale = Vector(1.052, 1.052, 1.052), pos = Vector(-0.186, 0.555, 0), angle = Angle(3.332, 0, 0) },
	["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(0.961, 0.961, 0.961), pos = Vector(0.925, -2.037, -6.112), angle = Angle(18.888, 0, 0) },
	["ValveBiped.Bip01_L_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0.185, 0.185, 0.185), angle = Angle(21.111, 0, 0) },
	["ValveBiped.Bip01_L_Finger0"] = { scale = Vector(1.09, 1.09, 1.09), pos = Vector(0, 0, 0.555), angle = Angle(7.777, 0, 0) }
}


SWEP.IronSightsPos = Vector(-8.12, -10.12, 1.429)
SWEP.IronSightsAng = Vector(0, 3.517, 3.517)
SWEP.VElements = {
	["element_scope"] = { type = "Model", model = "models/rtcircle.mdl", bone = "v_weapon.awm_parent", rel = "element_gun", pos = Vector(10.5, -1.28, 4.76), angle = Angle(0, 0, 0), size = Vector(0.239, 0.239, 0.239), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {} },
	["element_gun"] = { type = "Model", model = "models/w_rptnblstr_002.mdl", bone = "v_weapon.awm_parent", rel = "", pos = Vector(-0.519, -2.597, -5.715), angle = Angle(87.662, -1.17, -85.325), size = Vector(0.95, 0.95, 0.95), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["element_gun"] = { type = "Model", model = "models/w_rptnblstr_002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.869, 0.518, -3.701), angle = Angle(12.857, 180, -180), size = Vector(0.788, 0.788, 0.788), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
]]
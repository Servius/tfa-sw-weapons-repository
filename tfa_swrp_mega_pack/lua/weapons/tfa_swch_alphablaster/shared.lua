SWEP.PrintName			= "WESTAR-M5"			
SWEP.Author				= "TFA"
SWEP.ViewModelFOV      	= 56
SWEP.Slot				= 2
SWEP.HoldType				= "ar2"
SWEP.Base					= "tfa_swsft_base"
SWEP.Instructions				= "This gun is called 'WESTAR M5' not WEST-AR-M5. This is for the idiots that have been saying its the latter of the two." --Instructions Tooltip

SWEP.Category = "TFA Star Wars"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel				= "models/weapons/cstrike/c_rif_famas.mdl"
SWEP.WorldModel				= "models/weapons/w_irifle.mdl"

SWEP.Primary.Sound = Sound ("weapons/DC15A_fire.wav");
SWEP.Primary.ReloadSound = Sound ("weapons/DC15A_reload.wav");

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.0125
SWEP.Primary.ClipSize		= 50
SWEP.Primary.RPM = 60/0.175
SWEP.Primary.DefaultClip	= 500
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"
SWEP.TracerName = "effect_sw_laser_blue"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.Secondary.IronFOV = 70

SWEP.IronSightsPos = Vector(-6.2, -2.56, 3.13)
SWEP.IronSightsAng = Vector(-7.217, 0.138, 0.428)

SWEP.ShowWorldModel = false
SWEP.UseHands = true

SWEP.SelectiveFire = true
SWEP.FireModes = {
	"Auto",
	"3Burst",
	"Single"
}


SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -9.122, 0) },
	["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0.855, 4.977, -0.5), angle = Angle(0, 0, 0) },
	["v_weapon.famas"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10.965, 0.958, 0) }
}

SWEP.VElements = {
	["rtlense"] = { type = "Model", model = "models/rtcircle.mdl", bone = "v_weapon.famas", rel = "", pos = Vector(0.079, -3.931, 8.862), angle = Angle(-90, 0, 0.929), size = Vector(0.4, 0.4, 0.4), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {} },
	["element_name"] = { type = "Model", model = "models/weapons/w_alphablaster.mdl", bone = "v_weapon.famas", rel = "", pos = Vector(0, 0, 17.226), angle = Angle(-0.541, -2.112, -97.883), size = Vector(0.864, 0.864, 0.864), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/weapons/w_alphablaster.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.083, 1.235, -3.258), angle = Angle(0, -90, 166.97), size = Vector(0.848, 0.848, 0.848), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


local ceedee = {}


SWEP.RTOpaque = true

SWEP.RTMaterialOverride = -1 --the number of the texture, which you subtract from GetAttachment

local g36
if surface then
	g36 = surface.GetTextureID("scope/gdcw_green_nobar") --the texture you vant to use
end

SWEP.RTCode = function( self, mat )
	
	render.OverrideAlphaWriteEnable( true, true)
	surface.SetDrawColor(color_white)
	surface.DrawRect(-256,-256,512,512)
	render.OverrideAlphaWriteEnable( true, true)
	
	local ang = self.Owner:EyeAngles()
	ang:RotateAroundAxis(ang:Forward(),-90)
	ceedee.angles = ang
	ceedee.origin = self.Owner:GetShootPos()
	
	ceedee.x = 0
	ceedee.y = 0
	ceedee.w = 512	
	ceedee.h = 512
	ceedee.fov = 6
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


SWEP.IronSightsSensitivity = 0.25 --Useful for a RT scope.  Change this to 0.25 for 25% sensitivity.  This is if normal FOV compenstaion isn't your thing for whatever reason, so don't change it for normal scopes.
SWEP.BlowbackVector = Vector(0,-3,0.025)
SWEP.Blowback_Only_Iron  = false

SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 2.5
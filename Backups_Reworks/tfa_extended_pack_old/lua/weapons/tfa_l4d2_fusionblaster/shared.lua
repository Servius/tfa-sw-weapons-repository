SWEP.Category				= "TFA L4D2"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "FU-BAR 69 Rev. 4"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 73			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- Set false if you want no crosshair from hip
SWEP.Weight				= 30			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.BoltAction				= false		-- Is this a bolt action rifle?
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/tfa_l4d2/c_fusionblaster.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/tfa_l4d2/w_fusionblaster.mdl"	-- Weapon world model
SWEP.UseHands = true

SWEP.Base 				= "tfa_bash_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.DisableChambering = true
SWEP.Primary.Sound			= Sound("TFA_FusionBlaster.1")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 60		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 24		-- Size of a clip
SWEP.Primary.DefaultClip			= 96	-- Bullets you start with
SWEP.Primary.KickUp				= 1.5				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 1.2			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.6		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "ar2"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun

SWEP.Primary.SpreadMultiplierMax = 9 --How far the spread can expand when you shoot.
SWEP.Primary.SpreadIncrement = 2 --What percentage of the modifier is added on, per shot.
SWEP.Primary.SpreadRecovery = 7 --How much the spread recovers, per second.

SWEP.SelectiveFire = true

SWEP.data 				= {}
SWEP.data.ironsights		= 1

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 200	--base damage per bullet
SWEP.Primary.Spread		= .01	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .0025 -- ironsight accuracy, should be the same for shotguns

SWEP.DamageType = bit.bor(DMG_BULLET,DMG_DISSOLVE,DMG_AIRBOAT)

SWEP.Secondary.IronFOV = 70

-- enter iron sight info and bone mod info below


SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -1,
        Right = 0.2,
        Forward = 0.3,
        },
        Ang = {
        Up = -2,
        Right = -5,
        Forward = 180
        },
		Scale = 1
}	

SWEP.TracerName = "tfa_tracer_fubar"
SWEP.TracerCount = 1

SWEP.MuzzleFlashEffect = "tfa_muzzleflash_fubar"

SWEP.IronSightsPos = Vector(-4.56, -6.735, 0.352)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.RunSightsPos = Vector(3.344, -5.34, -2.671)
SWEP.RunSightsAng = Vector(-20.048, 68.24, -40.635)

SWEP.InspectPos = Vector(9.519, -15.502, 0.819)
SWEP.InspectAng = Vector(42.583, 52.466, 38.472)

SWEP.NearWallSightsPos = Vector(3.344, -5.34, -2.671)-- Vector(0, -12.085, -4.237)
SWEP.NearWallSightsAng = Vector(-20.048, 68.24, -40.635)--Vector(70, 0, 0)

SWEP.BlowbackEnabled = false

SWEP.VElements = {
	["element_name"] = { type = "Quad", bone = "Scope2", rel = "", pos = Vector(-10.325, 0, 2.009), angle = Angle(0, -90, 90), size = 0.0035, draw_func = function(self)
		if !self.precache_rtmat then
			self.precache_rtmat = Material("!tfa_rtmaterial")
		end
		surface.SetMaterial(self.precache_rtmat)
		surface.DrawTexturedRect(-256,-256,512,512)
	end}
}

SWEP.Secondary.BashDelay = 0.1

local rtmod = Color(0,255,255,4)

SWEP.RTMaterialOverride = -1
SWEP.IronSightsSensitivity = 0.1

local cd = {}

local crosscol = Color(255,255,255,255)

SWEP.RTOpaque = true

SWEP.RTCode = function( self, rt, scrw, scrh )
	
	if !self.myreticule then self.myreticule = Material(self.ScopeReticule and self.ScopeReticule or "scope/gdcw_scopesightonly") end
	
	local vm = self.Owner:GetViewModel()
	
	if !self.LastOwnerPos then self.LastOwnerPos = self.Owner:GetShootPos() end
	
	local owoff = self.Owner:GetShootPos() - self.LastOwnerPos
	
	self.LastOwnerPos = self.Owner:GetShootPos()
	
	render.OverrideAlphaWriteEnable( true, true)
	surface.SetDrawColor(color_white)
	surface.DrawRect(-512,-512,1024,1024)
	render.OverrideAlphaWriteEnable( true, true)
	
	local ang = EyeAngles()
	
	cd.angles = ang
	cd.origin = self.Owner:GetShootPos()
	local rtw,rth = 512, 512
	
	cd.x = 0
	cd.y = 0
	cd.w = rtw
	cd.h = rth
	cd.fov = 5
	cd.drawviewmodel = false
	cd.drawhud = false
	
	render.Clear( 0, 0, 0, 255, true, true )
	
	render.SetScissorRect(0,0,rtw,rth,true)
	if self.CLIronSightsProgress>0.005 then
		render.RenderView(cd)
	end
	render.SetScissorRect(0,0,rtw,rth,false)
	
	render.OverrideAlphaWriteEnable( false, true)	
	
	cam.Start2D()
		draw.NoTexture()
		surface.SetDrawColor(ColorAlpha(color_black,255*(1-self.CLIronSightsProgress)))		
		surface.DrawRect(0,0,rtw,rth)
		surface.SetMaterial(self.myreticule)
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(128,128,256,256)
		surface.SetDrawColor(rtmod)
		surface.DrawRect(0,0,512,512)
	cam.End2D()
end

SWEP.FireModes = {
	"Automatic",
	"Dispersion Gun",
	"Gauss Gun"
}

SWEP.AutoMaterials = {
	"models/tfa_l4d2/fusion_blaster/main",
	"models/tfa_l4d2/fusion_blaster/bloom",
	"models/tfa_l4d2/fusion_blaster/blue_flame"
}
SWEP.GaussMaterials = {
	"models/tfa_l4d2/fusion_blaster/main_aqua",
	"models/tfa_l4d2/fusion_blaster/bloom_aqua",
	"models/tfa_l4d2/fusion_blaster/aqua_flame"
}
SWEP.DispersionMaterials = {
	"models/tfa_l4d2/fusion_blaster/main_orange",
	"models/tfa_l4d2/fusion_blaster/bloom_orange",
	"models/tfa_l4d2/fusion_blaster/orange_flame"
}

function SWEP:ClearMatCache()
	self.MaterialCache = nil
	self.MaterialCache = nil
	self.MaterialCached = nil
	self.MaterialsCache = nil
	self.MaterialsCached = nil	
end

function SWEP:UpdateMatTable(tbl)
	for k,v in pairs(tbl) do
		if v!=self.MaterialTable[k] then
			self.MaterialTable[k] = v
			self:ClearMatCache()
		end
	end
end

function SWEP:PFM()
	if IsValid(self) then
		if self.FireModes[self:GetFireMode()] == "Automatic" then
			self.Primary.RPM = 400
			self.Primary.KickUp				= 0.75				-- Maximum up recoil (rise)
			self.Primary.KickDown			= 0.5			-- Maximum down recoil (skeet)
			self.Primary.KickHorizontal		= 0.4		-- Maximum up recoil (stock)
			self.Primary.Damage = 50
			self.Primary.NumShots = 1
			self.Primary.PenetrationMultiplier = 4
			self.Primary.Spread = 0.02
			self.Primary.IronAccuracy = 0.01
			self.TracerName = "tfa_tracer_fubar_light_blu"
			self.MuzzleFlashEffect = "tfa_muzzleflash_fubar_blu"
			self:UpdateMatTable(self.AutoMaterials)
		elseif self.FireModes[self:GetFireMode()] == "Gauss Gun" then
			self.Primary.RPM = 40
			self.Primary.KickUp				= 1.5				-- Maximum up recoil (rise)
			self.Primary.KickDown			= 1.2			-- Maximum down recoil (skeet)
			self.Primary.KickHorizontal		= 0.6		-- Maximum up recoil (stock)
			self.Primary.Damage = 200
			self.Primary.NumShots = 1
			self.Primary.PenetrationMultiplier = 2
			self.Primary.Spread = 0.01
			self.Primary.IronAccuracy = 0.0025
			self.TracerName = "tfa_tracer_fubar_aq"
			self.MuzzleFlashEffect = "tfa_muzzleflash_fubar_aq"
			self:UpdateMatTable(self.GaussMaterials)
		elseif self.FireModes[self:GetFireMode()] == "Dispersion Gun" then
			self.Primary.RPM = 80
			self.Primary.KickUp				= 1.5				-- Maximum up recoil (rise)
			self.Primary.KickDown			= 1.2			-- Maximum down recoil (skeet)
			self.Primary.KickHorizontal		= 0.6		-- Maximum up recoil (stock)
			self.Primary.Damage = 20
			self.Primary.NumShots = 10
			self.Primary.Spread = 0.05
			self.Primary.IronAccuracy = 0.05
			self.Primary.PenetrationMultiplier = 1
			self.TracerName = "tfa_tracer_fubar_light"
			self.MuzzleFlashEffect = "tfa_muzzleflash_fubar"
			self:UpdateMatTable(self.DispersionMaterials)
		end		
	end
end

SWEP.Callback = SWEP.Callback or {}

SWEP.Callback.ProcessFireMode = function(self)
	if IsValid(self) then
		self:PFM()
		if SERVER then
			self:CallOnClient("PFM","")
		end
	end
end

SWEP.Callback.GetFireModeName = function(self)
	local fm = self:GetFireMode()
	local fmn = string.lower(self.FireModes[fm])
	
	if string.find(fmn,"safe") or string.find(fmn,"holster") then
		return "Safety"
	end
	
	if self.FireModeName then
		return self.FireModeName
	end
	
	if string.find(fmn,"auto") then
		return "Full-Auto"
	end
	if string.find(fmn,"single") then
		if (self.Revolver or ( (self.DefaultHoldType and self.DefaultHoldType or self.HoldType) == "revolver" ) ) then
			if (self.BoltAction) then
				return "Single-Action"
			else
				return "Double-Action"
			end
		else
			if (self.BoltAction) then
				return "Bolt-Action"
			else
				if (self.Shotgun and self.Primary.RPM<250) then
					return "Pump-Action"
				else
					return "Semi-Auto"
				end
			end
		end
	end
	local bpos = string.find(fmn,"burst")
	if bpos then
		return string.sub(fmn,1,bpos-1) .. " Round Burst"
	end
	return fmn
end

SWEP.BlowbackEnabled = true
SWEP.BlowbackVector = Vector(0,-2,0)

SWEP.MaterialTable = {}
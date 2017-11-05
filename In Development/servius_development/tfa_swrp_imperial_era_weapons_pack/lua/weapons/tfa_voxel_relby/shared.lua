SWEP.Gun					= ("tfa_voxel_relby2") --Make sure this is unique.  Specically, your folder name.
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "tfa_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Base				= "tfa_3dscoped_base"
SWEP.Category				= "TFA Imperial Era Weapons" --The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep..
SWEP.Manufacturer = "Blastech Industries" --Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Author				= "Appo" --Author Tooltip
SWEP.Contact				= "http://www.voxelservers.net/" --Contact Info Tooltip
SWEP.DrawCrosshair			= true		-- Draw the crosshair?
SWEP.DrawCrosshairIS = false --Draw the crosshair in ironsights?
SWEP.PrintName				= "Relby V-10 Mortar Gun"		-- Weapon name (Shown on HUD)
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter if enabled in the GUI.

-- Iron and Run Sights --
SWEP.data               = {}
SWEP.data.ironsights            = 1 --Enable Ironsights
SWEP.Secondary.IronFOV          = 65                    -- How much you 'zoom' in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.

SWEP.IronSightsPos = Vector(-5.96, -5, 0.98)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector (4.36,3.60,0) --Change this, using SWEP Creation Kit preferably
SWEP.RunSightsAng = Vector (-9.146,18.291,0) --Change this, using SWEP Creation Kit preferably

-- Primary Stuff --
SWEP.Primary.ReloadSound = Sound ("weapons/a35/a35_insertshell.wav");
SWEP.Primary.Sound          = Sound("weapons/a35/a35_launch.wav")               -- This is the sound of the weapon, when you shoot.
SWEP.Primary.SilencedSound          = nil               -- This is the sound of the weapon, when silenced.
SWEP.Primary.PenetrationMultiplier = 1 --Change the amount of something this gun can penetrate through
SWEP.Primary.Damage     = 0                 -- Damage, in standard damage points.
SWEP.Primary.HullSize = 0 --Big bullets, increase this value.  They increase the hull size of the hitscan bullet.
SWEP.DamageType = nil--See DMG enum.  This might be DMG_SHOCK, DMG_BURN, DMG_BULLET, etc.
SWEP.Primary.NumShots   = 1 --The number of shots the weapon fires.  SWEP.Shotgun is NOT required for this to be >1.
SWEP.Primary.Automatic          = false                 -- Automatic/Semi Auto
SWEP.Primary.RPM                = nil                   -- This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Semi               = 160                   -- RPM for semi-automatic or burst fire.  This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst              = nil                   -- RPM for burst fire, overrides semi.  This is in Rounds Per Minute / RPM
SWEP.Primary.BurstDelay             = nil                   -- Delay between bursts, leave nil to autocalculate
SWEP.FiresUnderwater = true

-- Firemode Stuff--
SWEP.SelectiveFire      = false --Allow selecting your firemode?
SWEP.DisableBurstFire   = false --Only auto/single?
SWEP.OnlyBurstFire      = false --No auto, only burst/single?
SWEP.DefaultFireMode    = "" --Default to auto or whatev
SWEP.FireModeName = nil --Change to a text value to override it

-- Ammo Stuff --
SWEP.Primary.ClipSize           = 8                 -- This is the size of a clip
SWEP.Primary.DefaultClip            = 24                    -- This is the number of bullets the gun gives you, counting a clip as defined directly above.
SWEP.Primary.Ammo           = "slam"                 -- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.
SWEP.Primary.AmmoConsumption = 1 --Ammo consumed per shot
--Pistol, buckshot, and slam like to ricochet. Use AirboatGun for a light metal peircing shotgun pellets

-- Recoil Stuff --
SWEP.Primary.KickUp         = 0.5               -- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown           = 0.25                  -- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal         = 0.5                   -- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0.5   --Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.

SWEP.Primary.Spread     = .05                   --This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .005    -- Ironsight accuracy, should be the same for shotguns

--Unless you can do this manually, autodetect it.  If you decide to manually do these, uncomment this block and remove this line.
SWEP.Primary.SpreadMultiplierMax = 2.5 --How far the spread can expand when you shoot.
SWEP.Primary.SpreadIncrement = 1/2.5 --What percentage of the modifier is added on, per shot.
SWEP.Primary.SpreadRecovery = 0.5 --How much the spread recovers, per second.

SWEP.Primary.Range = -1 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = -1 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.
SWEP.ProjectileEntity = "relby_nade"--Entity to shoot
SWEP.ProjectileVelocity = 700 --Entity to shoot's velocity
SWEP.ProjectileModel = nil --Entity to shoot's model

-- Viewmodel Stuff --
SWEP.ViewModel          = "models/weapons/cstrike/c_rif_famas.mdl" --Viewmodel path
SWEP.ViewModelFOV           = 50        -- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip          = false     -- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.MaterialTable = nil --Make sure the viewmodel and the worldmodel have the same material ids.  Next, fill this in with your desired submaterials.
SWEP.UseHands = true --Use gmod c_arms system.
SWEP.VMPos = Vector(0,0,0) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0,0,0) --The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle.
SWEP.ViewModelBoneMods = {
    ["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(2.427, 1.802, 0.259), angle = Angle(0, 0, 0) },
    ["v_weapon.famas"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}
SWEP.VElements = {
    ["models/swbf3/outerrim/weapons/relby-v10.mdl"] = { type = "Model", model = "models/swbf3/outerrim/weapons/relby-v10.mdl", bone = "v_weapon.famas", rel = "", pos = Vector(0.357, 4.2, 19.16), angle = Angle(90, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["relbyrtscope"] = { type = "Model", model = "models/rtcircle.mdl", bone = "v_weapon.famas", rel = "", pos = Vector(0.359, -4.7, 15.649), angle = Angle(-90, 270, 180), size = Vector(0.33, 0.33, 0.33), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {} }
}

-- Blowback Stuff --
SWEP.BlowbackEnabled = true --Enable Blowback?
SWEP.BlowbackVector = Vector(0,-0.5,0.1) --Vector to move bone <or root> relative to bone <or view> orientation.
SWEP.BlowbackCurrentRoot = 0 --Amount of blowback currently, for root
SWEP.BlowbackCurrent = 0 --Amount of blowback currently, for bones
SWEP.BlowbackBoneMods = nil --Viewmodel bone mods via SWEP Creation Kit
SWEP.Blowback_Only_Iron = true --Only do blowback on ironsights
SWEP.Blowback_PistolMode = false --Do we recover from blowback when empty?
SWEP.Blowback_Shell_Effect = "ShellEject"

--World Model Stuff
SWEP.WorldModel         = "models/swbf3/outerrim/weapons/relby-v10.mdl" -- Weapon world model path
SWEP.HoldType 				= "ar2"		-- This is how others view you carrying the weapon. Options include:


-- Tracer and effect stuff--
SWEP.Tracer				= 0		--Bullet tracer.  TracerName overrides this.
SWEP.TracerName 		= "vox_sw_laser_green" 	--Change to a string of your tracer name.  Can be custom.							--There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
SWEP.TracerCount 		= 0 	--0 disables, otherwise, 1 in X chance
SWEP.TracerLua 			= false --Use lua effect, TFA Muzzle syntax.  Currently obsolete.
SWEP.TracerDelay		= 0.01 --Delay for lua tracer effect
SWEP.ImpactEffect = "vox_sw_impact_2"--Impact Effect
SWEP.ImpactDecal = "FadingScorch"--Impact Decal

-- Scope Stuff--
SWEP.RTScopeAttachment = -1
SWEP.Scoped_3D = true
SWEP.ScopeReticule = "scope/gdcw_elcanreticle" 
SWEP.Secondary.ScopeZoom = 10
SWEP.ScopeReticule_Scale = {2.5,2.5}

if surface then
    SWEP.Secondary.ScopeTable = nil --[[
        {
            scopetex = surface.GetTextureID("scope/gdcw_closedsight"),
            reticletex = surface.GetTextureID("scope/gdcw_acogchevron"),
            dottex = surface.GetTextureID("scope/gdcw_acogcross")
        }
    ]]--
end
DEFINE_BASECLASS( SWEP.Base )





-- Precautionary stuff that mostly doesn't need to be edited --
SWEP.Spawnable              = true --Can you, as a normal user, spawn this?
SWEP.AdminSpawnable         = false --Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.Primary.DamageType = DMG_BULLET
SWEP.DamageType = DMG_BULLET
SWEP.ThirdPersonReloadDisable=false
SWEP.DoMuzzleFlash = false --Do a muzzle flash?
SWEP.DisableChambering = true --Disable round-in-the-chamber
SWEP.Primary.PenetrationMultiplier = 0 --Change the amount of something this gun can penetrate through

function SWEP:DrawHands()
    self.UseHandsDefault = self.UseHandsDefault or self.UseHands
    if !self.UseHandsDefault then return end
    if !IsValid(self) or !self:OwnerIsValid() then return end
    local vm = self.OwnerViewModel
    if !IsValid(vm) then return end
   
    if !IsValid(self.Owner.SWHands) then
        self.Owner.SWHands = ClientsideModel("models/weapons/c_clonearms.mdl")
        self.Owner.SWHands:SetParent(vm)
        self.Owner.SWHands:SetPos(self.Owner:GetShootPos())
        self.Owner.SWHands:SetAngles(self.Owner:EyeAngles())
        self.Owner.SWHands:AddEffects( EF_BONEMERGE )
        self.Owner.SWHands:SetNoDraw(true)
        self.Owner.SWHands.BoneMergedEnt = vm
    elseif self.Owner.SWHands:GetParent() != vm then
        self.Owner.SWHands:SetModel("models/weapons/c_clonearms.mdl")
        self.Owner.SWHands:SetParent(vm)
        self.Owner.SWHands:SetPos(self.Owner:GetShootPos())
        self.Owner.SWHands:SetAngles(self.Owner:EyeAngles())
        self.Owner.SWHands:AddEffects( EF_BONEMERGE )
    elseif self.Owner.SWHands:GetModel()!="models/weapons/c_clonearms.mdl" then
        self.Owner.SWHands:SetModel("models/weapons/c_clonearms.mdl")      
    end
   
    if self.Owner.SWHands then
        self.Owner.SWHands:DrawModel()
    end
   
    self.UseHands = false
   
end

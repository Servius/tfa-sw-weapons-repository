if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "Z6 Rotary Blaster Green"			
	SWEP.Author				= "TFA"
	SWEP.ViewModelFOV      	= 50
	SWEP.Slot				= 4
	SWEP.SlotPos			= 72	
end

SWEP.HoldType				= "crossbow"
SWEP.Base					= "tfa_swsft_base_servius"

SWEP.Category = "TFA Star Wars"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.HoldType = "crossbow"
SWEP.ViewModelFOV = 56.08040201005
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/tfa_sw_z6_v2.mdl"
SWEP.WorldModel = "models/weapons/w_z6_rotary_blaster.mdl"--"models/weapons/w_crossbow.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.UseHands = true
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_R_Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 15.312) },
	["barrel"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.VMPos = Vector(2,-2,-1)

sound.Add( {
	name = "TFA_SW_Z6.Fire",
	channel = CHAN_USER_BASE+11,
	volume = 1.0,
	level = 120,
	pitch = { 95, 110 },
	sound = "weapons/repeat-1.wav"
} )

sound.Add( {
	name = "TFA_SW_Z6.StartSpin",
	channel = CHAN_USER_BASE+12,
	volume = 1.0,
	level = 70,
	pitch = { 100, 100 },
	sound = "weapons/z6_startspin.wav"
} )

sound.Add( {
	name = "TFA_SW_Z6.StopSpin",
	channel = CHAN_USER_BASE+12,
	volume = 1.0,
	level = 70,
	pitch = { 100, 100 },
	sound = "weapons/z6_stopspin.wav"
} )

sound.Add( {
	name = "TFA_SW_Z6.Spin",
	channel = CHAN_USER_BASE+12,
	volume = 1.0,
	level = 70,
	pitch = { 100, 100 },
	sound = "weapons/z6_spin.wav"
} )

sound.Add( {
	name = "TFA_SW_Z6.Reload",
	channel = CHAN_USER_BASE+12,
	volume = 1.0,
	level = 120,
	pitch = { 95, 110 },
	sound = "weapons/DC15A_reload.wav"
} )

SWEP.Primary.Sound = Sound ("TFA_SW_Z6.Fire");
SWEP.Primary.ReloadSound = Sound ("weapons/DC15A_reload.wav");

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.01
SWEP.Primary.ClipSize		= 250
SWEP.Primary.RPM = 250
SWEP.Primary.RPM_Base = 120
SWEP.Primary.RPM_Max = 1200
SWEP.Primary.RPM_TransitionTime = 4
SWEP.Primary.DefaultClip	= 1000
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"
SWEP.TracerName = "effect_sw_laser_green"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.data = {}
SWEP.data.ironsights = 0

SWEP.BlowbackVector = Vector(0,-3,0.025)
SWEP.Blowback_Only_Iron  = false

SWEP.DoProceduralReload = true
SWEP.ProceduralReloadTime = 3

SWEP.WElements = {
	//["element_name"] = { type = "Model", model = "models/weapons/w_z6_rotary_blaster.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(20.194, 1, -8.351), angle = Angle(-21.119, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.Offset = {
	Pos = {
	Up = -8.351,
	Right = 1,
	Forward = 20.194,
	},
	Ang = {
	Up = 0,
	Right = -21.19,
	Forward = 178
	},
	Scale = 1
}

SWEP.NextSpinSound = 0

SWEP.BarrelRotation = 0
SWEP.BarrelVelocity = 0
SWEP.BarrelVelocityMax = 360*4.25
SWEP.BarrelAcceleration = SWEP.BarrelVelocityMax / SWEP.Primary.RPM_TransitionTime
SWEP.BarrelFriction = SWEP.BarrelVelocityMax / SWEP.Primary.RPM_TransitionTime * 2

local oldsh,sh,shfac,rpmfac,baracc
local rpmdif = SWEP.Primary.RPM_Max - SWEP.Primary.RPM_Base

DEFINE_BASECLASS("tfa_swsft_base_servius")

function SWEP:Deploy()
	self.BarrelRotation = 0
	self.BarrelVelocity = 0
	self.NextSpinSound = CurTime()
	return BaseClass.Deploy(self)
end

function SWEP:Think2()
	BaseClass.Think2(self)
	sh = (self.Owner:KeyDown(IN_ATTACK) and ( TFA.Enum.ReadyStatus[self:GetStatus()] or self:GetStatus() == TFA.Enum.STATUS_SHOOTING ) and not self:IsSafety() and self:Clip1() > 0)

	if oldsh == nil then
		oldsh = sh
	end

	if SERVER or (CLIENT and not game.SinglePlayer()) then
		if not oldsh and sh then
			self:EmitSound("TFA_SW_Z6.StartSpin")
			self.NextSpinSound = CurTime() + SoundDuration("weapons/z6_startspin.wav") - 0.5
		elseif oldsh and not sh then
			self:EmitSound("TFA_SW_Z6.StopSpin")
			self.NextSpinSound = CurTime() + SoundDuration("weapons/z6_stopspin.wav")
		elseif sh then
			if CurTime() > self.NextSpinSound then
				self:EmitSound("TFA_SW_Z6.Spin")
				self.NextSpinSound = CurTime() + SoundDuration("weapons/z6_spin.wav")
			end
		elseif not sh then
			self:StopSound("TFA_SW_Z6.Spin")
		end
	end

	oldsh = sh
	shfac = sh and 1 or 0
	rpmfac = sh and self.Primary.RPM_Max or self.Primary.RPM_Base
	self.Primary.RPM = math.Approach(self.Primary.RPM, rpmfac, rpmdif / self.Primary.RPM_TransitionTime * TFA.FrameTime())
	self.BarrelVelocity = math.Clamp(self.BarrelVelocity + (sh and self.BarrelAcceleration or -self.BarrelFriction) * TFA.FrameTime(), 0, self.BarrelVelocityMax)
	self.BarrelRotation = math.NormalizeAngle(self.BarrelRotation + self.BarrelVelocity * TFA.FrameTime())
	self.ViewModelBoneMods["barrel"].angle.p = self.BarrelRotation
end

SWEP.MoveSpeed = 0.8
DEFINE_BASECLASS("dual_base")

--[[
--ELITES
--]]

SWEP.WorldModel = "models/weapons/w_WESTAR34.mdl"

--SWEP.HoldType					= "smg"

SWEP.MuzzleEffect    			= ""
SWEP.ShellEffect				= ""
SWEP.Tracer						= "effect_sw_laser_red"

SWEP.Damage						= 50
SWEP.Force						= 5
SWEP.Spread						= Vector(0, 0, 0)
SWEP.Primary.Spread		= 0.0125
SWEP.SpreadMPenalty				= 1.1
SWEP.BurstCount					= 1
SWEP.BurstDelay					= 0.15
SWEP.Primary.NumShots			= 1
SWEP.Primary.ClipSize			= 50
SWEP.Primary.DefaultClip		= 75
SWEP.Primary.Delay				= 0.5
SWEP.Primary.Sound 			= Sound("TFA_SW_WESTAR.1")				-- This is the sound of the weapon, when you shoot.
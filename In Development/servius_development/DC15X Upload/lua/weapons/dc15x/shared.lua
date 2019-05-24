SWEP.Base							= "tfa_3dscoped_base" 

-- [[ BASIC_INFO ]]
	-- [ Spawnmenu ]
		SWEP.PrintName				= "DC-15X"
		SWEP.Category				= "TFA Star Wars"
		SWEP.Spawnable				= true
		SWEP.AdminSpawnable			= false

	-- [ HUD ]
		SWEP.DrawCrosshair			= true
		SWEP.DrawCrosshairIS 			= false
		SWEP.Manufacturer 			= ""
		SWEP.Author					= "SeNNoX, Servius, Venator"
		SWEP.Purpose				= ""
		SWEP.Description				= ""
		SWEP.Type 					= "Charging Test"

	-- [ Inventory ]
		SWEP.Slot					= 2
		SWEP.SlotPos				= 73
		SWEP.AutoSwitchTo			= true
		SWEP.AutoSwitchFrom			= true
		SWEP.Weight					= 30

-- [[ WEAPON_HANDLING ]]
	-- [ Shooting ]
		SWEP.Primary.PenetrationMultiplier 	= 1
		SWEP.Primary.Damage 			= 75
		SWEP.Primary.DamageTypeHandled 	= true
		SWEP.Primary.DamageType 		= 258
		SWEP.Primary.Force 			= nil
		SWEP.Primary.Knockback 		= 100
		SWEP.Primary.HullSize 			= 0
		SWEP.Primary.NumShots 		= 1
		SWEP.Primary.Automatic 		= false
		SWEP.Primary.RPM 			= 250
		SWEP.Primary.RPM_Semi 		= nil
		SWEP.Primary.RPM_Burst 		= nil
		SWEP.Primary.DryFireDelay 		= nil
		SWEP.Primary.BurstDelay 		= nil
		SWEP.FiresUnderwater 			= true
		SWEP.MaxPenetrationCounter 		= 4

	-- [ Sounds ]
		SWEP.Primary.Sound = Sound ("weapons/dc-15x/dcx_new_best.wav");
		SWEP.Primary.ReloadSound 			= Sound ("weapons/bf3/standard_reload2.ogg");
		SWEP.IronInSound 			= nil
		SWEP.IronOutSound 			= nil

	-- [ Selective_Fire ]
		SWEP.SelectiveFire 			= false
		SWEP.DisableBurstFire 			= true
		SWEP.OnlyBurstFire 			= false

	-- [ Ammo ]
		SWEP.Primary.ClipSize 			= 7
		SWEP.Primary.DefaultClip 		= 120
		SWEP.Primary.Ammo 			= "AR2"
		SWEP.Primary.AmmoConsumption 	= 1
		SWEP.DisableChambering 		= true

		SWEP.Shotgun 				= false
		SWEP.ShotgunEmptyAnim 		= false						-- Enable empty reloads on shotguns?
		SWEP.ShotgunEmptyAnim_Shell 	= true						-- Enable insertion of a shell directly into the chamber on empty reload?
		SWEP.ShellTime 				= .35

	-- [ Recoil ]
		SWEP.Primary.KickUp 			= 0.2
		SWEP.Primary.KickDown 			= 0.2
		SWEP.Primary.KickHorizontal 		= 0.2
		SWEP.Primary.StaticRecoilFactor 	= 0.5
		SWEP.IronRecoilMultiplier 		= 0.4							-- Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.

	-- [ Accuracy_and_Range ]
		SWEP.Primary.Spread 			= .035
		SWEP.Primary.IronAccuracy 		= nil
		SWEP.Primary.SpreadMultiplierMax 	= nil							-- How far the spread can expand when you shoot. Example val: 2.5
		SWEP.Primary.SpreadIncrement 	= 1/2.5							-- What percentage of the modifier is added on, per shot.  Example val: 1/3.5
		SWEP.Primary.SpreadRecovery 		= nil							-- How much the spread recovers, per second. Example val: 3
		SWEP.Primary.Range 			= -1
		SWEP.Primary.RangeFalloff 		= 0.6
		SWEP.CrouchAccuracyMultiplier 	= 0.5							-- Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate

	-- [ Blowback ]
		SWEP.BlowbackEnabled 			= true
		SWEP.BlowbackVector 			= Vector(0,-4,0)	
		SWEP.BlowbackCurrentRoot 		= 0							-- Amount of blowback currently, for root
		SWEP.BlowbackCurrent 			= 0							-- Amount of blowback currently, for bones
		SWEP.BlowbackBoneMods 		= nil							-- Viewmodel bone mods via SWEP Creation Kit
		SWEP.Blowback_Only_Iron 		= true
		SWEP.Blowback_PistolMode 		= false						-- Do we recover from blowback when empty?
		SWEP.Blowback_Shell_Enabled 	= false
		SWEP.Blowback_Shell_Effect 		= ""

	-- [ Misc ]
		SWEP.CanBeSilenced 			= true
		SWEP.Silenced 				= false

		SWEP.Akimbo 				= false
		SWEP.AnimCycle 				= 0							-- Start on the right

		SWEP.ProjectileEntity 			= nil
		SWEP.ProjectileVelocity 			= 200000
		SWEP.ProjectileModel 			= nil

		SWEP.MoveSpeed 				= 1							-- Multiply the player's movespeed by this.
		SWEP.IronSightsMoveSpeed 		= 0.8						-- Multiply the player's movespeed by this when sighting.

-- [[ COSMETIC ]]
	-- [ Viewmodel ]
		SWEP.ViewModel				= "models/servius/starwars/c_dc15x.mdl"
		SWEP.ViewModelFOV			= 65
		SWEP.ViewModelFlip			= false
		SWEP.UseHands 				= true
		SWEP.Bodygroups_V 			= nil

	-- [ Worldmodel ]
		SWEP.WorldModel				= "models/servius/starwars/w_dc15x.mdl"
		SWEP.ShowWorldModel			= true
		SWEP.Bodygroups_W 			= nil
		SWEP.HoldType 				= "ar2"
		SWEP.IronSightHoldTypeOverride 	= ""
		SWEP.SprintHoldTypeOverride 		= ""
		SWEP.Offset = {
			Pos = {
				Up = 0,
				Right = 0,
				Forward = 0
			},
			Ang = {
				Up = -1,
				Right = -2,
				Forward = 178
			},
			Scale = 1
		}
		SWEP.ThirdPersonReloadDisable 	= false

SWEP.VElements = {
	["element_name2"] = { type = "Model", model = "models/sw_battlefront/props/flashlight/flashlight.mdl", bone = "DC_15X_Rifle", rel = "", pos = Vector(1.6, 9, 1), angle = Angle(180, 90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = true  },
	["element_name"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "DC_15X_Rifle", rel = "element_name2", pos = Vector(1, 0, 0), angle = Angle(0, 0, 0), size = Vector(1.794, 1.794, 1.794), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = false  },
	["element_name1"] = { type = "Model", model = "models/rtcircle.mdl", bone = "DC_15X_Rifle", rel = "", pos = Vector(0, -6.821, 3.25), angle = Angle(0, 90, 0), size = Vector(0.449, 0.449, 0.449), color = Color(255, 255, 255, 255), surpresslightning = false,material = "!tfa_rtmaterial", skin = 0, bodygroup = {}, bonermerge = true }
}

SWEP.WElements = {
	["lazer"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0.699, 0, 0), angle = Angle(-2.8, 0, 0), size = Vector(1.21, 1.21, 1.21), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = false  },
	["element_name"] = { type = "Model", model = "models/sw_battlefront/props/flashlight/flashlight.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(20, 1.2, -6.5), angle = Angle(-8.183, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonermerge = true, active = true  }
}

	-- [ Iron_Sights ]
		SWEP.data 					= {}
		SWEP.data.ironsights 			= 1
		SWEP.Secondary.IronFOV 		= 70
		SWEP.IronSightsSensitivity 		= 1							-- 0.XX = XX%
		SWEP.BoltAction 				= false						-- Unscope/sight after you shoot?
		
		SWEP.Scoped 				= false 						-- Scope Overlay
		SWEP.ScopeOverlayThreshold 		= 0.875						-- Percentage you have to be sighted in to see the scope.
		SWEP.BoltTimerOffset 			= 0.258						-- How long you stay sighted in after shooting, with a bolt action.
		SWEP.ScopeScale 				= 0.5							-- Scale of the scope overlay
		SWEP.ReticleScale 			= 0.7							-- Scale of the reticle overlay

		SWEP.RTMaterialOverride 		= nil							-- Take the material you want out of print(LocalPlayer():GetViewModel():GetMaterials()), subtract 1 from its index, and set it to this.
		SWEP.RTOpaque 				= false						-- Do you want your render target to be opaque?
		SWEP.RTCode 				= nil							-- function(self) return end -- This is the function to draw onto your rendertarget
		SWEP.RTScopeAttachment				= -1

	SWEP.ScopeReticule 					= "scope/star_ret" 
	SWEP.Secondary.ScopeZoom 			= 6
	SWEP.ScopeReticule_Scale 			= {1.5,1.5}
	-- [ Offsets ]
		SWEP.VMPos 				= Vector(0,0,0)
		SWEP.VMAng 				= Vector(0,0,0)
		SWEP.VMPos_Additive 			= true
		SWEP.CenteredPos 			= nil
		SWEP.CenteredAng 			= nil
		SWEP.IronSightsPos = Vector(-2.961, 0, 0.959)
		SWEP.IronSightsAng = Vector(0, 0, 0)


		SWEP.InspectPos 				=  Vector(7, -3, -1)
		SWEP.InspectAng 				= Vector(15, 45, 0)

		SWEP.RunSightsPos 			= nil
		SWEP.RunSightsAng 			= nil

	-- [ Attachments ]

SWEP.Attachments = {
	[1] = { offset = { 0, 0 }, atts = { "clipexpand" }, order = 1 },
	[2] = { offset = { 0, 0 }, atts = { "lazersight2" }, order = 2 },
	[3] = { offset = { 0, 0 }, atts = { "crysismode","green_ammo_dc15x"}, order = 3 },
}
		SWEP.AttachmentDependencies 	= {}							-- {["si_acog"] = {"bg_rail"}}
		SWEP.AttachmentExclusions 		= {}
		SWEP.AllowViewAttachment 		= true

-- [[ ANIMATION ]]
	-- [ Overrides ]
		SWEP.StatusLengthOverride 		= {}							-- Changes the status delay of a given animation; only used on reloads.  Otherwise, use SequenceLengthOverride or one of the others
		SWEP.SequenceLengthOverride 		= {}													-- Changes both the status delay and the nextprimaryfire of a given animation
		SWEP.SequenceRateOverride 		= {}							-- Like above but changes animation length to a target
		SWEP.SequenceRateOverrideScaled 	= {}							-- Like above but scales animation length rather than being absolute

	-- [ Modes_and_Transitions ]
		SWEP.Sights_Mode 			= TFA.Enum.LOCOMOTION_LUA			-- ANI = mdl, HYBRID = lua but continue idle, Lua = stop mdl animation
		SWEP.Sprint_Mode 			= TFA.Enum.LOCOMOTION_LUA			-- ANI = mdl, HYBRID = ani + lua, Lua = lua only
		SWEP.Idle_Mode 				= TFA.Enum.IDLE_BOTH				-- TFA.Enum.IDLE_DISABLED = no idle, TFA.Enum.IDLE_LUA = lua idle, TFA.Enum.IDLE_ANI = mdl idle, TFA.Enum.IDLE_BOTH = TFA.Enum.IDLE_ANI + TFA.Enum.IDLE_LUA
		SWEP.Idle_Blend 				= 0.25						-- Start an idle this far early into the end of a transition
		SWEP.Idle_Smooth 			= 0.05						-- Start an idle this far early into the end of another animation

	-- [ Event Table ]
		SWEP.EventTable 	= {}

	-- [ Sequences ]
		SWEP.IronAnimation = {
			["in"] = {
				["type"] = TFA.Enum.ANIMATION_SEQ,					-- Sequence or act
				["value"] = "Idle_To_Iron",							-- Number for act, String/Number for sequence
				["value_empty"] = "Idle_To_Iron_Dry",
				["transition"] = true
			},
			["loop"] = {
				["type"] = TFA.Enum.ANIMATION_SEQ,					-- Sequence or act
				["value"] = "Idle_Iron",							-- Number for act, String/Number for sequence
				["value_empty"] = "Idle_Iron_Dry"
			},
			["out"] = {
				["type"] = TFA.Enum.ANIMATION_SEQ,					-- Sequence or act
				["value"] = "Iron_To_Idle",							-- Number for act, String/Number for sequence
				["value_empty"] = "Iron_To_Idle_Dry",
				["transition"] = true
			},
			["shoot"] = {
				["type"] = TFA.Enum.ANIMATION_SEQ,					-- Sequence or act
				["value"] = "Fire_Iron",							-- Number for act, String/Number for sequence
				["value_last"] = "Fire_Iron_Last",
				["value_empty"] = "Fire_Iron_Dry"
			}
		}

		SWEP.SprintAnimation = {
			["in"] = {
				["type"] = TFA.Enum.ANIMATION_SEQ,					-- Sequence or act
				["value"] = "Idle_to_Sprint",						-- Number for act, String/Number for sequence
				["value_empty"] = "Idle_to_Sprint_Empty",
				["transition"] = true
			},
			["loop"] = {
				["type"] = TFA.Enum.ANIMATION_SEQ,					-- Sequence or act
				["value"] = "Sprint_",								-- Number for act, String/Number for sequence
				["value_empty"] = "Sprint_Empty_",
				["is_idle"] = true
			},
			["out"] = {
				["type"] = TFA.Enum.ANIMATION_SEQ,					-- Sequence or act
				["value"] = "Sprint_to_Idle",						-- Number for act, String/Number for sequence
				["value_empty"] = "Sprint_to_Idle_Empty",
				["transition"] = true
			}
		}

	-- [ Procedural ]
		SWEP.DoProceduralReload 		= false
		SWEP.ProceduralReloadTime 		= 1

		SWEP.ProceduralHoslterEnabled 	= nil
		SWEP.ProceduralHolsterTime 		= 0.3
		SWEP.ProceduralHolsterPos 		= Vector(3, 0, -5)
		SWEP.ProceduralHolsterAng	 	= Vector(-40, -30, 10)

-- [[ EFFECTS ]]
	-- [ Attachments ]
		SWEP.MuzzleAttachment			= "1"						-- "1" CSS models / "muzzle" hl2 models
		SWEP.ShellAttachment			= "2"						-- "2" CSS models / "shell" hl2 models
		SWEP.MuzzleFlashEnabled 		= true
		SWEP.MuzzleAttachmentRaw 		= nil							-- This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
		SWEP.AutoDetectMuzzleAttachment 	= false						-- For multi-barrel weapons, detect the proper attachment?
		SWEP.MuzzleFlashEffect 		= "tfa_muzzleflash_cryo"
		SWEP.SmokeParticle 			= nil							-- Smoke particle (ID within the PCF), defaults to something else based on holdtype; "" to disable
		SWEP.EjectionSmokeEnabled 		= true

	-- [ Shells ]
		SWEP.LuaShellEject 			= nil
		SWEP.LuaShellEjectDelay 		= 0
		SWEP.LuaShellModel 			= nil
		SWEP.LuaShellScale 			= nil
		SWEP.LuaShellYaw 			= nil

SWEP.Tracer							= 0
SWEP.TracerName 					= "tfa_tracer_gauss"
SWEP.TracerCount 					= 1
SWEP.TracerLua 						= false
SWEP.TracerDelay					= 0.01
SWEP.ImpactEffect 					= "effect_sw_impact"
SWEP.ImpactDecal 					= "FadingScorch"

-- [[ CHARGING ]]
	-- [ Customization ]
		SWEP.OnlyFireFullyCharged = false		-- Only fires upon reaching "MaxCharge"

	-- [ Charge_Values ]
		SWEP.MinCharge = 50
		SWEP.MaxCharge = 	150
		SWEP.ChargePerFrame = 1
		SWEP.TimePerCharge = 1

	-- [ Animations ]
		SWEP.ChargingUpAnim = "Charge"
		SWEP.ChargingDownAnim = "Charge"

	-- [ Damage ]
		SWEP.MinChargeDMG = 75
		SWEP.MaxChargeDMG = 150

	-- [ Sound ]
		SWEP.ChargingUpSound = Sound ("weapons/dc-15x/charge.wav");			-- Automatically plays while charging the weapon
		SWEP.ChargeDownSound = Sound("weapons/dc-15x/charge_down.wav")	-- Plays if you let go before reaching "MinCharge"
		SWEP.FullyChargedSound = Sound("weapons/dc-15x/click_high.wav")		-- Plays upon reaching "MaxCharge"
		SWEP.ReadySound = Sound("weapons/dc-15x/click_low.wav")			-- Plays upon reaching "MinCharge"

-- [[ FUNCTIONS ]]
	DEFINE_BASECLASS( SWEP.Base )

	function SWEP:Initialize()
		hook.Add( "KeyRelease", self, self.ReleaseHook )

		self:ResetCharge()

		if self.ChargingUpSound then
			self.LoopingSound = CreateSound( self, self.ChargingUpSound)
		end

		BaseClass.Initialize(self)
	end

	function SWEP:ResetCharge()
		self.ChargeAnimationStarted = false
		self.PlayedReadySound = false
		self:SetNWFloat( "Charge", 0 )
		self:SetNWBool( "Holding", false )
		self:SetNWBool( "FullyCharged", false )
	end

	function SWEP.ReleaseHook( ent, ply, key )
		if ent:GetOwner() == ply and key == 1 then
			if !ent:IsValid() then return end
			if !ent:GetNWBool( "Holding" ) then return end
			ent:Release()
		end	
	end

	function SWEP:Release()
		self:SendViewModelSeq( self.ChargingDownAnim, 2, true, 1.5 )

		if self:GetNWFloat( "Charge" ) >= self.MinCharge then
			BaseClass.PrimaryAttack(self)
		else
			if SERVER and self.ChargeDownSound then
				self:GetOwner():EmitSound( self.ChargeDownSound )
			end
		end


		if self.LoopingSound then
			timer.Simple(0.05, function()
				if !self:IsValid() then return end
				self.LoopingSound:Stop()
			end)
		end

		self:ResetCharge()
		self:SetNextPrimaryFire(CurTime() + self.TimePerCharge)
	end

	function SWEP:PrimaryAttack()
		if !self:IsValid() then return end
		if ( !self:CanPrimaryAttack() ) then return end
		self:SetNextPrimaryFire(CurTime() + self.TimePerCharge)
		if SERVER then
			if !self:GetNWBool( "Holding" ) then
				self:SetNWBool( "Holding", true )
				self:SetNWFloat( "Charge", 0 )
			end
		end
	end

	function SWEP:Think()
		if !self:IsValid() then return false end

		if CLIENT then
			if self:GetNWBool( "Holding" ) and self:GetNWFloat( "Charge" ) < self.MaxCharge then			
				if self.LoopingSound and !self.LoopingSound:IsPlaying() then
					self.LoopingSound:Play()
				end
			end
		end

		if self:GetNWBool( "Holding" ) and self:GetNWFloat( "Charge" ) < self.MaxCharge then			
			if self.ChargingUpAnim and !self.ChargeAnimationStarted then
				self.ChargeAnimationStarted = true
				self:SendViewModelSeq( self.ChargingUpAnim, nil, nil, -CurTime() )
			end

			self:SetNWFloat( "ChargeDamage", Lerp( (self:GetNWFloat("Charge")-self.MinCharge)/(self.MaxCharge-self.MinCharge), self.MinChargeDMG, self.MaxChargeDMG))
			self:SetNWFloat( "Charge", self:GetNWFloat( "Charge" ) + self:GetStat("ChargePerFrame") )
		end

		if !self.OnlyFireFullyCharged and self.ReadySound and (self:GetNWFloat( "Charge" ) >= self.MinCharge) and (self.MinCharge ~= 0) and (!self.PlayedReadySound) then
			self.PlayedReadySound = true
			if SERVER then
				self:GetOwner():EmitSound( self.ReadySound )
			end
		end

		if self:GetNWFloat( "Charge" ) >= self.MaxCharge and !self:GetNWBool( "FullyCharged" ) then
			self:SetNWBool( "FullyCharged", true )

			if self.FullyChargedSound and SERVER then
				self:GetOwner():EmitSound( self.FullyChargedSound )
			end
		end
		
		BaseClass.Think(self)
	end

	function SWEP:PreHolster()
		if !self:IsValid() then return end
		if self.LoopingSound then
			self.LoopingSound:Stop()
		end

		self:ResetCharge()
	end

	function SWEP:OnDrop()
		if !self:IsValid() then return end
		self:PreHolster()
	end

	function SWEP:OnRemove()
		if !self:IsValid() then return end
		self:PreHolster()
	end

	function SWEP:OwnerChanged()
		if !self:IsValid() then return end
		self:PreHolster()
	end

	-- Damage Fix
	function SWEP:ShootBulletInformation()
		local cv_dmg_mult = GetConVar("sv_tfa_damage_multiplier")
		local cv_dmg_mult_min = GetConVar("sv_tfa_damage_mult_min")
		local cv_dmg_mult_max = GetConVar("sv_tfa_damage_mult_max")
		local dmg, con, rec

		self:UpdateConDamage()
		self.lastbul = nil
		self.lastbulnoric = false
		self.ConDamageMultiplier = cv_dmg_mult:GetFloat()
		if not IsFirstTimePredicted() then return end
		con, rec = self:CalculateConeRecoil()
		local tmpranddamage = math.Rand(cv_dmg_mult_min:GetFloat(), cv_dmg_mult_max:GetFloat())
		local basedamage = self.ConDamageMultiplier * self:GetNWFloat("ChargeDamage")
		dmg = basedamage * tmpranddamage
		local ns = self:GetStat("Primary.NumShots")
		local clip = (self:GetStat("Primary.ClipSize") == -1) and self:Ammo1() or self:Clip1()
		ns = math.Round(ns, math.min(clip / self:GetStat("Primary.NumShots"), 1))
		self:ShootBullet(dmg, rec, ns, con)
	end
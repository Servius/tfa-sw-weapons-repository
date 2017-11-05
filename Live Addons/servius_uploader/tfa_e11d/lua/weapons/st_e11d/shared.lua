
SWEP.PrintName			= "E-11D"			
SWEP.Author				= "Syntax_Error752, Swept, and Servius"
SWEP.ViewModelFOV      	= 50
SWEP.Slot				= 2
SWEP.SlotPos			= 3
SWEP.VElements = {
	["gun"] = { type = "Model", model = "models/farena/weapons/w_e-11d.mdl", bone = "v_thompson.torus", rel = "", pos = Vector(7.749, 1.853, -2.774), angle = Angle(-3.638, -16.073, 180), size = Vector(1.167, 1.167, 1.167), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.ViewModelBoneMods = {
	["v_thompson.torus"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.HoldType				= "ar2"
SWEP.Base					= "tfa_gun_base"

SWEP.Category				= "Throneco StarWars"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel				= "models/weapons/v_dc15a.mdl"
SWEP.WorldModel				= "models/farena/weapons/w_e-11d.mdl"

SWEP.Primary.Sound			= Sound ("Weapon_E11D.Single")
SWEP.Primary.ReloadSound = Sound("e11d-r.wav")

SWEP.DisableChambering = true

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.SelectiveFire = true

function SWEP:ShootBullet( damage, num_bullets, aimcone )
	local bullet = {} 
	bullet.Num = self.Primary.NumShots
	bullet.Src = self.Owner:GetShootPos() 
	bullet.Dir = self.Owner:GetAimVector() 
	bullet.Spread = Vector( self.Primary.Spread, self.Primary.Spread, self.Primary.Spread)
	bullet.Tracer = 1
	bullet.TracerName = "effect_sw_laser_red"
	bullet.Force = 0
	bullet.Damage = self.Primary.Damage 
	bullet.AmmoType = self.Primary.Ammo
	self:ShootEffects()
	self.Owner:FireBullets( bullet )
end

SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 75
SWEP.Primary.NumShots		= 1
SWEP.Primary.Spread			= 0.02
SWEP.Primary.ClipSize		= 60
SWEP.Primary.RPM			= 300
SWEP.Primary.DefaultClip	= 180
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"


SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos = Vector(-4.52, 0, 0.079)
SWEP.IronSightsAng = Vector(2.7, 0.3, 0)
SWEP.SightsPos = Vector(-4.52, 0, 0.079)
SWEP.SightsAng = Vector(2.7, 0.3, 0)
SWEP.Secondary.IronFOV = 55
SWEP.Primary.IronAccuracy = 0.001
SWEP.RunSightsPos = Vector(7.719, -6.52, -0.681)
SWEP.RunSightsAng = Vector(-4.7, 67.599, 0)

--crotch fixing stuff
SWEP.Pos = Vector(0, 20, -5)
SWEP.Ang = Angle(0, 0, 0)

function SWEP:CreateWorldModel()
   if not self.WModel then
      self.WModel = ClientsideModel(self.WorldModel, RENDERGROUP_OPAQUE)
      self.WModel:SetNoDraw(true)
      self.WModel:SetBodygroup(1, 1)
   end
   return self.WModel
end

function SWEP:DrawWorldModel()
   local wm = self:CreateWorldModel()
   
   local bone = self.Owner:LookupBone("ValveBiped.Bip01_R_Hand")
   local pos, ang = self.Owner:GetBonePosition(bone)
		
   if bone then
      ang:RotateAroundAxis(ang:Right(), self.Ang.p)
      ang:RotateAroundAxis(ang:Forward(), self.Ang.y)
      ang:RotateAroundAxis(ang:Up(), self.Ang.r)
      wm:SetRenderOrigin(pos + ang:Right() * self.Pos.x + ang:Forward() * self.Pos.y + ang:Up() * self.Pos.z)
      wm:SetRenderAngles(ang)
      wm:DrawModel()
   end
end

function SWEP:DrawWorldModel()

	local hand, offset, rotate

	if not IsValid(self.Owner) then
		self:DrawModel()
		return
	end

	hand = self.Owner:GetAttachment(self.Owner:LookupAttachment("anim_attachment_rh"))

	offset = hand.Ang:Right() * 1 + hand.Ang:Forward() * 4 + hand.Ang:Up() * 3

	hand.Ang:RotateAroundAxis(hand.Ang:Right(), 10)
	hand.Ang:RotateAroundAxis(hand.Ang:Forward(), 10)
	hand.Ang:RotateAroundAxis(hand.Ang:Up(), 0)

	self:SetRenderOrigin(hand.Pos + offset)
	self:SetRenderAngles(hand.Ang)

	self:DrawModel()

	if (CLIENT) then
		self:SetModelScale(1,1,1)
	end
end
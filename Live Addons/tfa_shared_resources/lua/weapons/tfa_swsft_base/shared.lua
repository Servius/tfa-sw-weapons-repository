DEFINE_BASECLASS("tfa_gun_base")
SWEP.TracerCount = 1
SWEP.MuzzleFlashEffect = ""
SWEP.TracerName = "effect_sw_laser_red"
SWEP.Secondary.IronFOV = 70
SWEP.Primary.KickUp = 0.2
SWEP.Primary.KickDown = 0.1
SWEP.Primary.KickHorizontal = 0.1
SWEP.Primary.KickRight = 0.1
SWEP.DisableChambering = true

SWEP.ImpactDecal = "FadingScorch"
SWEP.RunSightsPos = Vector(2.127, 0, 1.355)
SWEP.RunSightsAng = Vector(-15.775, 10.023, -5.664)
SWEP.BlowbackEnabled = true
SWEP.BlowbackVector = Vector(0, -3, 0.1)
SWEP.Blowback_Shell_Enabled = false
SWEP.Blowback_Shell_Effect = ""
SWEP.ThirdPersonReloadDisable = false
SWEP.Primary.DamageType = DMG_SHOCK
SWEP.DamageType = DMG_SHOCK

SWEP.ImpactEffect = "effect_sw_impact" --Impact Effect
function SWEP:DrawHands()
	self.UseHandsDefault = self.UseHandsDefault or self.UseHands
	if not self.UseHandsDefault then return end
	if not IsValid(self) or not self:OwnerIsValid() then return end
	local vm = self.OwnerViewModel
	if not IsValid(vm) then return end

	if not IsValid(self.Owner.SWHands) then
		self.Owner.SWHands = ClientsideModel("models/weapons/c_clonearms.mdl")
		self.Owner.SWHands:SetParent(vm)
		self.Owner.SWHands:SetPos(self.Owner:GetShootPos())
		self.Owner.SWHands:SetAngles(self.Owner:EyeAngles())
		self.Owner.SWHands:AddEffects(EF_BONEMERGE)
		self.Owner.SWHands:SetNoDraw(true)
		self.Owner.SWHands.BoneMergedEnt = vm
	elseif self.Owner.SWHands:GetParent() ~= vm then
		self.Owner.SWHands:SetModel("models/weapons/c_clonearms.mdl")
		self.Owner.SWHands:SetParent(vm)
		self.Owner.SWHands:SetPos(self.Owner:GetShootPos())
		self.Owner.SWHands:SetAngles(self.Owner:EyeAngles())
		self.Owner.SWHands:AddEffects(EF_BONEMERGE)
	elseif self.Owner.SWHands:GetModel() ~= "models/weapons/c_clonearms.mdl" then
		self.Owner.SWHands:SetModel("models/weapons/c_clonearms.mdl")
	end

	if self.Owner.SWHands then
		self.Owner.SWHands:DrawModel()
	end

	self.UseHands = false
end
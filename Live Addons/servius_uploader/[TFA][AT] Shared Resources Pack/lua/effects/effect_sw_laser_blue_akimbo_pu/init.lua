TRACER_FLAG_USEATTACHMENT = 0x0002
SOUND_FROM_WORLD = 0
CHAN_STATIC = 6
EFFECT.Life = 1
EFFECT.Speed = 6500
EFFECT.Length = 64
--EFFECT.WhizSound			= Sound( "nomad/whiz.wav" );		-- by Robinhood76 (http:--www.freesound.org/people/Robinhood76/sounds/96556/)
EFFECT.WhizDistance = 72
local MaterialMain = Material("effects/sw_laser_blue_main")
local MaterialFront = Material("effects/sw_laser_blue_front")

function EFFECT:Init(data)
	self.Position = data:GetStart()
	self.WeaponEnt = data:GetEntity()
	self.WeaponEntOG = data:GetEntity()
	self.Attachment = data:GetAttachment()
	local owent

	if IsValid(self.WeaponEnt) then
		owent = self.WeaponEnt.Owner or self.WeaponEnt:GetOwner()

		if not IsValid(owent) then
			owent = self.WeaponEnt:GetParent()
		end
	end

	if IsValid(owent) and owent:IsPlayer() then
		if owent ~= LocalPlayer() or owent:ShouldDrawLocalPlayer() then
			self.WeaponEnt = owent:GetActiveWeapon()
			if not IsValid(self.WeaponEnt) then return end
		else
			self.WeaponEnt = owent:GetViewModel()
			local theirweapon = owent:GetActiveWeapon()

			if IsValid(theirweapon) and theirweapon.ViewModelFlip or theirweapon.ViewModelFlipped then
				self.Flipped = true
			end

			if not IsValid(self.WeaponEnt) then return end
		end
	end

	if IsValid(self.WeaponEntOG) and self.WeaponEntOG.MuzzleAttachment then
		self.Attachment = self.WeaponEnt:LookupAttachment(self.WeaponEntOG.MuzzleAttachment)

		if not self.Attachment or self.Attachment <= 0 then
			self.Attachment = 1
		end

		if self.WeaponEntOG.Akimbo then
			if game.SinglePlayer() then
				self.WeaponEntOG.AnimCycle = self.WeaponEntOG:GetNW2Int("AnimCycle") or 0
			end
			self.Attachment = 1 + self.WeaponEntOG.AnimCycle
		end
	end

	local angpos

	if IsValid(self.WeaponEnt) then
		angpos = self.WeaponEnt:GetAttachment(self.Attachment)
	end

	if not angpos or not angpos.Pos then
		angpos = {
			Pos = bvec,
			Ang = uAng
		}
	end

	if self.Flipped then
		local tmpang = (self.Dir or angpos.Ang:Forward()):Angle()
		local localang = self.WeaponEnt:WorldToLocalAngles(tmpang)
		localang.y = localang.y + 180
		localang = self.WeaponEnt:LocalToWorldAngles(localang)
		--localang:RotateAroundAxis(localang:Up(),180)
		--tmpang:RotateAroundAxis(tmpang:Up(),180)
		self.Dir = localang:Forward()
	end

	-- Keep the start and end Pos - we're going to interpolate between them
	if IsValid(owent) and self.Position:Distance(owent:GetShootPos()) > 72 then
		self.WeaponEnt = nil
	end

	self.StartPos = self:GetTracerShootPos(self.WeaponEnt and angpos.Pos or self.Position, self.WeaponEnt, self.Attachment)
	self.EndPos = data:GetOrigin()
	self.Entity:SetRenderBoundsWS(self.StartPos, self.EndPos)
	self.Normal = (self.EndPos - self.StartPos):GetNormalized()
	self.StartTime = 0
	self.LifeTime = self.Life
	self.data = data
	self.rot = nil
	weapon = data:GetEntity()

	if (IsValid(weapon) and (not weapon:IsWeapon() or not weapon:IsCarriedByLocalPlayer())) then
		local dist, pos, time = util.DistanceToLine(self.StartPos, self.EndPos, EyePos())
	end
end

function EFFECT:Think()
	self.LifeTime = self.LifeTime - FrameTime()
	self.StartTime = self.StartTime + FrameTime()

	return self.LifeTime > 0
end

function EFFECT:Render()
	local endDistance = self.Speed * self.StartTime
	local startDistance = endDistance - self.Length
	startDistance = math.max(0, startDistance)
	endDistance = math.max(0, endDistance)
	local startPos = self.StartPos + self.Normal * startDistance
	local endPos = self.StartPos + self.Normal * endDistance
	render.SetMaterial(MaterialFront)
	render.DrawSprite(endPos, 8, 8, color_white)
	render.SetMaterial(MaterialMain)
	render.DrawBeam(startPos, endPos, 10, 0, 1, color_white)
end
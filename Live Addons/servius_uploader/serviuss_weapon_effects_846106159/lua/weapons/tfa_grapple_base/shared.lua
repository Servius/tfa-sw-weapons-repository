if SERVER then
	AddCSLuaFile()
	util.AddNetworkString( "realistic_hook BreakFree" )
end

SWEP.Base = "tfa_gun_base"

SWEP.PrintName = "Grappling Hook"
SWEP.Author = "my_hat_stinks"
SWEP.Instructions = "Fire to launch the hook"

SWEP.Spawnable = false

SWEP.Slot = 3
SWEP.SlotPos = 1

SWEP.ViewModelFOV = 80
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.ViewModelFlip   = false

SWEP.WorldModel = "models/weapons/w_alyx_gun.mdl"
SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.UseHands = true

SWEP.Primary.Recoil = 1
SWEP.Primary.Damage = 5
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0
SWEP.Primary.Delay = 0.05

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "hatshook_ammo"
SWEP.Primary.ClipMax = -1

SWEP.Secondary.ClipSize = 8
SWEP.Secondary.DefaultClip = 32
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.ClipMax = 32
SWEP.Secondary.Delay = 0.5

SWEP.DeploySpeed = 1.5

SWEP.PrimaryAnim = ACT_VM_PRIMARYATTACK
SWEP.ReloadAnim = ACT_VM_RELOAD
SWEP.HoldType = "pistol"
		
DEFINE_BASECLASS( SWEP.Base )


--Standard swep functions--
--------------------------------------
function SWEP:SetupDataTables()
	self:NetworkVar( "Entity", 30, "Hook" )
	
	self:NetworkVar( "Int", 30, "Cooldown" )
	BaseClass.SetupDataTables(self)
end

function SWEP:Initialize()
	hook.Add( "StartCommand", self, self.ButtonHook )
	hook.Add( "PlayerBindPress", self, self.PreventHook )

	hook.Add( "SetupMove", self, self.PlayerMove )
	
	if SERVER then
		local timerName = tostring(self).." Hook Broken Cooldown"
		timer.Create( timerName, 0.1, 0, function()
			if not IsValid(self) then timer.Destroy(timerName) return end
			self:SetCooldown( math.Approach(self:GetCooldown(), 0, 2) )
		end)
	end
	
	BaseClass.Initialize( self )
end

function SWEP.ButtonHook(ent, ply, ucmd)
	if ent:GetOwner() == ply then
		if ply:GetActiveWeapon() ~= ent then return end
		if !ent:IsValid() then return end
		if IsValid( ent:GetHook() ) then
			local hk = ent:GetHook()
			if not (hk.GetHasHit and hk:GetHasHit()) then return end
			
			if SERVER then
				hk:SetDist( math.max(hk:GetDist() + (ucmd:GetMouseWheel()*10),0) )
			end
		end
	end
end

function SWEP.PreventHook(ent, ply, bind, press)
	if ent:GetOwner() == ply then
		if ply:GetActiveWeapon() ~= ent then return end
		if !ent:IsValid() then return end
		if IsValid( ent:GetHook() )  then
			if ( string.find( bind, "invnext" ) ) then return true end
			if ( string.find( bind, "invprev" ) ) then return true end
		end
	end	
end

function SWEP:SecondaryAttack()
	if self:GetStat("GrappleEnabled") then
		if IsValid(self:GetHook()) then
			if SERVER then
				if self:GetHook():GetDurability()>0 then
					self:SetCooldown( self:GetHook():GetDurability()+20 )
				else
					self:SetCooldown(10)
				end
				self:GetHook():Remove()
			end
		else
			self:HookFire()
		end
	else
		BaseClass.SecondaryAttack(self)
	end
end

function SWEP:HookFire()
	if !self:GetStat("GrappleEnabled") then return false end

	if self:GetCooldown()>0 then return end
	
	if CLIENT and (not IsFirstTimePredicted()) then return end
	
	if SERVER and !IsValid( self:GetHook() ) then
		self:LaunchHook()
	end
end

-- Handling the hook entity --
--------------------------------------
function SWEP:LaunchHook()
	if not IsValid( self.Owner ) then return end
	
	if not cvars.Bool( "hatshook_physics" ) then return self:LaunchInstant() end
	
	sound.Play( "physics/metal/metal_canister_impact_soft"..math.random(1,3)..".wav", self.Owner:GetShootPos(), 75, 100, 0.5 )
	self.Owner:ViewPunch( Angle( math.Rand(-5,-2.5), math.Rand(-2,2), 0 ) )
	
	local hk = ents.Create( "ent_realistic_hook" )
	if not IsValid(hk) then return end -- Shouldn't happen
	hk:SetPos( self.Owner:GetShootPos() - self.Owner:GetAimVector()*10 )
	local ang = self.Owner:EyeAngles()
	ang:RotateAroundAxis( ang:Up(), 90 )
	hk:SetAngles( ang )
	hk.FireVelocity = self.Owner:GetAimVector() * 500
	hk:SetOwner( self.Owner )
	hk:Spawn()
	
	self:SetHook( hk )
	hk:SetWep( self )

	self.PlayerKF = ents.Create("prop_physics")
	self.PlayerKF:SetModel("models/Combine_Helicopter/helicopter_bomb01.mdl")
	self.PlayerKF:Spawn()
	self.PlayerKF:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	self.PlayerKF:SetRenderMode(RENDERMODE_NONE)
	self.PlayerKF:DrawShadow(false)
	self.PlayerKF:PointAtEntity(self.Owner)
	self.PlayerKF:SetSolid(SOLID_NONE)
	
	local vm = self.Owner:GetViewModel(0)
	if self.Owner == self.Owner:GetViewEntity() then
		self.PlayerKF:SetPos(vm:GetAttachment(self:GetMuzzleAttachment()).Pos)
		self.PlayerKF:SetParent(vm,self:GetMuzzleAttachment())
	else
		local offsetVec = Vector( 5, -1, -5 )
		local offsetAng = Angle( 180, 90, 0 )
		
		local boneid = self.Owner:LookupBone( "ValveBiped.Bip01_R_Hand" )
		local matrix = self.Owner:GetBoneMatrix( boneid )
		local newpos = LocalToWorld( offsetVec, offsetAng, matrix:GetTranslation(), matrix:GetAngles() )

		self.PlayerKF:SetPos(newpos)
		self.PlayerKF:SetParent(self.Owner,5)
	end

	self.RopeC, self.RopeCC = constraint.Rope( self.PlayerKF, hk, 0, 0, Vector(0,0,0), Vector(0,5,0), 1000, 0, 0, 2, "cable/cable2", false)
	self.RopeCC:SetKeyValue( "Slack", 0 )
end

function SWEP:GetFilter()
	return cvars.Bool( "hatshook_hookplayers" ) and {self.Owner} or player.GetAll()
end

function SWEP:LaunchInstant()
	local tr = util.TraceLine({
		start=self.Owner:GetShootPos(),
		endpos=self.Owner:GetShootPos()+(self.Owner:GetAimVector() * cvars.Number("hatshook_speed")),
		filter=self:GetFilter()
	})
	if tr.HitSky or not tr.Hit then return end
	
	sound.Play( "physics/metal/metal_canister_impact_soft"..math.random(1,3)..".wav", self.Owner:GetShootPos(), 75, 100, 0.5 )
	self.Owner:ViewPunch( Angle( math.Rand(-10,-5), math.Rand(-4,4), 0 ) )
	
	local hk = ents.Create( "ent_realistic_hook" )
	if not IsValid(hk) then return end -- Shouldn't happen
	hk:SetPos( tr.HitPos )
	hk:SetAngles( tr.Normal:Angle() )
	hk.FireVelocity = Vector(0,0,0)
	hk:SetOwner( self.Owner )
	hk:Spawn()
	
	self:SetHook( hk )
	hk:SetWep( self )
	
	hk:PhysicsCollide( {HitEntity=tr.Entity, HitPos=tr.HitPos, HitNormal=tr.Normal} )
end

local HookCable = Material( "cable/cable2" )


-- HUD Stuff --
--------------------------------------
if CLIENT then
	surface.CreateFont( "hatshook_small", {size=15} )
	surface.CreateFont( "hatshook_large", {size=25, weight=1000} )
end

local function ShadowText( txt, font, x, y )
	draw.DrawText( txt, font, x+1, y+1, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
	draw.DrawText( txt, font, x, y, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
end

local ChargeBarCol = { White = Color(255,255,255), DefCol1 = Color(255,50,50), DefCol2 = Color(50,255,50) }
local Gradient = Material( "gui/gradient" )

local function DrawChargeBar( xpos, ypos, width, height, charge, col1, col2 )
	draw.NoTexture()
	
	surface.SetDrawColor( ChargeBarCol.White )
	surface.DrawOutlinedRect( xpos, ypos, width, height )
	
	charge = math.Clamp( charge or 50, 0, 100)
	barLen = (width-2)*(charge/100)
	render.SetScissorRect( xpos+1, ypos+1, xpos+1+barLen, (ypos+height)-1, true )
		surface.SetDrawColor( col2 or ChargeBarCol.DefCol2 )
		surface.DrawRect( xpos+1, ypos+1, width-1, height-2 )
		
		surface.SetMaterial( Gradient )
		surface.SetDrawColor( col1 or ChargeBarCol.DefCol1 )
		surface.DrawTexturedRect( xpos+1, ypos+1, width-1, height-2 )
	render.SetScissorRect( xpos+1, ypos+1, xpos+1+barLen, (ypos+height)-1, false )
	
	draw.NoTexture()
end

function SWEP:DrawHUD()
	if IsValid( self:GetHook() ) and self:GetHook():GetHasHit() then
		ShadowText( "Rope length: "..tostring(self:GetHook():GetDist()), "hatshook_small", ScrW()/2, ScrH()/2+40 )
		ShadowText( (input.LookupBinding("invnext") or "[SCROLL DOWN]"):upper() .. " - Retract rope", "hatshook_small", ScrW()/2, ScrH()/2+70 )
		ShadowText( (input.LookupBinding("invprev") or "[SCROLL UP]"):upper() .. " - Extend rope", "hatshook_small", ScrW()/2, ScrH()/2+85 )
		ShadowText( (input.LookupBinding("+attack2") or "[SECONDARY FIRE]"):upper() .. " - Break rope", "hatshook_small", ScrW()/2, ScrH()/2+100 )
		
		if IsValid( self:GetHook():GetTargetEnt() ) and self:GetHook():GetTargetEnt():IsPlayer() then
			DrawChargeBar( (ScrW()/2)-70, (ScrH()/2)+20, 140, 15, self:GetHook():GetDurability() )
		else
			ShadowText( (input.LookupBinding("+use") or "[USE]"):upper() .. " - Jump off", "hatshook_small", ScrW()/2, ScrH()/2+115 )
		end
	elseif self:GetCooldown()>0 then
		DrawChargeBar( (ScrW()/2)-70, (ScrH()/2)+20, 140, 15, self:GetCooldown() )
	end

	BaseClass.DrawHUD( self )
end


-- Movement Handling --
--------------------------------------
local function ValidPullEnt(ent)
	if (not IsValid(ent)) or ent:IsPlayer() then return false end
	local phys = ent:GetPhysicsObject()
	
	return (not IsValid(phys)) or ((not phys:HasGameFlag(FVPHYSICS_NO_PLAYER_PICKUP)) and (phys:GetMass()<=50) and (ent.CanPickup!=false) and phys:IsMotionEnabled())
end

function SWEP:PlayerMove( ply, mv, cmd )
	if not (IsValid(self:GetHook()) and self:GetHook().GetHasHit and self:GetHook():GetHasHit()) then return end
	if not (IsValid(self.Owner) and IsValid(ply) and self.Owner:Alive() and ply:Alive()) then return end
	
	local hk = self:GetHook()
	
	if (IsValid(hk:GetTargetEnt()) and hk:GetTargetEnt()~=self and ply~=hk:GetTargetEnt() and (hk:GetTargetEnt():IsPlayer() or ValidPullEnt(hk:GetTargetEnt()))) then return end
	if (hk:GetTargetEnt()==hk or (not (ValidPullEnt(hk:GetTargetEnt()) or hk:GetTargetEnt():IsPlayer()))) and ply~=self.Owner then return end
	
	if not (ply.InVehicle and self.Owner.InVehicle) then hk:Remove() self:SetCooldown(10) return end -- What
	if ply:InVehicle() or self.Owner:InVehicle() or (not ply:Alive()) then hk:Remove() self:SetCooldown(10) return end
	
	if ply~=self.Owner then
		ply.was_pushed = {t=CurTime(),att=self.Owner}
	end
	
	if ply:KeyPressed( IN_USE ) and ply==self.Owner then
		if hk:GetPos()[3] > ply:GetShootPos()[3] then
			mv:SetVelocity( mv:GetVelocity() + Vector(0,0,300) )
		end
		
		if SERVER then self:SetCooldown(10) hk:Remove() end
	end
	
	local TargetPoint = hk:GetPos()
	local ApproachDir = (TargetPoint-ply:GetPos()):GetNormal()
	local ShootPos = self.Owner:GetShootPos() + (Vector(0,0, (self.Owner:Crouching() and 0) or (hk:GetUp()[1]>0.9 and -45) or 0))
	local Distance = hk:GetDist()
	
	if ply~=self.Owner then -- Swap direction
		TargetPoint = ShootPos
		ShootPos = ply:GetShootPos() + (Vector(0,0, (ply:Crouching() and 0) or (hk:GetUp()[1]>0.9 and -45) or 0))
		ApproachDir = (TargetPoint-ply:GetPos()):GetNormal()
	end
	
	local DistFromTarget = ShootPos:Distance( TargetPoint )
	if DistFromTarget<(Distance+5) then return end -- 5 units off actual distance
	local TargetPos = TargetPoint - (ApproachDir*Distance)
	
	local xDif = math.abs(ShootPos[1] - TargetPos[1])
	local yDif = math.abs(ShootPos[2] - TargetPos[2])
	local zDif = math.abs(ShootPos[3] - TargetPos[3])
	
	local speedMult = 3+ ( (xDif + yDif)*0.5)^1.01
	local vertMult = math.max((math.Max(300-(xDif + yDif), -10)*0.08)^1.01  + (zDif/2),0)
	if ply~=self.Owner and self.Owner:GetGroundEntity()==ply then vertMult = -vertMult end
	
	local TargetVel = (TargetPos - ShootPos):GetNormal() * 10
	TargetVel[1] = TargetVel[1]*speedMult
	TargetVel[2] = TargetVel[2]*speedMult
	TargetVel[3] = TargetVel[3]*vertMult
	local dir = mv:GetVelocity()
	
	local clamp = 50
	local vclamp = 20
	local accel = 200
	local vaccel = 30*(vertMult/50)
	
	dir[1] = (dir[1]>TargetVel[1]-clamp or dir[1]<TargetVel[1]+clamp) and math.Approach(dir[1], TargetVel[1], accel) or dir[1]
	dir[2] = (dir[2]>TargetVel[2]-clamp or dir[2]<TargetVel[2]+clamp) and math.Approach(dir[2], TargetVel[2], accel) or dir[2]
	
	if ShootPos[3]<TargetPos[3] then
		dir[3] = (dir[3]>TargetVel[3]-vclamp or dir[3]<TargetVel[3]+vclamp) and math.Approach(dir[3], TargetVel[3], vaccel) or dir[3]
		
		if vertMult>0 then self.ForceJump=ply end
	end
	
	mv:SetVelocity( dir )
end

local function ForceJump( ply )
	if not (IsValid(ply) and ply:IsPlayer()) then return end
	if not ply:OnGround() then return end
	
	local tr = util.TraceLine( {start = ply:GetPos(), endpos = ply:GetPos()+Vector(0,0,20), filter = ply} )
	if tr.Hit then return end
	
	ply:SetPos(ply:GetPos()+Vector(0,0,5) )
end

function SWEP:Think()
	local hk = self:GetHook()
	if IsValid(hk) then
		if self.RopeCC and self.RopeCC:IsValid() then
			local hk = self:GetHook()
			self.RopeCC:SetKeyValue( "length", hk:GetDist()-50 )
		end

		if self.ForceJump then
			if IsValid(self.Owner) and self.ForceJump==self.Owner then
				ForceJump( self.Owner )
			elseif IsValid( self:GetHook() ) and IsValid( self:GetHook():GetTargetEnt() ) and self.ForceJump == self:GetHook():GetTargetEnt() then
				ForceJump( self.ForceJump )
			end
			self.ForceJump = nil
		end
		if SERVER then
			self:EntityPull()
		end
	end
	BaseClass.Think(self)
end

function SWEP:EntityPull()
	local hk = self:GetHook()
	if IsValid(self.Owner) and IsValid(hk) and hk.GetTargetEnt and IsValid(hk:GetTargetEnt()) and ValidPullEnt(hk:GetTargetEnt()) then
		local ply = hk:GetTargetEnt()
		local phys = ply:GetPhysicsObject()
		if ply:IsPlayer() or (not IsValid(phys)) then return end
		
		local TargetPoint = self.Owner:GetShootPos()
		local ShootPos = ply:GetPos()
		local ApproachDir = (TargetPoint-ply:GetPos()):GetNormal()
		local Distance = hk:GetDist()
		
		local DistFromTarget = ShootPos:Distance( TargetPoint )
		if DistFromTarget<(Distance+5) then return end
		local TargetPos = TargetPoint - (ApproachDir*Distance)
		
		local xDif = math.abs(ShootPos[1] - TargetPos[1])
		local yDif = math.abs(ShootPos[2] - TargetPos[2])
		local zDif = math.abs(ShootPos[3] - TargetPos[3])
		
		local speedMult = 3+ ( (xDif + yDif)*0.5)^1.01
		local vertMult = math.max((math.Max(100-(xDif + yDif), -10)*0.1)^1.01  + (zDif/2), 0)
		if self.Owner:GetGroundEntity()==ply then vertMult = -vertMult end
		
		local TargetVel = (TargetPos - ShootPos):GetNormal() * 6 * (1 - (phys:GetMass()/50))
		TargetVel[1] = TargetVel[1]*speedMult
		TargetVel[2] = TargetVel[2]*speedMult
		TargetVel[3] = TargetVel[3]*vertMult
		local dir = ply:GetVelocity()
		
		local clamp = 50
		local vclamp = 20
		local accel = 200
		local vaccel = 40*(vertMult/50)
		
		dir[1] = (dir[1]>TargetVel[1]-clamp or dir[1]<TargetVel[1]+clamp) and math.Approach(dir[1], TargetVel[1], accel) or dir[1]
		dir[2] = (dir[2]>TargetVel[2]-clamp or dir[2]<TargetVel[2]+clamp) and math.Approach(dir[2], TargetVel[2], accel) or dir[2]
		
		if ShootPos[3]<TargetPos[3] and vertMult~=0 then
			dir[3] = (dir[3]>TargetVel[3]-vclamp or dir[3]<TargetVel[3]+vclamp) and math.Approach(dir[3], TargetVel[3], vaccel) or dir[3]
		end
		
		phys:SetVelocity( dir )
	end
end
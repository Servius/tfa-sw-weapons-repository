SWEP.Base					= "tfa_gun_base"

-- [[ GRAPPLE ]]
	-- [ Variables ]
		SWEP.GrappleEnabled			= false
		SWEP.MaxGrappleDist			= 500

		SWEP.GrappleHookSound			= "weapons/rpg/shotdown.wav"
		SWEP.GrappleHookFleshSound		= Sound("TFA.BashFlesh")

		SWEP.GrappleMoveSound			= "weapons/tripwire/ropeshoot.wav"

-- [[ FUNCTIONS ]]
	-- [ Class ]
		DEFINE_BASECLASS( SWEP.Base )

	function SWEP:Initialize()
		hook.Add( "KeyRelease", self, self.ReleaseHook )
		hook.Add( "StartCommand", self, self.ButtonHook )
		hook.Add( "PlayerBindPress", self, self.PreventHook )

		self.RopeSounds = CreateSound( self, self:GetStat("GrappleMoveSound"))
		self.RopeSounds:PlayEx(0,100)

		BaseClass.Initialize(self)
	end

	function SWEP:SetupDataTables()
		self:NetworkVar( "Int", 30, "MWScrolling" )
		self:NetworkVar( "Int", 31, "ObjectRange" )

		self:NetworkVar( "Bool", 31, "HoldingGrab" )

		self:NetworkVar( "Entity", 31, "CapturedEntity" )

		BaseClass.SetupDataTables(self)
	end

	function SWEP.ButtonHook(ent, ply, ucmd)
		if ent:GetOwner() == ply then
			if ply:GetActiveWeapon() ~= ent then return end
			if !ent:GetStat("GrappleEnabled") then return end
			if !ent:IsValid() then return end
			if ent:GetHoldingGrab() then
				ent:SetObjectRange( math.max(ent:GetObjectRange()+ucmd:GetMouseWheel()*20, 0 ) )
				ent:SetMWScrolling( ucmd:GetMouseWheel() )
			end
		end	
	end

	function SWEP.PreventHook(ent, ply, bind, press)
		if ent:GetOwner() == ply then
			if !ent:GetStat("GrappleEnabled") then return end
			if ply:GetActiveWeapon() ~= ent then return end
			if !ent:IsValid() then return end
			if ent:GetHoldingGrab() then
				if ( string.find( bind, "invnext" ) ) then return true end
				if ( string.find( bind, "invprev" ) ) then return true end
			end
		end	
	end

	function SWEP.ReleaseHook(ent, ply, key )
		if ent:GetOwner() == ply and key == IN_ATTACK2 then
			if !ent:IsValid() then return end
			if ply:GetActiveWeapon() ~= ent then return end
			if !ent:GetStat("GrappleEnabled") then return end
			ent:LetGoGrapple()
		end	
	end

	function SWEP:SecondaryAttack()
		if self:GetStat("GrappleEnabled") then
			self:ShootGrapple()
		else
			BaseClass.SecondaryAttack(self)
		end
	end

	function SWEP:ShootGrapple()
		if !self:CanPrimaryAttack() then return false end
		local ply = self:GetOwner()

		local tr = util.TraceLine( {
			start = ply:EyePos(),
			endpos = ply:EyePos() + ply:EyeAngles():Forward() * self:GetStat("MaxGrappleDist"),
			filter = function( ent ) if ( ent ~= ply ) then return true end end
		})


		if tr.Hit then
			self:SetHoldingGrab(true)
			if !SERVER then return false end
			
			local ent = tr.Entity
			self.RopeAnchor = ents.Create("prop_physics")
			self.RopeAnchor:SetPos(tr.HitPos + (tr.HitNormal*5))
			self.RopeAnchor:SetAngles(tr.HitNormal:Angle()+Angle(90,0,90))
			self.RopeAnchor:SetModel("models/props_c17/TrapPropeller_Lever.mdl")
			self.RopeAnchor:Spawn()
			self.RopeAnchor:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.RopeAnchor:DrawShadow(false)
			self.RopeAnchor:GetPhysicsObject():EnableMotion(false)
			self.RopeAnchor:SetSolid(SOLID_NONE)
			if ent:IsPlayer() or ent:IsNPC() then
				self:SetCapturedEntity(ent)
				self.RopeAnchor:SetParent(ent,tr.PhysicsBone)
			end

			if tr.MatType == MAT_FLESH or tr.MatType == MAT_ALIENFLESH then
				self.RopeAnchor:EmitSound( self:GetStat("GrappleHookFleshSound") )
			else
				self.RopeAnchor:EmitSound( self:GetStat("GrappleHookSound") )
			end

			self.PlayerKF = ents.Create("prop_physics")
			self.PlayerKF:SetModel("models/Combine_Helicopter/helicopter_bomb01.mdl")
			self.PlayerKF:Spawn()
			self.PlayerKF:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.PlayerKF:SetRenderMode(RENDERMODE_NONE)
			self.PlayerKF:DrawShadow(false)
			self.PlayerKF:PointAtEntity(self.Owner)
			self.PlayerKF:SetSolid(SOLID_NONE)
			
			local vm = ply:GetViewModel(0)
			if ply == ply:GetViewEntity() then
				self.PlayerKF:SetPos(vm:GetAttachment(self:GetMuzzleAttachment()).Pos)
				self.PlayerKF:SetParent(vm,self:GetMuzzleAttachment())
			else
				local offsetVec = Vector( 5, -1, -5 )
				local offsetAng = Angle( 180, 90, 0 )
				
				local boneid = ply:LookupBone( "ValveBiped.Bip01_R_Hand" )
				local matrix = ply:GetBoneMatrix( boneid )
				local newpos = LocalToWorld( offsetVec, offsetAng, matrix:GetTranslation(), matrix:GetAngles() )

				self.PlayerKF:SetPos(newpos)
				self.PlayerKF:SetParent(ply,5)
			end

			self:SetObjectRange( (tr.HitPos-ply:GetPos()):Length() )
			self.DefaultLength = self:GetObjectRange()

			self.RopeC, self.RopeCC = constraint.Rope(self.PlayerKF, self.RopeAnchor, 0, 0, Vector(0,0,0), Vector(0,5,0), self:GetObjectRange(), 0, 0, 2, "cable/cable2", true)
			self.RopeCC:SetKeyValue( "Slack", 0 )
	
			local effectdata = EffectData()
			effectdata:SetOrigin( self.RopeAnchor:GetPos() )
			util.Effect( "cball_bounce", effectdata, false, true)
		end
	end

	function SWEP:PreHolster()
		if !self:IsValid() then return end
		self:LetGoGrapple()
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

	function SWEP:LetGoGrapple()
		self:SetHoldingGrab(false)

		self:SetObjectRange(0)
		
		if self.RopeSounds then
			self.RopeSounds:ChangeVolume(0)
		end
		
		if self.RopeAnchor and self.RopeAnchor:IsValid() then
			self.RopeAnchor:Remove()
		end
		if self.PlayerKF and self.PlayerKF:IsValid() then
			self.PlayerKF:Remove()
		end

		self:SetCapturedEntity(nil)
	end

	function SWEP:GrappleThink()
		local ply = self:GetOwner()
		local ranc = self.RopeAnchor

		if !self:GetHoldingGrab() then return false end
		if !ranc or !ranc:IsValid() then return false end

		local trendpos = ranc:GetPos() + (Vector(0,0,-1) * self:GetObjectRange())
		
		if self:GetCapturedEntity() and self:GetCapturedEntity():IsValid() then
			ply = self:GetCapturedEntity()
			ranc = self:GetOwner()
			trendpos = ranc:GetPos() + ((ply:GetPos()-ranc:GetPos()):GetNormal() * self:GetObjectRange())
		
			if ply:Health() <= 0 then
				self:LetGoGrapple()
			end
		end

		local plyp = ply:GetPhysicsObject()

		local tr = util.TraceLine({
			start = ranc:GetPos(),
			endpos = trendpos,
			filter = function(ent)
				if (ent == ent) or (ent == self.Owner) or (ent == ranc) then
					return false
				else
					return true
				end
			end
		})

		local objr = math.min(5000/(self:GetObjectRange()+10), 10)

		local objrd = math.max((self.DefaultLength - self:GetObjectRange())/200,0)

		local dist = math.Clamp(tr.HitPos:Distance(ply:GetPos())/10, 0, 15)

		local grup
		local grside

		if ply:IsPlayer() then
			if ply:OnGround() then
				grside = objrd
				grup = dist*3
			else
				grup = 1
				grside = 1
			end
		else
			if ply:OnGround() then
				grside = 2
				grup = 0.1
			else
				grup = 0.8
				grside = 1
			end
		end

		local futurvel = (tr.HitPos-ply:GetPos()):GetNormal() * (((objr + dist)/2)*grside)
		futurvel:Add(Vector(0,0,5*(grup)))
		futurvel:Sub( ply:GetVelocity()/(dist*25) )
		futurvel:Sub( Vector(0,0, ply:GetVelocity().z/(objr*25) ) )

		ply:SetVelocity( futurvel )

		self.RopeCC:SetKeyValue( "length", self:GetObjectRange()+50 )
	end

	function SWEP:Think()
		BaseClass.Think(self)

		if self.RopeSounds and self:GetObjectRange() ~= 0 then
			self.RopeSounds:ChangeVolume(math.abs(self:GetMWScrolling()), 0.4 and self:GetMWScrolling() > 0.5 or 0.1)
		end
		
		if self:GetStat("GrappleEnabled") then
			self:GrappleThink()
		end
	end
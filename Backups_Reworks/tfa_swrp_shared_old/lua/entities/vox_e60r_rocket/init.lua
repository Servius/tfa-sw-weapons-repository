AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()   

self.flightvector = self.Entity:GetForward() * ((110*52.5)/306)
self.timeleft = CurTime() + 10
self.Owner = self:GetOwner()
if ( file.Exists( "models/weapons/w_panzerfaust_rocket.mdl", "GAME" ) ) then
self.Entity:SetModel( "models/weapons/w_panzerfaust_rocket.mdl" )
else
self.Entity:SetModel( "models/Weapons/W_missile_closed.mdl" )
end
self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
self.Entity:SetMoveType( MOVETYPE_NONE )   --after all, gmod is a physics  	
self.Entity:SetSolid( SOLID_VPHYSICS )        -- CHEESECAKE!    >:3        

Glow = ents.Create("env_sprite")
Glow:SetKeyValue("model","orangecore2.vmt")
Glow:SetKeyValue("rendercolor","255 150 100")
Glow:SetKeyValue("scale","0.3")
Glow:SetPos(self.Entity:GetPos())
Glow:SetParent(self.Entity)
Glow:Spawn()
Glow:Activate()

end   

 function ENT:Think()
	

		if self.timeleft < CurTime() then
		self.Entity:Remove()				
		end

	Table	={} 			//Table name is table name
	Table[1]	=self.Owner 		//The person holding the gat
	Table[2]	=self.Entity 		//The cap

	local trace = {}
		trace.start = self.Entity:GetPos()
		trace.endpos = self.Entity:GetPos() + self.flightvector
		trace.filter = Table
	local tr = util.TraceLine( trace )
	

			if tr.HitSky then
			self.Entity:Remove()
			return true
			end
	
				if tr.Hit then
					util.BlastDamage(self.Entity, self.Owner, tr.HitPos, 600, 150)
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)			// Where is hits
					effectdata:SetNormal(tr.HitNormal)		// Direction of particles
					effectdata:SetEntity(self.Entity)		// Who done it?
					effectdata:SetScale(100.8)			// Size of explosion
					effectdata:SetRadius(tr.MatType)		// What texture it hits
					effectdata:SetMagnitude(10000000)			// Length of explosion trails
					util.Effect( "Explosion", effectdata )
					util.Effect( "ThumperDust", effectdata )
					util.Effect( "ThumperDust", effectdata )
					util.Effect( "ThumperDust", effectdata )
					util.Effect( "ThumperDust", effectdata )
					util.Effect( "ThumperDust", effectdata )
					util.Effect("HelicopterMegaBomb", effectdata)
					util.ScreenShake(tr.HitPos, 10, 5, 1, 3000 )
					util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

					self.Entity:Remove()	
					end
	
	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	self.flightvector = self.flightvector - self.flightvector/((147*39.37)/66) + self.Entity:GetForward()*2 + Vector(math.Rand(-0.3,0.3), math.Rand(-0.3,0.3),math.Rand(-0.1,0.1)) + Vector(0,0,-0.111)
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(0,0,0))
	self.Entity:NextThink( CurTime() )
	return true
end
 
 

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()   

self.flightvector = self.Entity:GetForward() * ((110*52.5)/66)
self.timeleft = CurTime() + 10
self.Owner = self:GetOwner()
if ( file.Exists( "models/conviction/proxmine.mdl", "GAME" ) ) then
self.Entity:SetModel( "models/conviction/proxmine.mdl" )
else
self.Entity:SetModel( "models/conviction/proxmine.mdl" )
end
self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   --after all, gmod is a physics  	
self.Entity:SetSolid( SOLID_VPHYSICS )        -- CHEESECAKE!    >:3        

Glow = ents.Create("env_sprite")
Glow:SetKeyValue("model","orangecore2.vmt")
Glow:SetKeyValue("rendercolor","255 150 100")
Glow:SetKeyValue("scale","0.2")
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


	timer.Simple(2.25, function ()
		if ( !IsValid( self ) ) then return end
		curpos = self:GetPos()
		util.BlastDamage(self.Entity, self.Owner, curpos, 600, 60)
		local effectdata = EffectData()
		effectdata:SetOrigin(curpos)			// Where is hits
		effectdata:SetNormal(curpos)		// Direction of particles
		effectdata:SetEntity(self.Entity)		// Who done it?
		effectdata:SetScale(1.8)			// Size of explosion
		effectdata:SetRadius(200)		// What texture it hits
		effectdata:SetMagnitude(18)			// Length of explosion trails
		util.Effect( "Explosion", effectdata )
		util.ScreenShake(curpos, 10, 5, 1, 3000 )
		util.Decal("Scorch", curpos, curpos)

		self.Entity:Remove()	
	end)

end
 
 

EFFECT.Mat1 = Material( "particle/particle_ring_wave_8" )
EFFECT.Mat2 = Material( "sprites/key_12" )

function EFFECT:Init( data )
	self.StartPos = data:GetOrigin()
	self.Entity = data:GetEntity()
	self.FollowPlayer = self.Entity:GetPos()

	self.Duration = data:GetScale()*6
	self.HPMax = math.max( math.Round( data:GetMagnitude() ),0)
	self.HealingAm = 0

	self.Alpha = 255
	self.Life = 0

	self.Color = Color(50, 150, 50, 255)
end

function EFFECT:Think()
	if !self.Entity:IsValid() then return end

	self.HealingAm = math.Clamp((self.Entity:GetMaxHealth()-self.Entity:Health())/2, 0, 10)

	self.FollowPlayer = self.Entity:GetPos()

	self.Life = self.Life + FrameTime() * 6

	self.Alpha = 255 * ( 1 - self.Life )
	self.Color["a"] = math.max(255-(self.Life*60),0)

	return ( self.Life < self.Duration )
end

function EFFECT:Render()
	-- Particles
	local emitter = ParticleEmitter( self.FollowPlayer, false )
	local particle = emitter:Add( self.Mat1, (self.FollowPlayer+Vector(0,0,20))+(VectorRand()*15) )
	if (particle) then
		particle:SetLifeTime(0) 
		particle:SetDieTime(2) 
		particle:SetStartAlpha( 20+(self.HealingAm*5) )
		particle:SetEndAlpha(0)
		particle:SetStartSize(30) 
		particle:SetEndSize(70)
		particle:SetAngles( Angle(math.random( 0, 360 ),math.random( 0, 360 ),math.random( 0, 360 )) )
		particle:SetAngleVelocity( Angle(math.random( 0, 1 ),math.random( 0, 1 ),math.random( 0, 1 )) ) 
		particle:SetRoll(math.random( 0, 360 ))
		particle:SetColor( self.Color["r"], self.Color["g"], self.Color["b"] )
		particle:SetGravity( Vector(0, 0, 0 ) ) 
		particle:SetVelocity( Vector(math.random( -30, 30 ), math.random( -30, 30 ), math.random( 50, 75 ) ) ) 
		particle:SetAirResistance(50)  
		particle:SetCollide(true)
		particle:SetBounce(0)
	end
	emitter:Finish()

	local emitter = ParticleEmitter( self.FollowPlayer, false )
	local particle = emitter:Add( self.Mat2, (self.FollowPlayer+Vector(0,0,20))+(VectorRand()*30) )
	if (particle) then
		particle:SetLifeTime(0) 
		particle:SetDieTime(1.2) 
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(self.HealingAm) 
		particle:SetEndSize(0)
		particle:SetAngles( Angle(0,0,0) )
		particle:SetAngleVelocity( Angle(math.random( 0, 1 ),math.random( 0, 1 ),math.random( 0, 1 )) ) 
		particle:SetColor( self.Color["r"], self.Color["g"], self.Color["b"] )
		particle:SetGravity( Vector(0, 0, math.random( 50, 150 ) ) ) 
		particle:SetVelocity( Vector(math.random( -50, 50 ), math.random( -50, 50 ), math.random( 20, 50 ) ) ) 
		particle:SetAirResistance(50)  
		particle:SetCollide(true)
		particle:SetBounce(0)
	end
	emitter:Finish()
end
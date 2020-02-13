EFFECT.BeatMat = Material( "sprites/tp_beam001" )
EFFECT.SprMat = Material( "particle/particle_ring_wave_8_15ob_nofog" )

function EFFECT:Init( data )
	self.StartPos = data:GetOrigin()
	self.Entity = data:GetEntity()
	self.FollowPlayer = self.Entity:GetPos()

	self.Duration = data:GetScale()*6
	self.HealingAm = 0

	self.Alpha = 255
	self.Life = 0

	self.Color = Color(150,150,250,255)
end

function EFFECT:Think()
	if !self.Entity:IsValid() then return end

	self.FollowPlayer = self.Entity:GetPos()+Vector(0,0,50)

	self.Life = self.Life + FrameTime() * 6

	self.Alpha = 255 * ( 1 - self.Life )

	return ( self.Life < self.Duration )
end

function EFFECT:Render()
	-- Particles

	render.SetMaterial( self.SprMat )
	render.DrawSprite( 
		self.FollowPlayer,
		math.min(self.Life*50,100)+math.random( -25, 25 ),
		math.min(self.Life*50,100)+math.random( -25, 25 ),
		self.Color
	)

	render.SetMaterial( self.BeatMat )
	for i = 1, 5 do
		local randvec = VectorRand()
		randvec.z = -2
		render.DrawBeam( 
			self.FollowPlayer + (VectorRand()*5),
			self.FollowPlayer + (randvec*(math.min(self.Life*5,50)+math.random( -15, 45 ))),
			math.random(8,14),
			5,
			3,
			self.Color
		)
	end

end
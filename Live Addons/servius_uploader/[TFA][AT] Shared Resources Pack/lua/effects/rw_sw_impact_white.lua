local MaterialGlow		= Material( "effects/sw_i/sw_laser_bit_white" );
function EFFECT:Init( data )
	local bit_amount = GetConVar("rw_sw_bit_amount"):GetInt()
	local smoke_amount = GetConVar("rw_sw_smoke_amount"):GetInt()
	local duration = GetConVar("rw_sw_impact_duration"):GetInt()
	self.Position = data:GetOrigin();
	self.Normal = data:GetNormal();
	self.LifeTime = duration;
	local emitter = ParticleEmitter( self.Position );
	if( emitter ) then
		for i = 1, bit_amount do
			local particle = emitter:Add( MaterialGlow, self.Position + self.Normal * 2 );
			particle:SetVelocity( ( self.Normal + VectorRand() * 0.75 ):GetNormal() * math.Rand( 75, 125 ) );
			particle:SetDieTime( math.Rand( 0.5, 1.25 ) );
			particle:SetStartAlpha( 255 );
			particle:SetEndAlpha( 0 );
			particle:SetStartSize( math.Rand( 4, 8 ) );
			particle:SetEndSize( 0 );
			particle:SetRoll( 0 );
			particle:SetGravity( Vector( 0, 0, -250 ) );
			particle:SetCollide( true );
			particle:SetBounce( 0.3 );
			particle:SetAirResistance( 5 );
		end
		emitter:Finish();
	end
	local emitter_s = ParticleEmitter( self.Position );
	if( emitter_s ) then
		for i = 1, smoke_amount do
			local smokeTexture	= "effects/smoke"
			local particle_s = emitter_s:Add(smokeTexture, self.Position+self.Normal*2);
			particle_s:SetVelocity((self.Normal+VectorRand()*0.10):GetNormal()*math.Rand(400, 900));
			particle_s:SetDieTime(math.Rand(2.1, 2.7));
			particle_s:SetStartAlpha(50);
			particle_s:SetEndAlpha(0);
			particle_s:SetStartSize(math.Rand(8, 16));
			particle_s:SetEndSize(math.Rand(0, 4));
			particle_s:SetGravity(Vector(math.Rand(0, 500), math.Rand(250, 1000), math.Rand(-250, 250)));
			particle_s:SetRoll(math.Rand(0, 360));
			particle_s:SetRollDelta(math.Rand(-0.5, 0.5));
			local colour = math.Rand(110, 130);
			particle_s:SetColor(colour, colour, colour, 100);
			particle_s:SetCollide(true);
			particle_s:SetAirResistance(2000);
		end
		emitter_s:Finish();
	end
end
function EFFECT:Think()
	self.LifeTime = self.LifeTime - FrameTime();
	return self.LifeTime > 0;
end
function EFFECT:Render()
	local size = GetConVar("rw_sw_impact_size"):GetInt()
	local duration = GetConVar("rw_sw_impact_duration"):GetInt()
	local frac = math.max( 0, self.LifeTime / duration);
	local rgb = 255 * frac;
	local color = Color( rgb, rgb, rgb, 255 );
	render.SetMaterial( MaterialGlow );
	render.DrawQuadEasy( self.Position + self.Normal, self.Normal, size, size, color );
end
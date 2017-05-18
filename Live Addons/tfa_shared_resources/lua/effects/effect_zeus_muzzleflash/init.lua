AddCSLuaFile()

EFFECT.Author = "BFG"
EFFECT.Life = 0
function EFFECT:Init(fxdata)
	self.attachment = fxdata:GetAttachment()
	self.Ent = fxdata:GetEntity()
	self.Position = fxdata:GetStart()
	self.StartPos = self:GetTracerShootPos( self.Position, self.Ent, self.attachment )
	//util.Effect(self.StartPos, self.size or 60, self.size or 60, Color(200,200,255))
	//self.Life = 0
end

function EFFECT:Render()
	render.SetMaterial(Material("sprites/glow04_noz"))
	render.DrawSprite( self.StartPos, self.size or 60, self.size or 60, Color(180,180,255))
end

function EFFECT:Think()
	self.Life = self.Life + FrameTime() * 4
	self.size = 60 * ( 1 - self.Life )	
	return (self.Life < 1)	
end
function EFFECT:Init( data )
	
	--print("bourne bourne bourne yes ur gonna bourne")
	
	self.PartName = "flamethrower"
	
	self.StartPacket = data:GetStart()
	self.EntityV = data:GetEntity()
	self.Attachment = data:GetAttachment()
	
	if self.Attachment and IsValid(self.EntityV) then
		local owner = Entity(math.Round(self.StartPacket.x))
		if owner == LocalPlayer() and math.Round(self.StartPacket.y)==1 then
			self.EntityV = owner:GetViewModel()
			if IsValid(self.EntityV) then
				ParticleEffectAttach(self.PartName,PATTACH_POINT_FOLLOW,self.EntityV,self.Attachment)			
			end			
		else
			self.EntityV = owner:GetActiveWeapon()
			if IsValid(self.EntityV) then
				ParticleEffectAttach(self.PartName,PATTACH_POINT_FOLLOW,self.EntityV,self.Attachment)				
			end
		end
		
	end
end 

function EFFECT:Think( )
	return false
end

function EFFECT:Render()
end

 
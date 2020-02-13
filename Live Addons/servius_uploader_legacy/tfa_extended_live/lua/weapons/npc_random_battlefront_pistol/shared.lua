SWEP.Author						= "xyzzy"
SWEP.Category					= ""
SWEP.Spawnable 					= false
SWEP.AdminSpawnable				= false
SWEP.ViewModel					= "models/weapons/v_pistol.mdl"
SWEP.WorldModel					= "models/weapons/w_pistol.mdl"
SWEP.WeaponList					= npcRandomBattlefrontPistol

function SWEP:Initialize()
	
	if not SERVER then return end
	
	self:Remove()
	
end

function SWEP:OnRemove()

	if not SERVER then return end
	
	if IsValid(self) and IsValid(self.Owner) and self.Owner:IsNPC() then
		
		self.Owner:Give(table.Random(self.WeaponList))
		
	end

end

function SWEP:Deploy()

	return true
	
end
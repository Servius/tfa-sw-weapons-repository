SWEP.HoldType = "duel"
SWEP.ViewModelFOV = 72.160804020101
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/v_dc17.mdl"
SWEP.WorldModel = "models/weapons/w_DC17.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.Akimbo = true
SWEP.ViewModelBoneMods = {
	["v_weapon.Hands_parent"] = { scale = Vector(0.961, 1.001, 0.961), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["v_weapon.elite_right"] = { scale = Vector(0.018, 0.018, 0.018), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["v_weapon.Left_Hand"] = { scale = Vector(1.016, 1.016, 1.016), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["v_weapon.Right_Arm"] = { scale = Vector(1, 1, 1), pos = Vector(-3.149, -1.297, 0.185), angle = Angle(0, 0, 0) },
	["v_weapon.elite_left"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["dc17"] = { type = "Model", model = "models/weapons/w_DC17.mdl", bone = "v_weapon.elite_left", rel = "", pos = Vector(-0.519, -1.558, 4.675), angle = Angle(90, -99.351, 15.194), size = Vector(0.69, 0.69, 0.69), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["dc17+"] = { type = "Model", model = "models/weapons/w_DC17.mdl", bone = "v_weapon.elite_right", rel = "", pos = Vector(-0.519, -1.558, 4.675), angle = Angle(90, -99.351, 15.194), size = Vector(0.69, 0.69, 0.69), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


SWEP.WElements = {
	["dc17"] = { type = "Model", model = "models/weapons/w_DC17.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(9.362, 1.738, 3.665), angle = Angle(0, 0, 0), size = Vector(0.827, 0.827, 0.827), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.MuzzleAttachment			= "1" --Where the muzzleflash AND bullet should come out of on the weapon. Most models have this as 1.
SWEP.ShellAttachment			= "2" --Where the bullet casing should come out of on the weapon. Most models have this as 2.
SWEP.MuzzleEffect    			= "MuzzleEffect" --Which effect to use as the muzzleflash.
SWEP.ShellEffect				= "ShellEject" --Which effect to use as the bullet casing.
SWEP.Tracer						= "Tracer" --Which effect to use as the bullet tracer.
SWEP.TracerX					= 1 --For every X bullets, show the tracer effect.
SWEP.Primary.Cone			= 0.0125
SWEP.Damage						= 1 --How much damage each bullet should do. Rule of thumb is somewhere around 4-8 for small caliber weapons like pistols, 8-12 for rifles, and 15+ for large caliber weapons.
SWEP.Force						= 0 --How much force each bullet should do. Rule of thumb is set this the same as damage, unless goes outside this range (5, 15). You usually don't want this to be outside that range.
SWEP.Spread						= Vector(0, 0, 0) --How inaccurate the weapon should be. Only the first 2 values are needed. Examples: AWP - Vector(0.003, 0.003, 0), M4A1 - Vector(0.030, 0.030, 0), MAC10 - Vector(0.060, 0.060, 0)
SWEP.SpreadMPenalty				= 1 --How much should we multiply the spread if the NPC is moving? Higher values mean the weapon is more inaccurate while moving. Rule of thumb is 1.2 for rifles, 1.1 for pistols, 1 for SMGs, 1.3-1.5 for MGs, and 5+ for sniper rifles.
SWEP.BurstCount					= 0 --How many EXTRA bullets should we fire every time the NPC shoots? A value of 0 means fire 1 bullet (pistols, sniper rifles), 2 means fire 3 bullets (assault rifles, some smgs). This allows burst-fire weapons like the FAMAS and Glock.
SWEP.BurstDelay					= 0 --How much time should there be between shots in the same burst? Higher values make the delay between shots in the same burst longer.
SWEP.Primary.NumShots			= 1 --How many bullets should there be for each shot? Most weapons would have this as 1, but shotguns would have a different value, like 8 or 9.
SWEP.Primary.ClipSize			= 1 --How many shots should we get per reload?
SWEP.Primary.DefaultClip		= 1 --How many shots should the weapon spawn with in the magazine? Usually you want this the same as ClipSize.
SWEP.Primary.Delay				= 0 --How much time should there be between pulls of the trigger? For weapons with a BurstCount of 0 this is essentially firerate, and for weapons with a nonzero BurstCount this is the delay between bursts.
SWEP.FireDelay 					= 0 --This value is used to store the current server time in order to handle delays between firing. Don't change this value.
SWEP.Primary.Ammo				= "pistol" --Since NPCs have infinite ammo, this value is not important and should just be left alone.
SWEP.Primary.Sound				= "weapons/pistol/pistol_fire2.wav"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos = Vector(-1.16, 0, 1.09)
SWEP.IronSightsAng = Vector(-0.101, 1, -1.407)


function SWEP:PrimaryAttack()
	
	if not self:CanPrimaryAttack() then
		self:AIReload()
		return
	end
	
	local curtime = CurTime()
	
	if self.FireDelay > curtime then
		return
	end
	
	if self.Owner:IsNPC() and IsValid(self.Owner:GetEnemy()) then
		
		self.FireDelay = curtime + self.Primary.Delay
		
		for i=0, self.BurstCount do
		
			timer.Simple(i * self.BurstDelay, function()
			
				if not IsValid(self) or not IsValid(self.Owner) then
					return
				end
				
				if not self.Owner:GetEnemy() or not self:CanPrimaryAttack() then
					return
				end
				
				self:Shoot()
			
			end)
		
		end
		
	end
	
end

function SWEP:Proficiency()
timer.Simple(0.5, function()
if !self:IsValid() or !self.Owner:IsValid() then return; end
	local Proficiency = GetConVar( "NPC_Proficiency" )
  if GetConVar( "new_acc_system" ):GetInt() == 1 then
	if Proficiency:GetInt() == 0 then
	self.Owner:SetCurrentWeaponProficiency(0)
	end

	if Proficiency:GetInt() == 1 then
	self.Owner:SetCurrentWeaponProficiency(1)
	end
	
	if Proficiency:GetInt() == 2 then
	self.Owner:SetCurrentWeaponProficiency(2)
	end
	
	if Proficiency:GetInt() == 3 then
	self.Owner:SetCurrentWeaponProficiency(3)
	end

	if Proficiency:GetInt() == 4 then
	self.Owner:SetCurrentWeaponProficiency(4)
	end
	else
		self.Owner:SetCurrentWeaponProficiency(3)
end
	end)
end

function SWEP:Shoot()

	local owner = self.Owner
	local enemy = owner:GetEnemy()
	local enemycl = enemy:GetClass()
	local targetPos = nil
	
	if enemy:IsPlayer() or enemycl == "npc_combine_s" or enemycl == "npc_citizen" or enemycl == "npc_metropolice" then
	
		if enemy:LookupBone("ValveBiped.Bip01_Head1") == nil then
		
			targetPos = enemy:EyePos()
		
		else
		
			targetPos = enemy:GetBonePosition(enemy:LookupBone("ValveBiped.Bip01_Head1"))
			
		end
		
	elseif enemycl == "npc_fastzombie" or enemycl == "npc_poisonzombie" or enemycl == "npc_zombie_torso" or enemycl == "npc_fastzombie_torso" or enemycl == "npc_headcrab" or enemycl == "npc_headcrab_black" or enemycl == "npc_headcrab_fast" then
	
		targetPos = enemy:WorldSpaceCenter()
		
	else
	
		targetPos = enemy:EyePos()
		
	end
	
	local muzzlePos = self.Weapon:GetAttachment(self.MuzzleAttachment).Pos
	local direction = self.Owner:GetAimVector()	
	local spread = Vector( cone, cone, 0 )
	
	local bulletInfo = {}
	bulletInfo.Attacker = owner
	bulletInfo.Damage = self.Damage
	bulletInfo.Force  = self.Force
	bulletInfo.Num = self.Primary.NumShots
	bulletInfo.Tracer = self.TracerX
	bulletInfo.TracerName = self.Tracer
	bulletInfo.AmmoType = self.Primary.Ammo
	bulletInfo.Dir = direction
	bulletInfo.Spread = spread
	bulletInfo.Src = muzzlePos
	
	owner:FireBullets(bulletInfo)
	self:ShootEffects()
	
	self:TakePrimaryAmmo(1)
	
end

function SWEP:ShootEffects()

	local shootSound = Sound(self.Primary.Sound)
	self.Weapon:EmitSound(shootSound, SNDLVL_GUNFIRE, 100, 1, CHAN_WEAPON)
	
	local muzzleEffect = EffectData()
	local muzzleAttach = self.Weapon:GetAttachment(self.MuzzleAttachment)
	muzzleEffect:SetEntity(self.Weapon)
	muzzleEffect:SetOrigin(muzzleAttach.Pos)
	muzzleEffect:SetAngles(muzzleAttach.Ang)
	muzzleEffect:SetScale(1)
	muzzleEffect:SetMagnitude(1)
	muzzleEffect:SetRadius(1)
	util.Effect(self.MuzzleEffect, muzzleEffect)

	local shellEffect = EffectData()
	local shellAttach = self.Weapon:GetAttachment(self.ShellAttachment)
	shellEffect:SetEntity(self.Weapon)
	shellEffect:SetOrigin(shellAttach.Pos)
	shellEffect:SetAngles(shellAttach.Ang)
	shellEffect:SetScale(1)
	shellEffect:SetMagnitude(1)
	shellEffect:SetRadius(1)
	util.Effect(self.ShellEffect, shellEffect)
	
	self.Owner:MuzzleFlash()

end

function SWEP:AIReload()

	if not IsValid(self) or not IsValid(self.Owner) then
		return
	end
	
	local owner = self.Owner

	if owner:IsNPC() and not owner:IsCurrentSchedule(SCHED_HIDE_AND_RELOAD) and not owner:IsCurrentSchedule(SCHED_RELOAD) and not owner:GetActivity() == ACT_RELOAD then
		owner:SetSchedule(SCHED_RELOAD)
	end
	
end

function SWEP:SecondaryAttack()

end

function SWEP:Think()
	
	timer.Simple(engine.TickInterval() * 5, function()
	
		if IsValid(self) then
			self:Think()
		end
	
	end)
	
	if not IsValid(self.Owner) then
		self:Remove()
		return
	end
	
	if IsValid(self.Owner) and IsValid(self.Owner:GetEnemy()) then
		
		local owner = self.Owner
		local enemy = owner:GetEnemy()
		
		if self:CanPrimaryAttack() and owner:GetActivity() ~= ACT_RELOAD and enemy:Health() > 0 then
			
			if enemy:Visible(owner) then
			
				self:PrimaryAttack()
			
			end
		
		end
		
	end

end

function SWEP:CanPrimaryAttack()

	if self.Weapon:Clip1() <= 0 then
	
		return false
	
	end
	
	return true

end

function SWEP:Initialize()

	--// other initialize code goes here

	if CLIENT then
	
		--// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements) // create viewmodels
		self:CreateModels(self.WElements) // create worldmodels
		
		--// init view model bone build function
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)
				
				if self.Akimbo then
		self.AutoDetectMuzzleAttachment = true
		self.MuzzleAttachmentRaw = 2-self.AnimCycle
	end	
				
				--// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					--// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					--// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					--// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")			
				end
			end
		end
		
	end

end

function SWEP:Deploy()

	return true
	
end

function SWEP:Holster()
	
	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end
	
	return true
end

function SWEP:OnRemove()
	self:Holster()
end

function SWEP:Initialize()

	--// other initialize code goes here

	if CLIENT then
	
		--// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements) --// create viewmodels
		self:CreateModels(self.WElements) --// create worldmodels
		
		--// init view model bone build function
		if IsValid(self.Owner) then
			--local vm = self.Owner:GetViewModel()
			--if IsValid(vm) then
				--self:ResetBonePositions(vm)
				
				--// Init viewmodel visibility
				--if (self.ShowViewModel == nil or self.ShowViewModel) then
				--	vm:SetColor(Color(255,255,255,255))
				--else
					--// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
				--	vm:SetColor(Color(255,255,255,1))
					--// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					--// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
				--	vm:SetMaterial("Debug/hsv")			
				--end
			--end
		end
		
	end

end

function SWEP:Holster()
	
	if CLIENT and IsValid(self.Owner) then
		--local vm = self.Owner:GetViewModel()
		--if IsValid(vm) then
		--	self:ResetBonePositions(vm)
		--end
	end
	
	return true
end

function SWEP:OnRemove()
	self:Holster()
end

if CLIENT then

	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		
		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end
		
		if (!self.VElements) then return end
		
		self:UpdateBonePositions(vm)

		if (!self.vRenderOrder) then
			
			--// we build a render order because sprites need to be drawn after models
			self.vRenderOrder = {}

			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.vRenderOrder, k)
				end
			end
			
		end

		for k, name in ipairs( self.vRenderOrder ) do
		
			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (!v.bone) then continue end
			
			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
			
			if (!pos) then continue end
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				--//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()
		
		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end
		
		if (!self.WElements) then return end
		
		if (!self.wRenderOrder) then

			self.wRenderOrder = {}

			for k, v in pairs( self.WElements ) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end

		end
		
		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			--// when the weapon is dropped
			bone_ent = self
		end
		
		for k, name in pairs( self.wRenderOrder ) do
		
			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end
			
			local pos, ang
			
			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end
			
			if (!pos) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				--//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
		
		local bone, pos, ang
		if (tab.rel and tab.rel != "") then
			
			local v = basetab[tab.rel]
			
			if (!v) then return end
			
			--// Technically, if there exists an element with the same name as a bone
			--// you can get in an infinite loop. Let's just hope nobody's that stupid.
			pos, ang = self:GetBoneOrientation( basetab, v, ent )
			
			if (!pos) then return end
			
			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
		else
		
			bone = ent:LookupBone(bone_override or tab.bone)

			if (!bone) then return end
			
			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end
			
			if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r // Fixes mirrored models
			end
		
		end
		
		return pos, ang
	end

	function SWEP:CreateModels( tab )

		if (!tab) then return end

		--// Create the clientside models here because Garry says we can't do it in the render hook
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
				
				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end
				
			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
				
				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				--// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
				
			end
		end
		
	end
	
	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)
		
		if self.ViewModelBoneMods then
			
			if (!vm:GetBoneCount()) then return end
			
			--// !! WORKAROUND !! //
			--// We need to check all model names :/
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then 
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = { 
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end
				
				loopthrough = allbones
			end
			--// !! ----------- !! //
			
			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end
				
				--// !! WORKAROUND !! //
				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end
				
				s = s * ms
				--// !! ----------- !! //
				
				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end
		   
	end
	 
	function SWEP:ResetBonePositions(vm)
		
		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end
		
	end

	--/**************************
	--	Global utility code
	--**************************/

	--// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
	--// Does not copy entities of course, only copies their reference.
	--// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
	function table.FullCopy( tab )

		if (!tab) then return nil end
		
		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end
		
		return res
		
	end
	
end

function SWEP:FireAnimationEvent(pos,ang,event)
return (event==20)
end

function SWEP:CanClip2Attack()
	if clip2 <= 0 and self.Primary.ClipSize > -1 then
		self.Weapon:SetNextSecondaryFire(CurTime() + 0.5)
		self.Weapon:EmitSound("weapons/DC17_fire.wav")
		clip2 = 0
		return false
	end

	return true
end



if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Stun Charge Ammo"
ATTACHMENT.ShortName = "SCA" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
	TFA.AttachmentColors["+"],"5 Second Stun",
}
ATTACHMENT.Icon = "entities/att_stun_ammo.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = 2,
		["ClipSize"] = 5,
		["RPM"] = 200,
		["AmmoConsumption"] = 1,
		["StatusEffect"] = "stun",
		["StatusEffectDmg"] = 20,
		["StatusEffectDur"] = 5,
		["StatusEffectParticle"] = true,
	},
	["TracerName"] = "rw_sw_laser_aqua",
}

function ATTACHMENT:Attach(wep)
	wep.ImpactEffect = "rw_sw_impact_aqua"
	wep:Unload()
	wep.CustomBulletCallbackOld = wep.CustomBulletCallbackOld or wep.CustomBulletCallback
	wep.CustomBulletCallback = function(a, tr, dmg)
		local wep = dmg:GetInflictor()
		if wep:GetStat("Primary.StatusEffect") then
			GMSNX:AddStatus(tr.Entity, wep:GetOwner(), wep:GetStat("Primary.StatusEffect"), wep:GetStat("Primary.StatusEffectDur"), wep:GetStat("Primary.StatusEffectDmg"), wep:GetStat("Primary.StatusEffectParticle"))
			--util.Effect("BGOLightning", ED_Stun, true, true)
		end
	end
end

function ATTACHMENT:Detach(wep)
	wep.CustomBulletCallback = wep.CustomBulletCallbackOld
	wep.CustomBulletCallbackOld = nil
	wep.ImpactEffect = "rw_sw_impact_blue"
	wep:Unload()
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
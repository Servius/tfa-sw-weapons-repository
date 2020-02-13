if not ATTACHMENT then
	ATTACHMENT = {}
end


ATTACHMENT.Name = "Charge Round Alpha"
ATTACHMENT.ShortName = "5s" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
	TFA.AttachmentColors["+"],"Stunned for 5 Seconds",
}
ATTACHMENT.Icon = "entities/icon/mod_stun5.png" --Refers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["AmmoConsumption"] = 7,
		["StatusEffect"] = "stun",
		["StatusEffectDmg"] = 5,
		["StatusEffectDur"] = 5,
		["StatusEffectParticle"] = true,
	},
	["TracerName"] = "effect_sw_laser_blue_stun",
}

function ATTACHMENT:Attach(wep)
	wep.CustomBulletCallbackOld = wep.CustomBulletCallbackOld or wep.CustomBulletCallback
	wep.CustomBulletCallback = function(a, tr, dmg)
		local wep = dmg:GetInflictor()
		if wep:GetStat("Primary.StatusEffect") then
			GMSERV:AddStatus(tr.Entity, wep:GetOwner(), wep:GetStat("Primary.StatusEffect"), wep:GetStat("Primary.StatusEffectDur"), wep:GetStat("Primary.StatusEffectDmg"), wep:GetStat("Primary.StatusEffectParticle"))
			--util.Effect("BGOLightning", ED_Stun, true, true)
		end
	end
end

function ATTACHMENT:Detach(wep)
	wep.CustomBulletCallback = wep.CustomBulletCallbackOld
	wep.CustomBulletCallbackOld = nil
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
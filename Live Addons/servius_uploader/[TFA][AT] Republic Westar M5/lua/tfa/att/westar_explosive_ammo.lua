if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Anti-Armor Plasma"
ATTACHMENT.ShortName = "AAP" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
	TFA.AttachmentColors["="],"High energy ammo type - Slow rate of fire, heavy damage. Explosive plasma. CAUTION!",
	TFA.AttachmentColors["+"],"%600 Damage increase",
	TFA.AttachmentColors["+"],"Explosive Damage; Area of effect",
	TFA.AttachmentColors["-"],"Green Tracer",
	TFA.AttachmentColors["-"],"RPG_Round Ammo Type; Special and hard to get compared to standard rounds.",
	TFA.AttachmentColors["-"],"%10 of standard movement speed.",
}
ATTACHMENT.Icon = "entities/att_explosive_ammo.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = 600,
		["RPM"] = 200,
		["ClipSize"] = 75,
		--["DamageTypeHandled"] = true,
		["DamageType"] = DMG_BLAST,
		["AmmoConsumption"] = 25,
	},
	["TracerName"] = "rw_sw_laser_green",
}

function ATTACHMENT:Attach(wep)
	wep.ImpactEffect = "sw_explosion"
	wep.MuzzleFlashEffect = "rw_sw_muzzleflash_green"
	wep:Unload()
end

function ATTACHMENT:Detach(wep)
	wep.ImpactEffect = "rw_sw_impact_blue"
	wep.MuzzleFlashEffect = "rw_sw_muzzleflash_blue"
	wep:Unload()
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
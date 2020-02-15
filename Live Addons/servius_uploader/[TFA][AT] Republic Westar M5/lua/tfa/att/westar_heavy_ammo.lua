if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Over Powered Plasma"
ATTACHMENT.ShortName = "OPP"
ATTACHMENT.Description = { 
	TFA.AttachmentColors["="],"High energy ammo type - Slow rate of fire, heavy damage. Explosive plasma. CAUTION!",
	TFA.AttachmentColors["+"],"%200 Damage increase",
	TFA.AttachmentColors["+"],"Purple Tracer",
	TFA.AttachmentColors["-"],"5 ammo per shot",
	TFA.AttachmentColors["-"],"%50 decrease to RPM",
}
ATTACHMENT.Icon = "entities/att_heavy_ammo.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = 125,
		["ClipSize"] = 75,
		["RPM"] = 230,
		["RPM_Burst"] = 310,
		["Sound"] = "weapons/bf3/e11_heavy.wav",
		["DamageType"] = DMG_DISSOLVE,
		["AmmoConsumption"] = 5,
	},
	
	["TracerName"] = "rw_sw_laser_purple",
	["MoveSpeed"] = 0.95,
}

function ATTACHMENT:Attach(wep)
	wep.ImpactEffect = "rw_sw_impact_purple"
	wep.MuzzleFlashEffect = "rw_sw_muzzleflash_purple"
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
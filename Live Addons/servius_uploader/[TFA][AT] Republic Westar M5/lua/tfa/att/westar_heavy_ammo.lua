if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "High Powered Plasma"
ATTACHMENT.ShortName = "HPP"
ATTACHMENT.Description = { 
	TFA.AttachmentColors["="],"High energy ammo type - Slow rate of fire, heavy damage. Explosive plasma. CAUTION!",
	TFA.AttachmentColors["+"],"%200 Damage increase",
	TFA.AttachmentColors["+"],"Purple Tracer",
	TFA.AttachmentColors["-"],"10 ammo per shot",
	TFA.AttachmentColors["-"],"%70 decrease to RPM",
}
ATTACHMENT.Icon = "entities/att_heavy_ammo.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = 100,
		["ClipSize"] = 70,
		["RPM"] = 65,
		["RPM_Burst"] = 200,
		["Sound"] = "weapons/bf3/e11_heavy.wav",
		["DamageType"] = DMG_DISSOLVE,
		["AmmoConsumption"] = 10,
	},
	
	["TracerName"] = "rw_sw_laser_purple",
	["MoveSpeed"] = 1,
}

function ATTACHMENT:Attach(wep)
	wep.ImpactEffect = "rw_sw_impact_purple"
	wep:Unload()
end

function ATTACHMENT:Detach(wep)
	wep.ImpactEffect = "rw_sw_impact_blue"
	wep:Unload()
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
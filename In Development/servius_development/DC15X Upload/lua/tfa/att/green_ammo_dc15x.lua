if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Anti-Armor Plasma"
ATTACHMENT.ShortName = "AAP" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
	TFA.AttachmentColors["="],"High energy ammo type - Slow rate of fire, heavy damage. Explosive plasma. CAUTION!",
	TFA.AttachmentColors["+"],"%200 Damage increase",
	TFA.AttachmentColors["+"],"Explosive Damage; Area of effect",
	TFA.AttachmentColors["+"],"Green Tracer",
	TFA.AttachmentColors["-"],"5 ammo per shot",
}
ATTACHMENT.Icon = "entities/tfa_ammo_fragshell.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.Damage = 60.5

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = 600,
		["ClipSize"] = 25,
		["DefaultClip"] = 25,
		["DamageTypeHandled"] = true,
		--["DamageType"] = DMG_DISSOLVE,
		["DamageType"] = DMG_BLAST,
		["AmmoConsumption"] = 1,
		["Ammo"] = "RPG_Round"
	},
	
	["TracerName"] = "tfa_tracer_incendiary",
	["MuzzleFlashEffect"] = "tfa_muzzleflash_sniper_energy", 
	["ImpactEffect"] = "Explosion",
	["MoveSpeed"] = .60,
	--["ImpactDecal"] = "Explosion",
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
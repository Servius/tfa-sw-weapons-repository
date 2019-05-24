if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Clip Expansion"
ATTACHMENT.ShortName = "CLIP" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
TFA.AttachmentColors["="],"Ammo Extension from 7 to 14",
TFA.AttachmentColors["+"],"%100 Clip Size increase",
TFA.AttachmentColors["-"],"%75 Clip Size increase",
}
ATTACHMENT.Icon = "entities/tfa_ammo_fragshell.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.Damage = 60.5

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["ClipSize"] = 14,
		["DefaultClip"] = 14,
	},
	["MoveSpeed"] = .75,
	
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
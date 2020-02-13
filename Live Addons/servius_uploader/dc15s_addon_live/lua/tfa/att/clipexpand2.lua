if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Clip Expansion"
ATTACHMENT.ShortName = "CLIP" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
TFA.AttachmentColors["="],"Ammo Extension from 35 to 50",
TFA.AttachmentColors["+"],"%30 Clip Size increase",
TFA.AttachmentColors["-"],"%95 Movement Speed",
}
ATTACHMENT.Icon = "entities/tfa_ammo_fragshell.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.Damage = 60.5

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["ClipSize"] = 50,
		["DefaultClip"] = 50,
	},
	["MoveSpeed"] = .95,
	
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
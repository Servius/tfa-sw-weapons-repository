if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Clip Expansion"
ATTACHMENT.ShortName = "CEx" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
TFA.AttachmentColors["="],"Ammo Extension from 75 to 125",
TFA.AttachmentColors["+"],"%33 Clip Size increase",
TFA.AttachmentColors["-"],"%90 Movement Speed",
}
ATTACHMENT.Icon = "entities/att_ext_ammo.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["ClipSize"] = 125,
	},
	["MoveSpeed"] = 0.9,
	
}

function ATTACHMENT:Attach(wep)
	wep:Unload()
end

function ATTACHMENT:Detach(wep)
	wep:Unload()
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
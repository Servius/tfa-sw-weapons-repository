if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Grappling Hook"
ATTACHMENT.ShortName = "HOOK" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
TFA.AttachmentColors["="],"Enables grappling hook on right click",
TFA.AttachmentColors["="],"Scrolling changes length of rope",
}
ATTACHMENT.Icon = "entities/tfa_ammo_fragshell.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.WeaponTable = {
	["data"] = {
		["ironsights"] = 0,
	},
	["GrappleEnabled"] = true,
	["MaxGrappleDist"] = 500,
	
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
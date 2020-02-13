if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Lazer Pointer"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
TFA.AttachmentColors["+"], "Can see in the dark.", 

}
ATTACHMENT.Icon = "entities/flashlight_512.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "LAZER"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["laser"] = {
			["active"] = true
		}
	},
	["WElements"] = {
		["lazer"] = {
			["active"] = true
		}
	},

}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Laser"
ATTACHMENT.ShortName = "L"
ATTACHMENT.Description = { 
	TFA.AttachmentColors["+"],"Added a laser",
}
ATTACHMENT.Icon = "entities/att_laser.png"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["laser3"] = {
			["active"] = true
		},
	},
	["WElements"] = {
		["lazer"] = {
			["active"] = true
		},
	},
}

function ATTACHMENT:Attach(wep)
end

function ATTACHMENT:Detach(wep)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
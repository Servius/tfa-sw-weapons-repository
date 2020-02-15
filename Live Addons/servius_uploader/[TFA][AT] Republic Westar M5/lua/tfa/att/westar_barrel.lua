if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Barrel Extension"
ATTACHMENT.ShortName = "BARL"
ATTACHMENT.Description = { 
	TFA.AttachmentColors["+"],"Adds a Barrel Extension that reduces RPM but increases damage by %20",
}
ATTACHMENT.Icon = "entities/mod_stun20_servius"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["barrel"] = {
			["active"] = true
		}
	},
	["WElements"] = {
		["barrel"] = {
			["active"] = true
			}
		},
	["Primary"] = {
		["RPM"] = 90,
		["Damage"] = function( wep, val) return val * 1.3 end,
	},
	["SelectiveFire"] = false,
	["DoMuzzleFlash"] = false,
	["CustomMuzzleFlash"] = false,
	
 }

function ATTACHMENT:Attach(wep)
end

function ATTACHMENT:Detach(wep)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
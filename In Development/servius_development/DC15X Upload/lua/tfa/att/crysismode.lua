if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Tactical Last Stand"
ATTACHMENT.ShortName = "TLS" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
TFA.AttachmentColors["="],"Skill combined with battle fever.",
TFA.AttachmentColors["+"],"200% boost in Clip Size",
TFA.AttachmentColors["+"],"200% Damage Boost",
TFA.AttachmentColors["-"],"60% Movement Speed",
TFA.AttachmentColors["-"],"400% Knockback Increase",
TFA.AttachmentColors["-"],"400% Ammo Consumption",
TFA.AttachmentColors["-"],"150% Horizontal Kick",
}
ATTACHMENT.Icon = "entities/tfa_ammo_fragshell.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.Damage = 60.5

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function( wep, val) return val * 2 end,
		["ClipSize"] = function( wep, val) return val * 2 end,
		["DefaultClip"] = function( wep, val) return val * 2 end,
		["AmmoConsumption"] = function( wep, val) return val * 4 end,
		["Knockback"] = function( wep, val) return val * 3 end,
		["KickHorizontal"] = 1.5,

	},
	["MaxChargeDMG"] = 300, 
	["MoveSpeed"] = .6,
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end		
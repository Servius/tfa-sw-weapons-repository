if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Blue Tibanna Stun Cartridges"
ATTACHMENT.ShortName = "BTSGC" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
TFA.AttachmentColors["="],"Stun ammo. Uses the same unique ammo as the explosive and assination types.",
TFA.AttachmentColors["-"],"%50 increase to Clip Size",
TFA.AttachmentColors["-"],"",
}
ATTACHMENT.Icon = "entities/tfa_ammo_fragshell.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.Damage = 8

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = 8,
		["ClipSize"] = 50,
		["DefaultClip"] = 50,
		["RPM"] = 200,
		["RPM_Burst"] = function( wep, val) return val * 0.75 end,
		["Spread"] = function( wep, val) return val * 2 end,
		["IronAccuracy"] = function( wep, val) return val * 10 end,
		["Force "] = 500,
		["AmmoConsumption"] = 5,
		["Ammo"] = "RPG_Round",
		["Sound"] = "weapons/bf3/e11_light.wav"
	},
	["MoveSpeed"] = 1.05,
	["TracerName"] = "effect_sw_laser_blue_stun",
	["CustomBulletCallback"] = function(a,b,c)
	TFA_RP_MeltEasy(a,b,c,8,"BGOLightning")
end
}



if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
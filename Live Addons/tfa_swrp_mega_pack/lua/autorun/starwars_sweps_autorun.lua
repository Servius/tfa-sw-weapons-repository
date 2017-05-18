
function AddAmmoType(name, text)
	game.AddAmmoType({name = name,
	dmgtype = DMG_BULLET,
	force = 10,
	maxsplash = 0,
	minsplash = 0,
	npcdmg = 0,
	plydmg = 0,
	tracer = 3})
	
	if CLIENT then
		language.Add(name .. "_ammo", text)
	end
end

AddAmmoType("taser_ammo", "Taser Cartridges")
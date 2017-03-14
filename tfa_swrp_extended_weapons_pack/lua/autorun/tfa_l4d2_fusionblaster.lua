game.AddParticles("particles/tfa_fubar_muzzle.pcf")
game.AddParticles("particles/tfa_fubar_particles.pcf")
game.AddParticles("particles/tfa_fubar_particles_aq.pcf")
game.AddParticles("particles/tfa_fubar_particles_blu.pcf")

PrecacheParticleSystem("tfa_muzzle_fubar")

PrecacheParticleSystem("weapon_fubar_trail")

PrecacheParticleSystem("weapon_fubar_beam")

PrecacheParticleSystem("weapon_fubar_rings")

PrecacheParticleSystem("weapon_fubar_rail")

PrecacheParticleSystem("weapon_fubar_rail_end")

PrecacheParticleSystem("weapon_fubar_rail_noise")

PrecacheParticleSystem("tfa_muzzle_fubar_blu")

PrecacheParticleSystem("weapon_fubar_trail_blu")

PrecacheParticleSystem("weapon_fubar_beam_blu")

PrecacheParticleSystem("weapon_fubar_rings_blu")

PrecacheParticleSystem("weapon_fubar_rail_blu")

PrecacheParticleSystem("weapon_fubar_rail_end_blu")

PrecacheParticleSystem("weapon_fubar_rail_noise_blu")

PrecacheParticleSystem("tfa_muzzle_fubar_aq")

PrecacheParticleSystem("weapon_fubar_trail_aq")

PrecacheParticleSystem("weapon_fubar_beam_aq")

PrecacheParticleSystem("weapon_fubar_rings_aq")

PrecacheParticleSystem("weapon_fubar_rail_aq")

PrecacheParticleSystem("weapon_fubar_rail_end_aq")

PrecacheParticleSystem("weapon_fubar_rail_noise_aq")

sound.Add({
	name = 			"TFA_FusionBlaster.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 		"weapons/tfa_fusionblaster/gunfire/sniper_military_fire_1.wav"
})

sound.Add({
	name = 			"TFA_FusionBlaster.Draw",
	channel = 		CHAN_USER_BASE+11,
	volume = 		1.0,
	sound = 		"weapons/tfa_fusionblaster/gunother/sniper_military_deploy_1.wav"
})

sound.Add({
	name = 			"TFA_FusionBlaster.BoltBack",
	channel = 		CHAN_USER_BASE+11,
	volume = 		1.0,
	sound = 		"weapons/tfa_fusionblaster/gunother/sniper_military_slideback_1.wav"
})

sound.Add({
	name = 			"TFA_FusionBlaster.BoltForward",
	channel = 		CHAN_USER_BASE+11,
	volume = 		1.0,
	sound = 		"weapons/tfa_fusionblaster/gunother/sniper_military_slideforward_1.wav"
})

sound.Add({
	name = 			"TFA_FusionBlaster.ClipOut",
	channel = 		CHAN_USER_BASE+12,
	volume = 		1.0,
	sound = 		"weapons/tfa_fusionblaster/gunother/sniper_military_clip_out_1.wav"
})

sound.Add({
	name = 			"TFA_FusionBlaster.ClipIn",
	channel = 		CHAN_USER_BASE+12,
	volume = 		1.0,
	sound = 		"weapons/tfa_fusionblaster/gunother/sniper_military_clip_in_1.wav"
})

sound.Add({
	name = 			"TFA_FusionBlaster.ClipLocked",
	channel = 		CHAN_USER_BASE+12,
	volume = 		1.0,
	sound = 		"weapons/tfa_fusionblaster/gunother/sniper_military_clip_locked_1.wav"
})
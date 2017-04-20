if SERVER then return end

net.Receive("TFAStarWars_nfy", function()
	local msg = net.ReadString()
	local ntype = net.ReadInt(6)
	local time = net.ReadInt(16)

	TFAStarWars:DoNotify(msg, ntype, time)
end)

net.Receive("TFAStarWars_Snd", function()
	surface.PlaySound(net.ReadString())
end)
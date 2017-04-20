	if SERVER then
		AddCSLuaFile()
		util.AddNetworkString("ThirdOTSPacket")
		util.AddNetworkString("ThirdOTSReq")

		net.Receive("ThirdOTSReq", function(len, ply)
			local t = net.ReadBool()
			local state = net.ReadBool()
			if t then
				ply:SetNW2Bool("ThirtOTS",  state)
			else
				ply:SetNW2Bool("ThirtOTS_SStatus", state)
			end
		end)

		hook.Add("PlayerSay", "open_ots_menu", function(ply, text, public)
			local text = string.lower(text)
			
			if (text == "!ots_menu" or text == "!thirdperson_menu" or text == "!3p_menu" or text == "!3rdperson_menu") then
				ply:ConCommand("open_ots_menu")
			return ""
		end
	end)

		hook.Add("PlayerSay", "thirdperson_ots", function(ply, text, public)
			local text = string.lower(text) -- Make the chat message entirely lowercase

			if (text == "!thirdperson" or text == "!3p" or text == "!thirdperson_ots" or text == "!3rdperson" or text == "!ots_thirdperson" or text == "!tp_ots") then
				ply:ConCommand("thirdperson_ots")
				return ""
			end
		end)
		
		hook.Add("PlayerSay", "thirdperson_ots_swap", function(ply, text, public)
			local text = string.lower(text) -- Make the chat message entirely lowercase

			if (text == "!thirdperson_swap" or text == "!3p_swap" or text == "!thirdperson_ots_swap" or text == "!3rdperson_swap" or text == "!ots_thirdperson_swap") then
				ply:ConCommand("thirdperson_ots_swap")
			return ""
		end
	end)
end
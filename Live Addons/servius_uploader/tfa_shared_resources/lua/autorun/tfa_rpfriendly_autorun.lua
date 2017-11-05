if SERVER then AddCSLuaFile() end

TFA_RPFRIENDLY = TFA_RPFRIENDLY or { }

TFA_RPFRIENDLY.Version = 1.1
TFA_RPFRIENDLY.VCheckLink = "https://raw.githubusercontent.com/Servius/tfa_base_rp_friendly/master/info.txt"

function TFA_RPFRIENDLY:DoNotify(...)
	local args = { ... }

	if SERVER then
		net.Start("TFA_RPFRIENDLY_nfy")
			net.WriteString(args[2])

			net.WriteInt(args[3] or -1, 6) 
			net.WriteInt(args[4] or -1, 16) 
		net.Send(args[1])
	else
		if args[1] == nil or not isstring(args[1]) then args[1] = "<empty>" end
		if args[2] == nil or args[2] == -1 or not isnumber(args[2]) then args[2] = NOTIFY_GENERIC end
		if args[3] == nil or args[3] == -1 or not isnumber(args[3]) then args[3] = 5 end

		notification.AddLegacy(args[1], args[2], args[3]) 
		surface.PlaySound("ambient/water/drip3.wav")
	end
end

function TFA_RPFRIENDLY:LoadFile(path)
	if SERVER then AddCSLuaFile(path) end
	include(path)

	--print("[Data] Loaded " .. path .. " file")
end

TFA_RPFRIENDLY:LoadFile("tfa_base_rp_friendly/net/server.lua")
TFA_RPFRIENDLY:LoadFile("tfa_base_rp_friendly/net/client.lua")

if SERVER then
	-- Version checker
	hook.Add("Initialize", "TFA_RPFRIENDLY_versionautocheck", function()
		-- For some reason it won't work without timer
		timer.Simple(0, function()
			http.Fetch(TFA_RPFRIENDLY.VCheckLink,
				function(body, len, headers, code)
					if not body then return end
					local info = util.JSONToTable(body)

					if info then
						local version = info.AddonInfo.Version

						if version == TFA_RPFRIENDLY.Version then
							MsgC(Color(0, 255, 0), "TFA RP Friendly Base up to date.\n")
							TFA_RPFRIENDLY.IsUpToDate = true
						else
							local msg1 = "Seems like one of your TFA Star Wars packs is outdated!\n"
							local msg2 = "New version: " .. version .. "\n"
							local msg3 = "Your version: " .. TFA_RPFRIENDLY.Version .. "!\n"
							MsgC(Color(255, 100, 80), msg1, msg2, msg3)
						end
					else
						print("Can't read TFA RP Friendly Base version.")
					end
				end,

				function(error)
					print("Cannot check version of your TFA RP Friendly Base!")
				end
			)
		end)
	end)
end

TFA_RPFRIENDLY.Loaded = true
hook.Run("TFA_RPFRIENDLY_loaded")

if SERVER then 
	MsgC(Color(0, 200, 255), "TFA RP Friendly Base has been loaded!\n") 
end
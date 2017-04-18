local function setup(p)
	p:AddControl("Label", { Text = "If these options won't work, try using console (~) or admin mod\nList of CVars can be found in the wand's main menu" })
	p:AddControl("Label", { Text = "" })
	p:AddControl("Label", { Text = "Global settings" })
--	p:AddControl("CheckBox", { Label = "Disable accuracy decreasing", Command = "TFAStarWars_sv_noaccuracy"})
--	p:AddControl("CheckBox", { Label = "Disable learning (Makes books useless and gives all spells to everyone)", Command = "TFAStarWars_sv_nolearning"})
--	p:AddControl("CheckBox", { Label = "Disable spell learning time", Command = "TFAStarWars_sv_notimer"})
--	p:AddControl("CheckBox", { Label = "Disable throwing NPCs/Players\n(Warning: it will also make spells such as Crucio and Stupefy useless)", Command = "TFAStarWars_sv_nothrowing"})
--	p:AddControl("CheckBox", { Label = "Disable chat spell name saying", Command = "TFAStarWars_sv_nosay"})
--	p:AddControl("CheckBox", { Label = "Spawn casted spells always in the center\nof caster's view", Command = "TFAStarWars_sv_spawncenter"})
--	p:AddControl("CheckBox", { Label = "Give a wand to the player on spawn", Command = "TFAStarWars_sv_givewand"})

	p:AddControl("Label", { Text = "" })
	p:AddControl("Label", { Text = "Other server settings" })

	--p:AddControl("Label", { Text = "Notify: Default animation speed value is 1.0" })
--	local slider = vgui.Create("DNumSlider", p)
--	slider:SetSize(150, 32)
--	slider:SetText("Animation speed")
--	slider:SetMin(0.1)
--	slider:SetMax(10)
--	slider:SetDecimals(1)
--	slider:SetConVar("TFAStarWars_sv_animspeed")

--	p:AddItem(slider)

	p:AddControl("Label", { Text = "In debug mode it will print stuff into your console about addon's working and help finding bugs, also it will enable Admin panel in singleplayer" })
	p:AddControl("CheckBox", { Label = "Debug mode", Command = "TFAStarWars_sv_debugmode"})

	p:AddControl("Label", { Text = "Use it if players don't receive spells when they join your server. It also might help you if it says that Wand might not working correctly when you spawn" })
	p:AddControl("CheckBox", { Label = "Use spell loading protection", Command = "TFAStarWars_sv_usesaver"})

	local btn = TFAStarWars.VGUI:CreateButton("Update spells for everyone", 0, 0, 150, 30, p, function() 
		net.Start("TFAStarWars_UpdSpells")
		net.SendToServer()
	end)
	p:AddItem(btn)
end

hook.Add("PopulateToolMenu", "TFAStarWars_options_server", function() 
	spawnmenu.AddToolMenuOption("Options", "Star Wars Weapon Settings", "TFAStarWars_options_server", "Server", "", "", setup) 
end)

TFAStarWars.VGUI.CreateServerOptions = setup
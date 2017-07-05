function TFA_RP_FRIENDLY_NOTIFY ()
	local ply = LocalPlayer()
				-- Notification panel
				NotifyPanel = vgui.Create( "DNotify" )
				NotifyPanel:SetPos( 15, 15 )
				NotifyPanel:SetSize( 150, 100 )
				NotifyPanel:SetLife(5)

				-- Gray background panel
				local bg = vgui.Create( "DPanel", NotifyPanel )
				bg:Dock( FILL )
				bg:SetBackgroundColor( Color( 64, 64, 64 ) )

				-- A yellow label message ( parented to background panel )
				local lbl = vgui.Create( "DLabel", bg )
				lbl:SetPos( 15, -15 )
				lbl:SetSize( 128, 128 )
				lbl:SetText( "Need help with the TFA Star Wars Sweps? tfa_starwars_menu in console!" )
				lbl:SetTextColor( Color( 255, 200, 0 ) )
				lbl:SetFont( "Default" )
				lbl:SetWrap( true )

				-- Add the background panel to the notification
				NotifyPanel:AddItem( bg )
			end
concommand.Add( "tfa_rp_friendly_notify", TFA_RP_FRIENDLY_NOTIFY )

function TFA_RP_FRIENDLY_MENU ()
	local ply = LocalPlayer()
	local BackGround = vgui.Create ( "DFrame" )
	BackGround:SetSize ( 400,400 )
	BackGround:Center()
	BackGround:SetTitle ( "TFA RP Friendly Menu" )
	BackGround:SetVisible ( true )
	BackGround:SetDraggable ( true )
	BackGround:ShowCloseButton ( true )
	BackGround:MakePopup()
	BackGround.Paint = function()
    	draw.RoundedBox( 8, 0, 0, BackGround:GetWide(), BackGround:GetTall(), Color( 0, 0, 0, 150 ) )
 	    draw.RoundedBox(2, 2, 2, BackGround:GetWide()-4, 21, Color(50,50,50,200))
    end

    local TabControl = vgui.Create( "DPropertySheet", BackGround )
	TabControl:Dock( FILL ) 


	local Help = vgui.Create( "DPanel", BackGround )
	Help.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 0 ) ) end
	Help:DockMargin( 0, 20, 0, 20 )
	Help:DockPadding( 0, 20, 0, 20 )

--	local OverTheShoulder = vgui.Create( "DPanel", BackGround )
--	OverTheShoulder.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 0 ) ) end
	
--	TabControl:AddSheet( "Third Person", OverTheShoulder, "icon16/user.png", false, false, "Description of first tab" )
	TabControl:AddSheet( "Help", Help, "icon16/user.png", false, false, "Description of first tab" )



----Thirdperson Tab	
--[[Center the players view.
    local CenterB = vgui.Create( "DButton", OverTheShoulder )
			CenterB:SetText( "Center your thirdperson view" )
			CenterB:SetTextColor( Color( 255, 255, 255 ) )
			CenterB:SetPos(220,100)
			CenterB:SetSize(160,30)
			CenterB.Paint = function()
				draw.RoundedBox(4,0,0, CenterB:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
			end
		CenterB.DoClick = function()
			ply:ConCommand("thirdperson_ots_right 0")	
			MsgC( Color( 255, 0, 0 ), "Thirdperson now centered\n" )
		end
--Reset the players view back to default.
local ResetB = vgui.Create( "DButton", OverTheShoulder )
			ResetB:SetText( "Reset your thirdperson view" )
			ResetB:SetTextColor( Color( 255, 255, 255 ) )
			ResetB:SetPos(20,100)
			ResetB:SetSize(160,30)
			ResetB.Paint = function()
				draw.RoundedBox(4,0,0, ResetB:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
			end
		ResetB.DoClick = function()
			ply:ConCommand("thirdperson_ots_right 20")
			ply:ConCommand("thirdperson_ots_crosshair 1")	
			ply:ConCommand("thirdperson_ots_fov 100")
			ply:ConCommand("thirdperson_ots_forward -35")
			ply:ConCommand("thirdperson_ots_crouched_up 15")
			ply:ConCommand("thirdperson_ots_up 0")
			MsgC( Color( 255, 0, 0 ), "Thirdperson reset to default paramaters!\n" )
		end
local Button = vgui.Create( "DButton", OverTheShoulder )
		Button:SetText( "Toggle Third Person" )
		Button:SetTextColor( Color( 255, 255, 255 ) )
		Button:SetPos(10,20)
		Button:SetSize(100,30)
		Button.Paint = function()
			draw.RoundedBox(4,0,0, Button:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
		end
		Button.DoClick = function()
			ply:ConCommand("say !tp_ots")
			MsgC( Color( 255, 0, 0 ), "Thirdperson toggled\n" )	
		end

--Swap the players view by the opposite of the players current setting. 
local Swap = vgui.Create( "DButton", OverTheShoulder )
		Swap:SetText( "Swap Shoulder View" )
		Swap:SetTextColor( Color( 255, 255, 255 ) )
		Swap:SetPos(250,50)
		Swap:SetSize(100,30)
			Swap.Paint = function()
				draw.RoundedBox(4,0,0, Swap:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
			end
		Swap.DoClick = function()
			ply:ConCommand("say !thirdperson_swap")	
			MsgC( Color( 255, 0, 0 ), "Thirdperson view swap\n" )
		end	
--Slider Left/Right
local SliderR = vgui.Create( "DNumSlider", OverTheShoulder )
	SliderR:SetPos( 50, 200 )			// Set the position
	SliderR:SetSize( 310, 40 )		// Set the size
	SliderR:SetText( "Left/Right" )	// Set the text above the slider
	SliderR:SetMin( -35 )				// Set the minimum number you can slide to
	SliderR:SetMax( 35 )				// Set the maximum number you can slide to
	SliderR:SetDecimals( 0 )			// Decimal places - zero for whole number
	SliderR:SetConVar( "thirdperson_ots_right" ) // Changes the ConVar when you slide
	SliderR.Paint = function()
			draw.RoundedBox(0,0,0, SliderR:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
		end--]]
---------Help Tab
			   local Support = vgui.Create( "DButton", Help )
				Support:SetSize(345, 40)
				Support:Dock( TOP )
				Support:DockMargin( 0, 10, 0, 10 )
				Support:SetText( "Having problems with the interface? Click here!" )
				Support:SetTextColor( Color( 255, 255, 255 ) )
				Support.Paint = function()
					draw.RoundedBox(0,0,0, Support:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
				Support.DoClick = function()
					gui.OpenURL( "https://github.com/Servius/tfa_base_rp_friendly/issues" )
					MsgC( Color( 255, 0, 0 ), "Support website opened!\n" )
				end
			end
			   local Development = vgui.Create( "DButton", Help )
				Development:SetSize(345, 40)
				Development:Dock( TOP )
				Development:DockMargin( 0, 10, 0, 10 )
				Development:SetText( "Wanna help develop the weapons\n or learn how to? Click Here!" )
				Development:SetTextColor( Color( 255, 255, 255 ) )
				Development.Paint = function()
					draw.RoundedBox(0,0,0, Development:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
				Development.DoClick = function()
					gui.OpenURL( "https://github.com/Servius/tfa-sw-weapons-repository/blob/master/README.md" )
					MsgC( Color( 255, 0, 0 ), "Development website opened!\n" )	
				end	
			end
			   local Diagnose = vgui.Create( "DButton", Help )
				Diagnose:SetSize(345, 40)
				Diagnose:Dock( TOP )
				Diagnose:DockMargin( 0, 10, 0, 10 )
				Diagnose:SetText( "Have an issue but wanna see if you can fix it now?\nClick here!" )
				Diagnose:SetTextColor( Color( 255, 255, 255 ) )
				Diagnose.Paint = function()
					draw.RoundedBox(0,0,0, Diagnose:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
				Diagnose.DoClick = function()
					gui.OpenURL( "https://github.com/Servius/tfa-sw-weapons-repository/blob/master/frequently_asked_questions.txt" )
					MsgC( Color( 255, 0, 0 ), "FAQ printed.\n" )	
				end	
			end
			   local TFABaseFriendly = vgui.Create( "DButton", Help )
				TFABaseFriendly:SetSize(345, 40)
				TFABaseFriendly:Dock( TOP )
				TFABaseFriendly:DockMargin( 0, 10, 0, 10 )
				TFABaseFriendly:SetText( "Are you using the TFA Starwars Specifc\n TFA Base? If not, Click Here!" )
				TFABaseFriendly:SetTextColor( Color( 255, 255, 255 ) )
				TFABaseFriendly.Paint = function()
					draw.RoundedBox(0,0,0, TFABaseFriendly:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
				TFABaseFriendly.DoClick = function()
					gui.OpenURL( "https://github.com/Servius/tfa_base_rp_friendly" )
					MsgC( Color( 255, 0, 0 ), "TFA Base Friendly link opened.\n" )	
				end	
			end
			   local Collection = vgui.Create( "DButton", Help )
				Collection:SetSize(345, 40)
				Collection:Dock( TOP )
				Collection:DockMargin( 0, 10, 0, 10 )
				Collection:SetText( "Double check you are using only\n compatible content." )
				Collection:SetTextColor( Color( 255, 255, 255 ) )
				Collection.Paint = function()
					draw.RoundedBox(0,0,0, Collection:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
				Collection.DoClick = function()
					gui.OpenURL( "http://steamcommunity.com/sharedfiles/filedetails/?id=909236894" )
					MsgC( Color( 255, 0, 0 ), "Compatible page opened\n" )	
				end	
			end
		end
concommand.Add( "tfa_rp_friendly_menu", TFA_RP_FRIENDLY_MENU )
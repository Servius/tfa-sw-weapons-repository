net.Receive("rp_friendly_menu", function()
	if ( !BackGround ) then
		local BackGround = vgui.Create( "DFrame" )
		BackGround:SetSize ( 400,400 )
		BackGround:SetSizable( true )
		BackGround:SetMinHeight( 400 )
		BackGround:SetMinWidth( 400 )
		BackGround:SetMinHeight
		BackGround:Center()
		BackGround:SetTitle ( "TFA RP Friendly Menu" )
		BackGround:SetVisible ( true )
		BackGround:SetDraggable ( true )
		BackGround:ShowCloseButton ( true )
		BackGround:SetScreenLock( true )
		BackGround:MakePopup()
		BackGround.Paint = function( self, w, h )
    		draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 0, 150 ) )
 	   	 	draw.RoundedBox(2, 2, 2, w = -4, h = 21, Color(50,50,50,200))
    	end
		BackGround:SetDeleteOnClose( true )
  --[[-------------------------------------------------------------------------
  Size Automation
  ---------------------------------------------------------------------------]]--
local x,y = BackGround:GetSize()
--[[-------------------------------------------------------------------------
Tab Controler and Tabs. 
---------------------------------------------------------------------------]]
 	local TabControl = vgui.Create( "DPropertySheet", BackGround )
	TabControl:Dock( FILL ) -- Protects the Tabs. 

	local Help = vgui.Create( "DPanel", BackGround )
	Help.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 0 ) ) end
	
	local OverTheShoulder = vgui.Create( "DPanel", BackGround )
	OverTheShoulder.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 0 ) ) end
	
	TabControl:AddSheet( "Third Person", OverTheShoulder, "icon16/user.png", false, false, "Description of first tab" )
	TabControl:AddSheet( "Help", Help, "icon16/user.png", false, false, "Description of first tab" )
end
--[[-------------------------------------------------------------------------
Thirdperson Center 
---------------------------------------------------------------------------]]
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
--[[-------------------------------------------------------------------------
Thirdperson setting reset
---------------------------------------------------------------------------]]
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
--[[-------------------------------------------------------------------------
Toggle Thirdperson
---------------------------------------------------------------------------]]
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
--[[-------------------------------------------------------------------------
Swap Thirdperson view
---------------------------------------------------------------------------]]. 
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
--[[-------------------------------------------------------------------------
Slider Left/Right
---------------------------------------------------------------------------]]
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
		end
--[[-------------------------------------------------------------------------
Help Buttons
---------------------------------------------------------------------------]]
			   local Support = vgui.Create( "DButton", Help )
				Support:SetSize(345, 40)
				Support:SetPos(15,10)
				Support:SetText( "Having problems with the interface? Click here!" )
				Support:SetTextColor( Color( 255, 255, 255 ) )
				Support.Paint = function()
					draw.RoundedBox(4,0,0, Support:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
				Support.DoClick = function()
					gui.OpenURL( "https://github.com/Servius/tfa_base_rp_friendly/issues" )
					MsgC( Color( 255, 0, 0 ), "Support website opened!\n" )
				end
			end
			   local Development = vgui.Create( "DButton", Help )
				Development:SetSize(345, 40)
				Development:SetPos(15,60)
				Development:SetText( "Wanna help develop the weapons\n or learn how to? Click Here!" )
				Development:SetTextColor( Color( 255, 255, 255 ) )
				Development.Paint = function()
					draw.RoundedBox(4,0,0, Development:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
				Development.DoClick = function()
					gui.OpenURL( "https://github.com/Servius/tfa-sw-weapons-repository/blob/master/README.md" )
					MsgC( Color( 255, 0, 0 ), "Development website opened!\n" )	
				end	
			end
			   local Diagnose = vgui.Create( "DButton", Help )
				Diagnose:SetSize(345, 40)
				Diagnose:SetPos(15,110)
				Diagnose:SetText( "Have an issue but wanna see if you can fix it now?\nClick here!" )
				Diagnose:SetTextColor( Color( 255, 255, 255 ) )
				Diagnose.Paint = function()
					draw.RoundedBox(4,0,0, Diagnose:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
				Diagnose.DoClick = function()
					gui.OpenURL( "https://github.com/Servius/tfa-sw-weapons-repository/blob/master/frequently_asked_questions" )
					MsgC( Color( 255, 0, 0 ), "FAQ printed.\n" )	
				end	
			end
			   local TFABaseFriendly = vgui.Create( "DButton", Help )
				TFABaseFriendly:SetSize(345, 40)
				TFABaseFriendly:SetPos(15,160)
				TFABaseFriendly:SetText( "Are you using the TFA Starwars Specifc\n TFA Base? If not, Click Here!" )
				TFABaseFriendly:SetTextColor( Color( 255, 255, 255 ) )
				TFABaseFriendly.Paint = function()
					draw.RoundedBox(4,0,0, TFABaseFriendly:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
				TFABaseFriendly.DoClick = function()
					gui.OpenURL( "https://github.com/Servius/tfa_base_rp_friendly" )
					MsgC( Color( 255, 0, 0 ), "TFA Base Friendly link opened.\n" )	
				end	
			end
			   local Collection = vgui.Create( "DButton", Help )
				Collection:SetSize(345, 40)
				Collection:SetPos(15,210)
				Collection:SetText( "Double check you are using only\n compatible content." )
				Collection:SetTextColor( Color( 255, 255, 255 ) )
				Collection.Paint = function()
					draw.RoundedBox(4,0,0, Collection:GetWide(), BackGround:GetTall(), Color( 41,128,185,250))
				Collection.DoClick = function()
					gui.OpenURL( "https://ell.stackexchange.com/questions/79316/doesnt-yet-exist-or-doesnt-exist-yet" )
					MsgC( Color( 255, 0, 0 ), "TFA Base Friendly link opened.\n" )	
				end	
			end
		end
concommand.Add( "rp_friendly_menu", rp_friendly_menu )
if SERVER then 

util.AddNetworkString ( "rp_friendly_menu" )

function rp_friendly_menu (ply)
	net.Start("rp_friendly_menu")
	net.Send( ply )
	return 
	print("Menu opened.")
end



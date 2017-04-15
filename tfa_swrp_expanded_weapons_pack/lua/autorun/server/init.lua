local function ExpandedPlug( )

print("Star Wars Expanded Pack Changelog 1.1")
print("===MOST RECENT UPDATE===")
print("- The TFA SWRP Expanded pack now requires the Redux base.")
print("- Scopes have been updated to use a scalable resolution. This fixes the white scope issue.")
print("- General changes to several gun mechanics.")
print("If you would like to help develop this pack or just track its progress please hop on the gitrepo found here:")
print("https://github.com/Servius/tfa-sw-weapons-repository")
end
hook.Add("PlayerInitialSpawn", "ExpandedUpdates", ExpandedPlug)
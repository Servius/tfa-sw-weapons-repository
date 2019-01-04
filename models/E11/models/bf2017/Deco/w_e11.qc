// Created by Crowbar 0.34.0.0

$ModelName "weapons\synbf3\w_e11.mdl"

$BodyGroup "studio"
{
	studio "w_e11_reference.smd"
}


$SurfaceProp "weapon"

$Contents "solid"

$MaxEyeDeflection 90

$CDMaterials "models\weapons\synbf3\w_models\e11\"

$Attachment "muzzle_flash" "ValveBiped.Weapon_bone" 13.1 0.8 -1.1 rotate -78.5 0 -180
$Attachment "shell_eject" "ValveBiped.Weapon_bone" 4 0.3 -0.2 rotate 0 90 -170

$CBox 0 0 0 0 0 0

$BBox -15.93 -0.945 -6.463 10.305 5.686 4.222


$Sequence "w_k98_idle" {
	"w_e11_anims\w_k98_idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$CollisionModel "w_e11_physics.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave

}

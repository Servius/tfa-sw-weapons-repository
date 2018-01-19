// Created by Crowbar 0.51.0.0

$modelname "weapons\w_IHR.mdl"

$bodygroup "studio"
{
	studio "w_IHR.smd"
}


$surfaceprop "weapon"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "models\weapons\w_models\IHR\"

$attachment "muzzle_flash" "ValveBiped.Weapon_bone" 0 0 0 rotate 0 0 0
$attachment "shell_eject" "ValveBiped.Weapon_bone" 4 0.3 -0.2 rotate 0 90 -170

$cbox 0 0 0 0 0 0

$bbox -16.12 -0.864 -4.908 14.54 2.916 5.869

// $hboxset "default"


$sequence "w_k98_idle" {
	"w_ihr_anims\w_k98_idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "w_ihr_physics.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}

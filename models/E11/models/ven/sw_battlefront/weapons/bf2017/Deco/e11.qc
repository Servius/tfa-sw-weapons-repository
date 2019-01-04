// Created by Crowbar 0.34.0.0

$ModelName "ven\SW_Battlefront\Weapons\bf2017\v_e11.mdl"

$BodyGroup "blastem"
{
	studio "e11_reference.smd"
}


$SurfaceProp "weapon"

$Contents "solid"

$MaxEyeDeflection 90

$MostlyOpaque

$CDMaterials "models\ven\sw_battlefront\weapons\e11\"

$CBox 0 0 0 0 0 0

$BBox -11.022 -1.298 0.007 9.326 3.543 8.043



$Sequence "draw" {
	"e11_anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	fps 60
}
$Sequence "fire" {
	"e11_anims\fire.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	fadein 0.2
	fadeout 0.2
	fps 60
}
$Sequence "origin" {
	"e11_anims\origin.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}
$Sequence "reload" {
	"e11_anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	fps 60
}
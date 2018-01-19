// Created by Crowbar 0.51.0.0

$modelname "weapons\synbf3\c_dh17.mdl"

$bodygroup "studio"
{
	studio "c_dh17_ref.smd"
}


$surfaceprop "default"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "models\weapons\synbf3\w_models\DH17\"
$cdmaterials "models\weapons\v_models\hands\"

$attachment "muzzle" "dh17" 0 -8.4 1.4 rotate 0 -90 -180

$cbox 0 0 0 0 0 0

$bbox -10.252 -11.277 -22.75 30.682 11.062 -1.004

$bonemerge "ValveBiped.Bip01_Spine4"
$bonemerge "ValveBiped.Bip01_Neck1"
$bonemerge "ValveBiped.Bip01_Head1"
$bonemerge "ValveBiped.Bip01_L_Clavicle"
$bonemerge "ValveBiped.Bip01_L_UpperArm"
$bonemerge "ValveBiped.Bip01_L_Forearm"
$bonemerge "ValveBiped.Bip01_L_Hand"
$bonemerge "ValveBiped.Bip01_L_Finger12"
$bonemerge "ValveBiped.Bip01_L_Finger1"
$bonemerge "ValveBiped.Bip01_L_Finger3"
$bonemerge "ValveBiped.Bip01_L_Finger4"
$bonemerge "ValveBiped.Bip01_L_Finger02"
$bonemerge "ValveBiped.Bip01_L_Finger21"
$bonemerge "ValveBiped.Bip01_L_Finger01"
$bonemerge "ValveBiped.Bip01_L_Finger0"
$bonemerge "ValveBiped.Bip01_L_Finger11"
$bonemerge "ValveBiped.Bip01_L_Finger22"
$bonemerge "ValveBiped.Bip01_L_Finger42"
$bonemerge "ValveBiped.Bip01_L_Finger2"
$bonemerge "ValveBiped.Bip01_L_Finger41"
$bonemerge "ValveBiped.Bip01_L_Finger32"
$bonemerge "ValveBiped.Bip01_L_Finger31"
$bonemerge "ValveBiped.Bip01_R_Finger32"
$bonemerge "ValveBiped.Bip01_R_Finger21"
$bonemerge "ValveBiped.Bip01_R_Finger22"
$bonemerge "ValveBiped.Bip01_R_Finger2"
$bonemerge "ValveBiped.Bip01_R_Finger02"
$bonemerge "ValveBiped.Bip01_R_Finger3"
$bonemerge "ValveBiped.Bip01_R_Finger01"
$bonemerge "ValveBiped.Bip01_R_Finger12"
$bonemerge "ValveBiped.Bip01_R_Finger0"
$bonemerge "ValveBiped.Bip01_R_Finger11"
$bonemerge "ValveBiped.Bip01_R_Finger1"
$bonemerge "ValveBiped.Bip01_R_Finger31"
$bonemerge "ValveBiped.Bip01_R_Finger42"
$bonemerge "ValveBiped.Bip01_R_Finger41"
$bonemerge "ValveBiped.Bip01_R_Finger4"
$bonemerge "ValveBiped.Bip01_R_Clavicle"
$bonemerge "ValveBiped.Bip01_R_UpperArm"
$bonemerge "ValveBiped.Bip01_R_Forearm"
$bonemerge "ValveBiped.Bip01_R_Hand"


$sequence "idle" {
	"c_dh17_anims\idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	snap
	fps 12
}

$sequence "shoot1" {
	"c_dh17_anims\shoot1.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event 6002 2 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 35.14
}

$sequence "shoot2" {
	"c_dh17_anims\shoot2.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event 6002 2 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 35.14
}

$sequence "shoot3" {
	"c_dh17_anims\shoot3.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event 6002 2 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 35.14
}

$sequence "reload" {
	"c_dh17_anims\reload.smd"
	activity "ACT_VM_RELOAD_EMPTY" 1
	fadein 0.2
	fadeout 0.2
	node "1"
	snap
	fps 32.93
}

$sequence "draw" {
	"c_dh17_anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	snap
	fps 30
}

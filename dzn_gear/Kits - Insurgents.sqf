/*
	EUROPEAN INSURGENTS
*/

kit_euroins_random = [
	"kit_euroins_r_ak74","kit_euroins_r_akm","kit_euroins_r_g3"
	,"kit_euroins_gr","kit_euroins_gr_akm"	
	,"kit_euroins_mg","kit_euroins_mg"	
	/* ,"kit_euroins_at","kit_euroins_at" */
	,"kit_euroins_mm"
];

#define 	NVG_NIGHT_ITEM	if (daytime < 9 || daytime > 18) then { "NVGoggles_OPFOR" } else { "" }
#define 	EUROINS_UNI	["CUP_U_O_Partisan_VSR_Mixed2","CUP_U_O_Partisan_VSR_Mixed1","CUP_U_O_Partisan_TTsKO_Mixed","CUP_U_O_Partisan_TTsKO","CUP_U_I_GUE_Woodland1","CUP_U_I_GUE_Flecktarn","CUP_U_I_GUE_Flecktarn3","CUP_U_I_GUE_Flecktarn2"]
#define 	EUROINS_HEAD	["H_Bandanna_cbr","H_Bandanna_camo", "H_MilCap_dgtl"]
#define 	EUROINS_GOGGLE	["G_Bandanna_oli","G_Bandanna_oli", ""]

#define	EUROINS_AK74		["rhs_weap_ak74","rhs_weap_aks74","rhs_weap_ak74m","rhs_weap_aks74u"],["rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK"]
#define	EUROINS_AK74GP	["rhs_weap_ak74n_gp25","rhs_weap_ak74m_fullplum_gp25","rhs_weap_ak74_gp25","rhs_weap_aks74n_gp25"],["rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK"]
#define	EUROINS_AKM		["rhs_weap_akms","rhs_weap_akm"],["rhs_30Rnd_762x39mm","rhs_30Rnd_762x39mm"]
#define	EUROINS_AKMGP		["rhs_weap_akm_gp25","rhs_weap_akms_gp25"],["rhs_30Rnd_762x39mm","rhs_30Rnd_762x39mm"]


kit_euroins_gr =	[
	["<EQUIPEMENT >>  ",EUROINS_UNI,"TRYK_V_harnes_od_L","",EUROINS_HEAD,EUROINS_GOGGLE],
	["<PRIMARY WEAPON >>  ",EUROINS_AK74GP,["rhs_acc_dtk","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemCompass","ItemWatch","ItemRadio",NVG_NIGHT_ITEM],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",8],["ACE_packingBandage",4],["PRIMARY MAG",1]]],
	["<VEST ITEMS >> ",[["HandGrenade",1],["rhs_mag_rdg2_black",2],["PRIMARY MAG",6],["rhs_VOG25",8]]],
	["<BACKPACK ITEMS >> ",[]]
];


kit_euroins_gr_akm = [
	["<EQUIPEMENT >>  ",EUROINS_UNI,"TRYK_V_harnes_od_L","",EUROINS_HEAD,EUROINS_GOGGLE],
	["<PRIMARY WEAPON >>  ",EUROINS_AKMGP,["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemCompass","ItemWatch","ItemRadio",NVG_NIGHT_ITEM],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",8],["ACE_packingBandage",4],["PRIMARY MAG",1]]],
	["<VEST ITEMS >> ",[["HandGrenade",1],["rhs_mag_rdg2_black",2],["PRIMARY MAG",6],["rhs_VOG25",8]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_euroins_mg =	[
	["<EQUIPEMENT >>  ",EUROINS_UNI,"TRYK_V_harnes_od_L","CUP_B_AlicePack_Khaki",EUROINS_HEAD,EUROINS_GOGGLE],
	["<PRIMARY WEAPON >>  ","CUP_lmg_PKM","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemCompass","ItemWatch","ItemRadio",NVG_NIGHT_ITEM],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",8],["ACE_packingBandage",4]]],
	["<VEST ITEMS >> ",[["HandGrenade",2],["rhs_mag_rdg2_black",2],["PRIMARY MAG",1]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",3]]]
]; 

kit_euroins_mm = 	[
	["<EQUIPEMENT >>  ",EUROINS_UNI,"TRYK_V_harnes_od_L","",EUROINS_HEAD,EUROINS_GOGGLE],
	["<PRIMARY WEAPON >>  ","rhs_weap_svdp_wd","rhs_10Rnd_762x54mmR_7N1",["","","rhs_acc_pso1m21_svd",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemCompass","ItemWatch","ItemRadio",NVG_NIGHT_ITEM],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",8],["ACE_packingBandage",4],["PRIMARY MAG",1]]],
	["<VEST ITEMS >> ",[["HandGrenade",1],["rhs_mag_rdg2_black",2],["PRIMARY MAG",8]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_euroins_at = [
	["<EQUIPEMENT >>  ",EUROINS_UNI,"TRYK_V_harnes_od_L","CUP_B_RPGPack_Khaki",EUROINS_HEAD,EUROINS_GOGGLE],
	["<PRIMARY WEAPON >>  ",EUROINS_AK74,["rhs_acc_dtk","","",""]],
	["<LAUNCHER WEAPON >>  ","rhs_weap_rpg7","rhs_rpg7_PG7V_mag",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemCompass","ItemWatch","ItemRadio",NVG_NIGHT_ITEM],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",8],["ACE_packingBandage",4],["PRIMARY MAG",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",8],["HandGrenade",3],["rhs_mag_rdg2_black",2]]],
	["<BACKPACK ITEMS >> ",[["SECONDARY MAG",3]]]
];


kit_euroins_r_ak74 = [
	["<EQUIPEMENT >>  ",EUROINS_UNI,"TRYK_V_harnes_od_L","",EUROINS_HEAD,EUROINS_GOGGLE],
	["<PRIMARY WEAPON >>  ",EUROINS_AK74,["rhs_acc_dtk","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemCompass","ItemWatch","ItemRadio",NVG_NIGHT_ITEM],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",8],["ACE_packingBandage",4],["PRIMARY MAG",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",8],["HandGrenade",3],["rhs_mag_rdg2_black",2]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_euroins_r_akm = [
	["<EQUIPEMENT >>  ",EUROINS_UNI,"TRYK_V_harnes_od_L","",EUROINS_HEAD,EUROINS_GOGGLE],
	["<PRIMARY WEAPON >>  ",EUROINS_AKM,["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemCompass","ItemWatch","ItemRadio",NVG_NIGHT_ITEM],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",8],["ACE_packingBandage",4],["PRIMARY MAG",3]]],
	["<VEST ITEMS >> ",[["HandGrenade",2],["rhs_mag_rdg2_black",2],["PRIMARY MAG",8]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_euroins_r_g3 = [
	["<EQUIPEMENT >>  ",EUROINS_UNI,"TRYK_V_harnes_od_L","",EUROINS_HEAD,EUROINS_GOGGLE],
	["<PRIMARY WEAPON >>  ","hlc_rifle_g3a3v","hlc_20rnd_762x51_b_G3",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemCompass","ItemWatch","ItemRadio",NVG_NIGHT_ITEM],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",8],["ACE_packingBandage",4],["PRIMARY MAG",3]]],
	["<VEST ITEMS >> ",[["HandGrenade",1],["rhs_mag_rdg2_black",2],["PRIMARY MAG",8]]],
	["<BACKPACK ITEMS >> ",[]]
];
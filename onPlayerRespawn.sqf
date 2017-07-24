if (!isNil { player getVariable "dzn_gear_kit" }) then {
	[player, player getVariable "dzn_gear_kit"] spawn dzn_fnc_gear_assignGear;
} else { 
	player call dzn_fnc_gear_plugin_assignByTable;
};
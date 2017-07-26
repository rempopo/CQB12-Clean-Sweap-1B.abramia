if (!isNil { player getVariable "dzn_gear_kit" }) then {
	[player, player getVariable "dzn_gear_kit"] spawn dzn_fnc_gear_assignGear;
} else { 
	[player, player getVariable "dzn_gear"] call dzn_fnc_gear_assignKit;
};
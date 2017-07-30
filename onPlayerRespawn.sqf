if (!isNil { player getVariable "dzn_gear_kit" }) then {
	[player, player getVariable "dzn_gear_kit"] spawn dzn_fnc_gear_assignGear;
} else { 
	[player, player getVariable "dzn_gear"] call dzn_fnc_gear_assignKit;
};


if (!isNil "GlobalDeathCounter") then {
	if (!playerConnectedFirstTime) then {
		GlobalDeathCounter = GlobalDeathCounter + 1;
		publicVariable "GlobalDeathCounter";
	} else {
		playerConnectedFirstTime = false;
	};
	
	hint parseText format[
		"<t size='2.5' color='#FFD000' shadow='1'>%1</t>
		<br /><br /><t color='#3793F0'>operators were lost</t>"
		, GlobalDeathCounter
	];
};

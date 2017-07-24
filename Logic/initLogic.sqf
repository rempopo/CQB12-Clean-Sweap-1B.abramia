MissionList = [
	["Pepinal", TaxiMission4, "Deployment4", HostilePrecenseLogic4, Mission4]
	,["Blanco", TaxiMission2, "Deployment2", HostilePrecenseLogic2, Mission2]
	,["Serval", TaxiMission1, "Deployment1", HostilePrecenseLogic1, Mission1]	
	,["Bella Aurora", TaxiMission3, "Deployment3", HostilePrecenseLogic3, Mission3]
	,["Albertin", TaxiMission5, "Deployment5", HostilePrecenseLogic5, Mission5]
];


KK_fnc_isEqual = {
	switch (_this select 0) do {
		case (_this select 1) : {true};
		default {false};
	};
};

dzn_fnc_checkAndUpdateMissionStatusClient = {
	// Show hint on mission completion
	if ( count MissionStatusInfoClient == count MissionStatusInfo ) then {
		for "_i" from 0 to (count MissionStatusInfo)-1 do {
			if !( [MissionStatusInfo select _i, MissionStatusInfoClient select _i] call KK_fnc_isEqual ) then {
				hint parseText format [
					"<t size='2' color='#FFD000' shadow='1'>COMPLETED</t>
					<br /><br /><t color='#3793F0'>Mission completed in </t>%1"
					, MissionList select _i select 0
				];		
			};
		};
	};
	
	// Re-add actions to HQ
	MissionStatusInfoClient = [] + MissionStatusInfo;
	removeAllActions HQ;
	{
		private _name = _x select 0;
		private _deployPos = getMarkerPos (_x select 2);
		
		private _nameFormatted = format [
			"<t color='#FFD000' align='left'>Deploy on %1</t><t align='right'>%2</t>"
			, _name
			, if (MissionStatusInfo select (_forEachIndex)) then { "<t color='#9dc938'>COMPLETED</t>" } else { "<t color='#e8e8e8'>IN PROGRESS</t>" }
		];
		
		[
			HQ
			, _nameFormatted
			, compile format ["player setPos %1; call dzn_fnc_showMissionHint;", _deployPos]
			, 10
		] call dzn_fnc_addAction;
	} forEach MissionList;
};

dzn_fnc_showMissionHint = {
	hint parseText format[
		"<t size='2' color='#FFD000' shadow='1'>Objective</t>
		<br /><br /><t color='#3793F0'>Eliminate all hostiles in the area</t>"
	];
};

if (hasInterface) then {
	MissionStatusInfoClient = [];
	{
		private _taxi = _x select 1;
		
		[
			_taxi
			, "<t color='#FFD000'>Return to base</t>"
			, { player setPos (getMarkerPos "respawn_west"); }
			, 8
		] call dzn_fnc_addAction;
	} forEach MissionList;

	{
		[_x, "<t color='#FFD000'>Arsenal</t>", {["Open", true] call BIS_fnc_Arsenal;}, 10] call dzn_fnc_addAction;	
	} forEach (synchronizedObjects ArsenalObjectsLogic);
	
	[] spawn {
		saveGearOnArsenalClose_opened = false;
		["saveGearOnArsenalClose", "onEachFrame", {
			if !(saveGearOnArsenalClose_opened) then {
				if !(isNull ( uinamespace getVariable "RSCDisplayArsenal" )) then {
					saveGearOnArsenalClose_opened = true;
				};
			} else {
				if (isNull ( uinamespace getVariable "RSCDisplayArsenal" )) then {
					saveGearOnArsenalClose_opened = false;
					player setVariable ["dzn_gear_kit", player call dzn_fnc_gear_getGear];
				};
			};
		}] call BIS_fnc_addStackedEventHandler;
	};
	
	[] spawn {
		while { true } do {
			sleep 5;
			if (!isNil "MissionStatusInfo" && { !(MissionStatusInfo isEqualTo MissionStatusInfoClient) }) then {
				call dzn_fnc_checkAndUpdateMissionStatusClient;
			};
		};		
	};
};

if (isServer || isDedicated) then {
	MissionStatusInfo = [];	
	CleanMarkers = [];
	CleanMarkersId = 0;
	{
		private _hostileLogic = _x select 3;
		private _zoneMarkers = [];
		// Create Markers for each mission
		{
			private _mrk = createMarker [format ["mrk_clean_%1", CleanMarkersId], getPos _x];			
			_mrk setMarkerShape "RECTANGLE";
			_mrk setMarkerSize [50,50];
			_mrk setMarkerAlpha 0.5;
			_mrk setMarkerColor "ColorRed";
			_mrk setMarkerBrush "Solid";
			_zoneMarkers pushBack [_mrk, _x];
			
			CleanMarkersId = CleanMarkersId + 1;
		} forEach (synchronizedObjects _hostileLogic);
		
		MissionStatusInfo pushBack false;		
		
		// Start Mission handler
		[(synchronizedObjects _hostileLogic), _forEachIndex] spawn {
			params ["_zoneTriggers","_missionId"];
			
			waitUntil { 
				sleep 15;		
				[_zoneTriggers, "resistance", "", "<1"] call dzn_fnc_ccUnits
			};
			
			MissionStatusInfo set [_missionId, true];
			publicVariable "MissionStatusInfo";			
		};
		
		CleanMarkers pushBack _zoneMarkers;
	} forEach MissionList;
	
	publicVariable "MissionStatusInfo";
	
	// Start Mission Markers color handler
	[] spawn {
		while { true } do {
			{
				private _missionId = _forEachIndex;
				// Set marker color - always green for completed missions, switch red/green for missions in progress
				{
					sleep .5;
					private _mrk = _x select 0;
					private _trg = _x select 1;
				
					if (MissionStatusInfo select _missionId) then {
						_mrk setMarkerColor "ColorGreen";					
					} else {				
						_mrk setMarkerColor  (if (
							[_trg, "resistance", "", "< 1"] call dzn_fnc_ccUnits
							&& [ _trg, "", "> 0"] call dzn_fnc_ccPlayers
						) then {
							"ColorGreen"
						} else {
							"ColorRed"
						});
					};
				} forEach _x;
			} forEach CleanMarkers;
		};
	};
};
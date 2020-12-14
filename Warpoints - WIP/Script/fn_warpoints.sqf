/*
    File: warpoints.sqf
	Copyright @ Jackdevo 2020 - dev@itsjack.dev
	Usage: 
	To get return current warpoints as integer:
		[0, unit] call life_fnc_warpoints;
	To add/remove warpoints:
		[1, unit, amount] call life_fnc_warpoints;
		
	NOTE: _unit, unit, _killer refer to:
			- PlayerID (Integer or String)
			- Player Object
			- Empty String (Current Player)
			
	When altering a players warpoints, the function will return True
	When retrieving a players warpoints, the function will returb False
*/

_mode = _this select 0;
_unit = _this select 1;
_returnValue = True;
//Check if unit input is an object
_checkedInput = false;
if ((typeName _unit) == "OBJECT") then {
	_checkedInput = true;
	_playerID = str (getPlayerUID _unit);
};
//Check if player input is an empty string
if ((_unit isEqualTo "") && !{_checkedInput}) then {
	_playerID = str (getPlayerUID player);
};
//If above checks fail, input assumed to be STR player ID
if (!{_checkedInput}) then {
	_playerID = str _playerID;
};


if (_mode isEqualTo 2) then { //Handle Player Killed
	_killer = _this select 2;
	_pidField = getText (missionConfigFile >> "Warpoints_Basic" >> "playerIDfield");
	if ((isPlayer _killer) && (isPlayer _unit) && (playerSide isEqualTo civilian) && {!(_killer isEqualTo _unit)}) then {
		_victimID = getPlayerUID _unit;
		_killerID = getPlayerUID _killer;

		_killerWeapon = currentWeapon _killer;
		_distance = _killer distance _unit;

		_activeMultiplier = 1;

		//Getting distance multiplier
		if (_distance < 300) then {
			_activeMultiplier = getNumber (missionConfigFile >> "Warpoints_Basic" >> "normalRange");
		};

		if (_distance > 300) then {
			_activeMultiplier = getNumber (missionConfigFile >> "Warpoints_Basic" >> "mediumRange");
		};

		if (_distance > 500) then {
			_activeMultiplier = getNumber (missionConfigFile >> "Warpoints_Basic" >> "longRange");
		};
		
		//Setting default warpoint values
		_killerWP = getNumber (missionConfigFile >> "Warpoints_Weapons" >> "default" >> "killer");
		_victimWP = getNumber (missionConfigFile >> "Warpoints_Weapons" >> "default" >> "victim");
		
		try {
			_killerWP = getNumber (missionConfigFile >> "Warpoints_Weapons" >> _killerWeapon >> "killer");
			_victimWP = getNumber (missionConfigFile >> "Warpoints_Weapons" >> _killerWeapon >> "victim");
		} catch {
			_killerWP = getNumber (missionConfigFile >> "Warpoints_Weapons" >> "default" >> "killer");
			_victimWP = getNumber (missionConfigFile >> "Warpoints_Weapons" >> "default" >> "victim");
		};
		
		
		//Distance Multipliers
		_killerWP = (_killerWP * _activeMultiplier);

		//Playerside checks
		if ((side _killer) isEqualTo independent) then {_killerWP = 0; _victimWP = 0;};
		if ((side _killer) isEqualTo west) then {_killerWP = 0;}; //If not civillian, don't gain any points
		
		
		//Add warpoints to database
		_victimQuery = format ["UPDATE players SET warpoints = warpoints - %1 WHERE %2 = %3 AND warpoints > 0",_victimWP,_pidField,_victimID];
		_killerQuery = format ["UPDATE players SET warpoints = warpoints + %1 WHERE %2 = %3",_killerWP,_pidField,_killerID];
		
		[_victimQuery,1] call DB_fnc_asyncCall;
		[_killerQuery,1] call DB_fnc_asyncCall;
		
		//Notify individuals of warpoints
		if (playerSide isEqualTo civilian) then {
			hint (format ["You have been killed and lost %1 warpoints",(0 - _victimWP), "error", "warpoints"]);
		};
		
		if (side _killer isEqualTo civilian) then {
			_text = format ["You killed someone and gained %1 warpoints", _killerWP];
			_text remoteExec ["hint", _killer];;
		};
	};
};

if (_mode isEqualTo 0) then { //Return warpoints as integer
	_query = format ["SELECT warpoints FROM players WHERE %2 = %3",_pidField,_playerID];
	_returnValue = [_query,2,True] call DB_fnc_asyncCall;
	_returnValue = returnValue select 0;
};
if (_mode isEqualTo 1) then { //Alter warpoints
	_warpoints = _this select 2;
	if (_warpoints >= 0) then {
		_query = format ["UPDATE players SET warpoints = warpoints + %1 WHERE %2 = %3 AND warpoints > 0",warpoints,_pidField,_playerID];
	} else {
		_query = format ["UPDATE players SET warpoints = warpoints - %1 WHERE %2 = %3 AND warpoints > 0",warpoints,_pidField,_playerID];
	};
	[_query,1] call DB_fnc_asyncCall;
};

_returnValue
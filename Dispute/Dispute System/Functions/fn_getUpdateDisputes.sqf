/*
#	File: fn_getUpdateDispute.sqf
#	Copyright © Jackdevo - dev@itsjack.dev
*/

_mode = _this select 0;
_return = [];
if (_mode isEqualTo "update") then {
	_player = _this select 1;
	_to = _this select 2;
	_reason = _this select 3;
	_query = format ["INSERT INTO disputes (timestamp, fromPID, toPID, fromName, toName, reason) VALUES (CURRENT_TIMESTAMP,'%1','%2','%3','%4','%5')",
					(getPlayerUID _player),
					(getPlayerUID _to),
					(name _player),
					(name _to),
					_reason
					];
	[_query, 1] call DB_fnc_asyncCall;
} else {
	_query = "SELECT timestamp, fromPID, toPID, fromName, toName, reason FROM disputes ORDER BY timestamp DESC LIMIT 20";
	_return = [_query, 2, false] call DB_fnc_asyncCall;
};
_return;
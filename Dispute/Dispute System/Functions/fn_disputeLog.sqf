/*
#	File: fn_disputeLog.sqf
#	Copyright © Jackdevo - dev@itsjack.dev
*/
#include "..\..\..\script_macros.hpp"

//Check if admin of required level
_reqAdminLevel = getNumber (missionConfigFile >> "DEVO_Dispute" >> "reqAdminLevel");
_adminNoPerms = getText (missionConfigFile >> "DEVO_Dispute" >> "notReqLevel");
if (FETCH_CONST(life_adminlevel) < _reqAdminLevel) exitWith {closeDialog 0; hint _adminNoPerms;};

//Update dispute logs
_disputeLog = ["recieve"] remoteExecCall ["DEVO_fnc_getUpdateDisputes", 2];



//Get display
disableSerialization;
waitUntil {!isNull findDisplay 9769};
private _display = findDisplay 9769;
private _logs = _display displayCtrl 9768;
lbClear _logs;



// Adds logs to list
{
	_timestamp = _x select 0;
	_fromPID = _x select 1;
	_toPID = _x select 2;
	_fromName = _x select 3;
	_toName = _x select 4;
	_reason = _x select 5;
	
	_formattedStr = format ["%1 (%2) disputed %3 (%4) for '%5' at %6",
							_fromName,
							_fromPID,
							_toName,
							_toPID,
							_reason,
							_timestamp
							];
	_logs lbAdd _formattedStr;
	_logs lbSetData [(lbSize _logs)-1,str(_formattedStr)];
} forEach _disputeLog;

lbSetCurSel [9768,0];
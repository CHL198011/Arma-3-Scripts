/*
#	File: fn_sendDispute.sqf
#	Copyright © Jackdevo - dev@itsjack.dev
*/

private ["_reason","_to", "_notif", "_fromName", "_reason","_reasonNotif"];
_reason = format ["%1",(lbData[9763,(lbCurSel 9763)])];
ctrlShow[9764,false];
_noPlayerError = getText (missionConfigFile >> "DEVO_Dispute" >> "noPlayerError");
if (lbCurSel 9762 isEqualTo -1) exitWith { hint _noPlayerError; ctrlShow[9764,true];};

_to = call compile format ["%1",(lbData[9762,(lbCurSel 9762)])];
if (isNull _to) exitWith {ctrlShow[9764,true];};
if (isNil "_to") exitWith {ctrlShow[9764,true];};
_noReasonError = getText (missionConfigFile >> "DEVO_Dispute" >> "noReasonError");
if (_reason isEqualTo "") exitWith { hint _noReasonError; ctrlShow[9764,true];};

_fromName = name player;
_disputeNotif = getText (missionConfigFile >> "DEVO_Dispute" >> "disputeNotif");
_notif = format [_disputeNotif,_fromName, _reason];

//Send dispute to other player
_notif remoteExec ["hint", _to];
_disputeSent = getText (missionConfigFile >> "DEVO_Dispute" >> "disputeSent");
hint _disputeSent;


//Log dispute to database
["update", player ,_to, _reason] remoteExecCall ["DEVO_fnc_getUpdateDisputes", 2];


closeDialog 0;
/*
#	File: fn_dispute.sqf
#	Copyright © Jackdevo - dev@itsjack.dev
*/
disableSerialization;
_reasons = getArray (missionConfigFile >> "DEVO_Dispute" >> "disputeReasons");

waitUntil {!isNull findDisplay 9761};
private _display = findDisplay 9761;
private _units = _display displayCtrl 9762;
lbClear _units;

// Sets the List with the players name and Faction
{
    if (!(_x isEqualTo player)) then {
        _units lbAdd format ["%1",_x getVariable ["realname",name _x]];
        _units lbSetData [(lbSize _units)-1,str(_x)];
    };
} forEach playableUnits;

_reason = _display displayCtrl 9763;
lbClear _reason;
{
	_reason lbAdd _x;
	_reason lbSetData [(lbSize _reason)-1,str(_x)];
} forEach _reasons;

lbSetCurSel [9762,0];
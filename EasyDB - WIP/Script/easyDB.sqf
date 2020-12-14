/*
#	File: simpleDB.sqf
#	Description: Easily get, and update database fields
#	Copyright © Jackdevo - dev@itsjack.dev


	Input Params:
		0 - Player to edit field of: Player ID (Int/Str) / Unit Object (Obj) / Empty String (This Player)
		1 - Database Table (Str)
		2 - Database Field (Str)
		3 - Value (Int / Str) - Either value to update, or "get" to get data from db
	
	To Do:
		- Test
*/

//Check if player input is an object
_checkedInput = false;
if ((typeName _toEdit) == "OBJECT") then {
	_checkedInput = true;
	_playerID = str (getPlayerUID _toEdit);
};
//Check if player input is an empty string
if ((_toEdit isEqualTo "") && !{_checkedInput}) then {
	_playerID = str (getPlayerUID player);
};
//If above checks fail, input assumed to be STR player ID
if (!{_checkedInput}) then {
	_playerID = str _playerID;
};


_result;



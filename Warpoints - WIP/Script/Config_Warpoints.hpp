/*
    File: Config_Warpoints.hpp
	Copyright @ Jackdevo 2020 - dev@itsjack.dev
	Desctription: Sets points given and taken when killing/getting killed by weapons
*/


//IMPORTANT: All numbers in this config should be INTEGER, decimals will break the database!!

class Warpoints_Basic {
	//Distance Multipliers (warpoint values * multiplier) for specific distances.
	normalRange = 1; //Normal (0 - 299.99 metres)
	mediumRange = 2; //Medium (300 - 500 metres)
	longRange = 3; //Long (500+ metres)
	
	//DB setup
	playerIDfield = "pid"; //Database Field for players Player ID
	
};

class Warpoints_Weapons {
	//If player killed by weapon not in config, default values added/lost to victim/killer
	class default {
		victim = -1; //Victim = player killed, should usually be a negative or 0 value
		killer = 1; //Killer = Player that killed the victim. Should usually have a positive or 0 value.
	};
	
	class hgun_Rook40_F { //Rook-40 9 mm
		victim = -1;
		killer = 1;
	};
	
	//Etc
	
	/*
		To add a weapon to this configuration, simply copy and paste the default class,
		and rename it to the classname of the the weapon you want to add.
	*/

};
class dispute {
	idd = 9761;
    name= "DEVO_dispute";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn DEVO_fnc_dispute";
	
	class ControlsBackground
	{
		class bg
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.34375;
			y = safeZoneY + safeZoneH * 0.42;
			w = safeZoneW * 0.3125;
			h = safeZoneH * 0.25666667;
			style = 0;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {0.7451,0.8941,0.0392,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	class Controls
	{
		class title
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.34375;
			y = safeZoneY + safeZoneH * 0.37111112;
			w = safeZoneW * 0.3125;
			h = safeZoneH * 0.03666667;
			style = 2;
			text = "Dispute Menu";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class players
		{
			type = 5;
			idc = 9762;
			x = safeZoneX + safeZoneW * 0.36875;
			y = safeZoneY + safeZoneH * 0.46888889;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.12888889;
			style = 16;
			colorBackground[] = {0.102,0.102,0.102,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.302,0.302,0.302,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class disputeBtn
		{
			type = 1;
			idc = 9764;
			x = safeZoneX + safeZoneW * 0.44375;
			y = safeZoneY + safeZoneH * 0.61666667;
			w = safeZoneW * 0.111875;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Dispute";
			borderSize = 0;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorBackgroundActive[] = {0,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0;
			offsetPressedY = 0;
			offsetX = 0;
			offsetY = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[] call DEVO_fnc_sendDispute;";
			
		};
		class reason
		{
			type = 5;
			idc = 9763;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.46888889;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.12888889;
			style = 16;
			colorBackground[] = {0.102,0.102,0.102,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.302,0.302,0.302,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class playersTitle
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.36875;
			y = safeZoneY + safeZoneH * 0.42;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			style = 2;
			text = "Players";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class reasonTitle
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.42;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			style = 2;
			text = "Reason";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	
};
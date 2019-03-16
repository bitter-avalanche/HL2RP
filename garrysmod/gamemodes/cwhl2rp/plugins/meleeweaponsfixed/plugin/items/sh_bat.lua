	
	local ITEM = Clockwork.item:New( "weapon_base" );
	ITEM.name = "Baseball Bat";
	ITEM.spawnValue = 0.05;
	ITEM.uniqueID = "cw_baseballbat";
	ITEM.category = "Melee Weapons";
	ITEM.cost = 240;
	ITEM.model = "models/weapons/w_basball.mdl";
	ITEM.weight = 2;
	ITEM.business = true;
	ITEM.isAttachment = false;
	ITEM.access = "V";
	ITEM.description = "Looks like it can be used as a blunt weapon.";

	ITEM:Register();
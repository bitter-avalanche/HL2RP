	
	local ITEM = Clockwork.item:New( "weapon_base" );
	ITEM.name = "Shovel";
	ITEM.spawnValue = 0.07;
	ITEM.uniqueID = "cw_shovel";
	ITEM.category = "Melee Weapons";
	ITEM.cost = 200;
	ITEM.model = "models/weapons/w_shovel.mdl";
	ITEM.weight = 2;
	ITEM.business = true;
	ITEM.isAttachment = false;
	ITEM.access = "V";
	ITEM.description = "Looks like it can be used as a blunt weapon.";

	ITEM:Register();
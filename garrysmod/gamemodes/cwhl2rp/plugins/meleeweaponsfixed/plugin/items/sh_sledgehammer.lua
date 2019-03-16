	
	local ITEM = Clockwork.item:New( "weapon_base" );
	ITEM.name = "Sledgehammer";
	ITEM.uniqueID = "cw_sledgehammer";
	ITEM.category = "Melee Weapons";
	ITEM.cost = 320;
	ITEM.model = "models/weapons/w_sledgehammer.mdl";
	ITEM.weight = 2;
	ITEM.business = true;
	ITEM.isAttachment = false;
	ITEM.access = "V";
	ITEM.description = "A heavy blunt weapon.";

	ITEM:Register();
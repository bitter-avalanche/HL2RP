	
	local ITEM = Clockwork.item:New( "weapon_base" );
	ITEM.name = "Axe";
	ITEM.uniqueID = "cw_woodaxe";
	ITEM.category = "Melee Weapons";
	ITEM.cost = 280;
	ITEM.model = "models/weapons/w_axe.mdl";
	ITEM.weight = 2;
	ITEM.business = true;
	ITEM.isAttachment = false;
	ITEM.access = "V";
	ITEM.description = "Axe - A heavy slashing weapon.";

	ITEM:Register();
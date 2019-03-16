	
	local ITEM = Clockwork.item:New( "weapon_base" );
	ITEM.name = "Katana";
	ITEM.uniqueID = "cw_katana";
	ITEM.category = "Melee Weapons";
	ITEM.cost = 360;
	ITEM.model = "models/weapons/w_katana.mdl";
	ITEM.weight = 2;
	ITEM.business = true;
	ITEM.isAttachment = false;
	ITEM.access = "V";
	ITEM.description = "A vicious slashing weapon";

	ITEM:Register();
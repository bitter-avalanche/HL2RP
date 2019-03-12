local ITEM = Clockwork.item:New();

ITEM.name = "Boxed Fridge";
ITEM.uniqueID = "boxfridge";
ITEM.model = "models/props_junk/wood_crate002a.mdl";
ITEM.plural = "Boxed Fridges";
ITEM.weight = 20;
ITEM.category = "Furniture";
ITEM.useText = "Open";
ITEM.business = true;
ITEM.batch = 1;
ITEM.description = "A metal refridgerator. Just plug it in, and pray you don't get electrocuted.";
ITEM:AddRecipe("toolboxsmall", 1, "sheetmetal", 4, "electronics", 2, "steelnails", 1);

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if (Schema:PlayerIsCombine(player)) then
		Clockwork.player:Notify(player, {"You cannot open this up! Perhaps ask a Citizen to do the dirty work?"});
		
		return false;
	elseif (player:GetFaction() == FACTION_ADMIN) then
		Clockwork.player:Notify(player, {"You cannot open this up! Why would you? This is beneath you!"});
		
		return false;
	else
		
		player:GiveItem(Clockwork.item:CreateInstance("refridgerator"), true);
	end;
end;
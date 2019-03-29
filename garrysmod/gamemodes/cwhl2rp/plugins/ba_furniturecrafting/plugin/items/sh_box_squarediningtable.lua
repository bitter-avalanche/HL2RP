local ITEM = Clockwork.item:New();

ITEM.name = "Boxed Square Dining Table";
ITEM.uniqueID = "boxsquarediningtab";
ITEM.model = "models/items/item_item_crate.mdl";
ITEM.plural = "Boxed Square Dining Tables";
ITEM.weight = 4;
ITEM.category = "Furniture";
ITEM.useText = "Open";
ITEM.business = true;
ITEM.batch = 1;
ITEM.description = "A square dining table. The quality is piss poor, but it looks like it should hold your food up just fine.";
ITEM:AddRecipe("toolboxsmall", 1, "largeply", 1, "woodtiny", 4, "steelnails", 1);

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
		
		player:GiveItem(Clockwork.item:CreateInstance("squarediningtab"), true);
	end;
end;
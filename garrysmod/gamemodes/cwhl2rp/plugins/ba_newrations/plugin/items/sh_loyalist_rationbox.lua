--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Loyalist Tier Ration Box";
ITEM.uniqueID = "gloyalist_rationbox";
ITEM.model = "models/pg_plops/pg_food/pg_tortellinap.mdl";
ITEM.weight = 2;
ITEM.useText = "Open";
ITEM.description = "A white and blue box. What have they given you this time?";

-- Called when a player attempts to pick up the item.
function ITEM:CanPickup(player, quickUse, itemEntity)
	if (quickUse) then
		if (!player:CanHoldWeight(self.weight)) then
			Clockwork.player:Notify(player, {"YourInventoryFull"});
			
			return false;
		end;
	end;
end;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if (Schema:PlayerIsCombine(player)) then
		Clockwork.player:Notify(player, {"YouCannotOpenRation"});
		
		return false;
	elseif (player:GetFaction() == FACTION_ADMIN) then
		Clockwork.player:Notify(player, {"YouCannotOpenRation"});
		
		return false;
	else
		
		player:GiveItem(Clockwork.item:CreateInstance("loyalist_supplements"), true);
		player:GiveItem(Clockwork.item:CreateInstance("loyalist_water"), true);
		player:GiveItem(Clockwork.item:CreateInstance("loyalist_mre"), true);
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
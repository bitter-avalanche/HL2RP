--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Civil Protection Tier Ration Box";
ITEM.uniqueID = "gcp_rationbox";
ITEM.model = "models/pg_plops/pg_food/pg_tortellinac.mdl";
ITEM.weight = 2;
ITEM.useText = "Open";
ITEM.description = "A black box. What have they given you this time?";

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
	if (player:GetFaction() == FACTION_ADMIN) then
		Clockwork.player:Notify(player, {"YouCannotOpenRation"});
		
		return false;
	else
		
		player:GiveItem(Clockwork.item:CreateInstance("cp_supplements"), true);
		player:GiveItem(Clockwork.item:CreateInstance("cp_water"), true);
		player:GiveItem(Clockwork.item:CreateInstance("cp_mre"), true);
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
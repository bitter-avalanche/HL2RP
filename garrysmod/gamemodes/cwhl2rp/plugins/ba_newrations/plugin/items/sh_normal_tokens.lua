--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Standard Tier Token Bag";
ITEM.uniqueID = "gstandard_tokenbag";
ITEM.model = "models/foodnhouseholdaaaaa/combirationa.mdl";
ITEM.weight = 2;
ITEM.useText = "Open";
ITEM.description = "A bag containing valuable money.";

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
		Clockwork.player:GiveCash(player, 15, {"CashRationPacket"});
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
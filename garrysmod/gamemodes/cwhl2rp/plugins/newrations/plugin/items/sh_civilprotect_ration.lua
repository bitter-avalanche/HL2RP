--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Civil Protection Grade Ration Unit";
ITEM.uniqueID = "gcp_ration";
ITEM.model = "models/weapons/w_packatm.mdl";
ITEM.weight = 2;
ITEM.useText = "Open";
ITEM.description = "A Civil Protection Tier ration unit. Now in a stylish black packaging.";

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
	elseif (player:GetFaction() == FACTION_CITIZEN) then
		Clockwork.player:Notify(player, {"YouCannotOpenRation"});
		
		return false;
	elseif (player:GetFaction() == FACTION_UUSCI) then
		Clockwork.player:Notify(player, {"YouCannotOpenRation"});
		
		return false;
	elseif (player:GetFaction() == FACTION_CWU) then
		Clockwork.player:Notify(player, {"YouCannotOpenRation"});
		
		return false;
	else
		
		player:GiveItem(Clockwork.item:CreateInstance("gcp_rationbox"), true);
		player:GiveItem(Clockwork.item:CreateInstance("gcp_tokenbag"), true);
		
		Clockwork.plugin:Call("PlayerUseRation", player);
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
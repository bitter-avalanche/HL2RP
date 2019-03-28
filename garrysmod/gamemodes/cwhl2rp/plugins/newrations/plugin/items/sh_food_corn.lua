--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Corn on the Cob";
ITEM.uniqueID = "food_corn";
ITEM.model = "models/bioshockinfinite/porn_on_cob.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Corn on a cob. So long as you do nothing dumb with this.";
ITEM.business = true;
ITEM.cost = 10;
ITEM.access = "1";
ITEM.hunger = 5;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
local ITEM = Clockwork.item:New();

ITEM.name = "Large - Plywood";
ITEM.uniqueID = "largeply";
ITEM.model = "models/props_highway/plywood_02.mdl";
ITEM.plural = "Large - Plywood";
ITEM.weight = 2;
ITEM.category = "Tools and Materials";
ITEM.description = "A large piece of plywood. Useless, unless you can handle a hammer.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
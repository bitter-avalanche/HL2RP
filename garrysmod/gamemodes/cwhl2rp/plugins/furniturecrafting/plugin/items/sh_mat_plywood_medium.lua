local ITEM = Clockwork.item:New();

ITEM.name = "Medium - Plywood";
ITEM.uniqueID = "mediumply";
ITEM.model = "models/props_highway/plywood_01.mdl";
ITEM.plural = "Medium - Plywood";
ITEM.weight = 1;
ITEM.category = "Tools and Materials";
ITEM.description = "A medium-sized piece of plywood. Not that useful, unless you can handle a hammer and some nails.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
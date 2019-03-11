local ITEM = Clockwork.item:New();

ITEM.name = "Toolbox";
ITEM.uniqueID = "toolboxsmall";
ITEM.cost = 25;
ITEM.model = "models/props_survival/cases/case_tools.mdl";
ITEM.plural = "Toolboxes";
ITEM.weight = 2;
ITEM.access = "1";
ITEM.business = true;
ITEM.category = "Tools and Materials";
ITEM.description = "A Toolbox, bearing the Combine logo. This one is a light blue color. Contains a range of commonly found tools.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
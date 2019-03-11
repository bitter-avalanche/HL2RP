local ITEM = Clockwork.item:New();

ITEM.name = "Square Dining Table";
ITEM.uniqueID = "squarediningtab";
ITEM.model = "models/props_c17/FurnitureTable002a.mdl";
ITEM.plural = "Square Dining Tables";
ITEM.weight = 4;
ITEM.category = "Furniture";
ITEM.description = "A square dining table. The quality is piss poor, but it looks like it should hold your food up just fine.";
ITEM:AddRecipe("toolboxsmall", 1, "largeply", 1, "woodtiny", 4, "steelnails", 1);

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
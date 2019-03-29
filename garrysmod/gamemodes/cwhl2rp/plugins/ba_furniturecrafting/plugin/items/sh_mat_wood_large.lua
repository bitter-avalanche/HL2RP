local ITEM = Clockwork.item:New();

ITEM.name = "Wood Board - Large";
ITEM.uniqueID = "woodlarge";
ITEM.model = "models/props_debris/wood_board05a.mdl";
ITEM.plural = "Wood Board - Large";
ITEM.weight = 2;
ITEM.category = "Tools and Materials";
ITEM.description = "A large wooden board. Useless, unless you can handle a hammer.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
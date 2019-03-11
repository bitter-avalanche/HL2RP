local ITEM = Clockwork.item:New();

ITEM.name = "Wood Board - Small";
ITEM.uniqueID = "woodsmall";
ITEM.model = "models/props_debris/wood_board06a.mdl";
ITEM.plural = "Wood Board - Small";
ITEM.weight = 1;
ITEM.category = "Tools and Materials";
ITEM.description = "A small wooden board. Useless, unless you can handle a hammer.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
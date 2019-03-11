local ITEM = Clockwork.item:New();

ITEM.name = "Wood Board - Tiny";
ITEM.uniqueID = "woodtiny";
ITEM.model = "models/props_debris/wood_board04a.mdl";
ITEM.plural = "Wood Board - Tiny";
ITEM.weight = 0.5;
ITEM.category = "Tools and Materials";
ITEM.description = "A tiny wooden board. Useless, unless you can handle a hammer.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
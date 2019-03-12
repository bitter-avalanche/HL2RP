local ITEM = Clockwork.item:New();

ITEM.name = "Electronics";
ITEM.uniqueID = "electronics";
ITEM.model = "models/gibs/shield_scanner_gib1.mdl";
ITEM.plural = "Electronics";
ITEM.weight = 0.5;
ITEM.category = "Tools and Materials";
ITEM.description = "A piece of electronical equipment. Probably used in something that consumes energy.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
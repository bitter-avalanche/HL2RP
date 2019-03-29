local ITEM = Clockwork.item:New();

ITEM.name = "Cardboard Sheet";
ITEM.uniqueID = "cardboardsheet";
ITEM.model = "models/props_junk/cardboard_box002a_gib01.mdl";
ITEM.plural = "Cardboard Sheets";
ITEM.weight = 0.5;
ITEM.category = "Tools and Materials";
ITEM.description = "Cardboard Sheet. Anyone feel like camping out at McDonalds tonight?";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
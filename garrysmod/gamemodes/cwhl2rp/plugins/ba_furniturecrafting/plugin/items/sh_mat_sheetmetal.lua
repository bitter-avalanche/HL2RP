local ITEM = Clockwork.item:New();

ITEM.name = "Sheet Metal";
ITEM.uniqueID = "sheetmetal";
ITEM.model = "models/props/de_mirage/sheetmetal_shard_7.mdl";
ITEM.plural = "Sheet Metal";
ITEM.weight = 1;
ITEM.category = "Tools and Materials";
ITEM.description = "A sheet of metal. Probably used in metallic furniture or contraptions.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
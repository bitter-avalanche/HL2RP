local ITEM = Clockwork.item:New();

ITEM.name = "Steel Nails";
ITEM.uniqueID = "steelnails";
ITEM.model = "models/props_lab/box01a.mdl";
ITEM.plural = "Steel Nails";
ITEM.weight = 0.5;
ITEM.category = "Tools and Materials";
ITEM.description = "A box with some steel nails. Be careful of your fingers, there are no tetanus shots.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
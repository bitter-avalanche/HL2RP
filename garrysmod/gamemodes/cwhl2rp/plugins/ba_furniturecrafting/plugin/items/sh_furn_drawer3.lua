local ITEM = Clockwork.item:New("container_base");

ITEM.name = "Tall Drawers";
ITEM.uniqueID = "talldrawers3";
ITEM.model = "models/props_c17/FurnitureDrawer003a.mdl";
ITEM.plural = "Tall Drawers";
ITEM.weight = 4;
ITEM.category = "Furniture";
ITEM.batch = 1;
ITEM.useText = "Open";
ITEM.description = "Tall drawers. I wouldn't put anything heavy in here as it looks like it might collapse out of misery alone.";
ITEM.storageSpace = 6;

-- Called when a player tries to use the item in inventory. Doesn't remove 'open' from the list, but does nothing.

function ITEM:OnUse(player, itemEntity)
    if (IsValid(itemEntity)) then
        self:OpenFor(player, itemEntity);
    end;

    return false;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
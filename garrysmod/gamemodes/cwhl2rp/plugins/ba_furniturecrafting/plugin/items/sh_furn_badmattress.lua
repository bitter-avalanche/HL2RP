local ITEM = Clockwork.item:New("container_base");

ITEM.name = "Dirty Mattress";
ITEM.uniqueID = "dirtymatt";
ITEM.model = "models/props_c17/FurnitureDrawer003a.mdl";
ITEM.plural = "Bad Mattresses";
ITEM.weight = 4;
ITEM.category = "Furniture";
ITEM.batch = 1;
ITEM.useText = "Open";
ITEM.description = "A dirty mattress. The itching you're feeling is definitely not lice.";
ITEM.storageSpace = 2;
ITEM.skin = 0;

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
local ITEM = Clockwork.item:New("container_base");

ITEM.name = "Refridgerator";
ITEM.uniqueID = "refridgerator";
ITEM.model = "models/props_c17/furniturefridge001a.mdl";
ITEM.plural = "Refridgerators";
ITEM.weight = 20;
ITEM.category = "Furniture";
ITEM.batch = 1;
ITEM.useText = "Open";
ITEM.description = "A metal refridgerator. Just plug it in, and pray you don't get electrocuted.";
ITEM.storageSpace = 20;

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
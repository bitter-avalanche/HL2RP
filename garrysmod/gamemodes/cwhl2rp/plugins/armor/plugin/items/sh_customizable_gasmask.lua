
local ITEM = Clockwork.item:New("armor_clothes_base_customizable");
ITEM.name = "Customizable Gasmask Armor";
ITEM.uniqueID = "customizable_gasmask";
ITEM.hasGasmask = true;
ITEM.isAnonymous = true;
ITEM.repairItem = "armor_scraps";
ITEM.repairAmount = 60;

Clockwork.item:Register(ITEM);
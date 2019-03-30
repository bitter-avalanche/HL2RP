
local ITEM = Clockwork.item:New("armor_clothes_base_customizable");
ITEM.name = "Customizable Rebreather";
ITEM.uniqueID = "customizable_rebreather";
ITEM.hasRebreather = true;
ITEM.isAnonymous = true;
ITEM.repairItem = "armor_scraps";
ITEM.repairAmount = 60;

Clockwork.item:Register(ITEM);
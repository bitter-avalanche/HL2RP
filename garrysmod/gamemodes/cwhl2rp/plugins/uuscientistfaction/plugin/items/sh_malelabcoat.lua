--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("clothes_base");

ITEM.name = "Male Labcoat";
ITEM.uniqueID = "male_lab";
ITEM.weight = 1.5;
ITEM.business = false;
ITEM.protection = 0;
ITEM.description = "A labcoat, this one is significantly bigger than its female counterpart.";

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	if (string.lower(player:GetModel()) == "models/humans/group01/male_bms_citizen_npc.mdl") then
		return "models/humans/scientist.mdl";
	end;
end;

ITEM:Register();
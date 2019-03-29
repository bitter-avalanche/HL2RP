--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Scientist Associate");
	CLASS.color = Color(141, 39, 244, 255);
	CLASS.wages = 5;
	CLASS.factions = {FACTION_UUSCI};
	CLASS.isDefault = true;
	CLASS.wagesName = "Allowance";
	CLASS.description = "A human scientist, in the employ of the Universal Union.";
	CLASS.defaultPhysDesc = "Wearing a clean white labcoat";
CLASS_SCIASSOC = CLASS:Register();
--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Assistant");
	CLASS.color = Color(242, 193, 19, 255);
	CLASS.factions = {FACTION_CWU};
	CLASS.isDefault = true;
	CLASS.wagesName = "Supplies";
	CLASS.description = "The lowest class of the CWU. Basic class, granting no particular things.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_ASSISTANT = CLASS:Register();
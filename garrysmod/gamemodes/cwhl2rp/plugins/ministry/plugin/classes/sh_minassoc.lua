--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Ministry Associate");
	CLASS.color = Color(106, 156, 237, 255);
	CLASS.wages = 5;
	CLASS.factions = {FACTION_MINISTRY};
	CLASS.isDefault = true;
	CLASS.wagesName = "Allowance";
	CLASS.description = "A human employee of the Ministry.";
	CLASS.defaultPhysDesc = "Wearing a neat suit.";
CLASS_MINISTRYASSOC = CLASS:Register();
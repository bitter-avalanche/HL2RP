--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Minister of Union Affairs");
	CLASS.color = Color(106, 156, 237, 255);
	CLASS.wages = 25;
	CLASS.factions = {FACTION_MINISTRY};
	CLASS.wagesName = "Allowance";
	CLASS.description = "A human employee of the Ministry.";
	CLASS.defaultPhysDesc = "Wearing a neat suit.";
CLASS_MINISTRYUNION = CLASS:Register();
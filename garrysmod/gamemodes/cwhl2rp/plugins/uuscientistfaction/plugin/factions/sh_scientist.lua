--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local FACTION = Clockwork.faction:New("UU Scientist");

FACTION.useFullName = true;
FACTION.whitelist = true;
-- FACTION.material = "hl2rp2/factions/admin"; -- Uncommented until a new material can be present.
FACTION.models = {
	female = {
		"models/humans/group01/female_bms_citizen_npc.mdl"
	},
	male = {
		"models/humans/group01/male_bms_citizen_npc.mdl"
	};
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (faction.name != FACTION_CITIZEN) then
		return false;
	end;
end;

FACTION_UUSCI = FACTION:Register();
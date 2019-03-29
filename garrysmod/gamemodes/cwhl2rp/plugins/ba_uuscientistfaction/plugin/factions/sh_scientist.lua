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
		"models/scp/citizens/group84/female_01.mdl",
		"models/scp/citizens/group84/female_02.mdl",
		"models/scp/citizens/group84/female_05.mdl",
		"models/scp/citizens/group84/female_09.mdl",
		"models/scp/citizens/group84/female_10.mdl",
		"models/scp/citizens/group84/female_13.mdl",
		"models/scp/citizens/group84/female_14.mdl",
		"models/scp/citizens/group84/female_18.mdl",
		"models/scp/citizens/group84/female_20.mdl",
		"models/scp/citizens/group84/female_21.mdl",
		"models/scp/citizens/group84/female_22.mdl",
		"models/scp/citizens/group84/female_27.mdl",
		"models/scp/citizens/group84/female_30.mdl",
		"models/scp/citizens/group84/female_35.mdl",
		"models/scp/citizens/group84/female_37.mdl",
		"models/scp/citizens/group84/female_38.mdl",
		"models/scp/citizens/group84/female_41.mdl",
		"models/scp/citizens/group84/female_43.mdl"
		}
	male = {
		"models/scp/citizens/group84/male_01.mdl",
		"models/scp/citizens/group84/male_02.mdl",
		"models/scp/citizens/group84/male_03.mdl",
		"models/scp/citizens/group84/male_04.mdl",
		"models/scp/citizens/group84/male_05.mdl",
		"models/scp/citizens/group84/male_06.mdl",
		"models/scp/citizens/group84/male_07.mdl",
		"models/scp/citizens/group84/male_08.mdl",
		"models/scp/citizens/group84/male_09.mdl",
		"models/scp/citizens/group84/male_10.mdl",
		"models/scp/citizens/group84/male_11.mdl",
		"models/scp/citizens/group84/male_18.mdl",
		"models/scp/citizens/group84/male_19.mdl",
		"models/scp/citizens/group84/male_20.mdl",
		"models/scp/citizens/group84/male_22.mdl",
		"models/scp/citizens/group84/male_24.mdl",
		"models/scp/citizens/group84/male_28.mdl",
		"models/scp/citizens/group84/male_34.mdl",
		"models/scp/citizens/group84/male_37.mdl",
		"models/scp/citizens/group84/male_42.mdl",
		"models/scp/citizens/group84/male_52.mdl",
		"models/scp/citizens/group84/male_53.mdl"
	};
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (faction.name != FACTION_CITIZEN) then
		return false;
	end;
end;

FACTION_UUSCI = FACTION:Register();
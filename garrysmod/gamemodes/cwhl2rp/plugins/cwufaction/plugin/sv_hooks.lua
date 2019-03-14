
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;


-- Creates starting inventory for new CWU characters.

function Schema:GetPlayerDefaultInventory(player, character, inventory)
	if (character.faction == FACTION_CWU) then
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("cwu_card")
		);
	end;
end;
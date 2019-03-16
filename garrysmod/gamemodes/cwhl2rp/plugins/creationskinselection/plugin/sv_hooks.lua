local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

function PLUGIN:PlayerAdjustCharacterCreationInfo(player, info, data)
	info.data["Skin"] = data.skin;
end;

-- Called just after a player has spawned.
function PLUGIN:PostPlayerSpawn(player)
	player:SetSkin(player:GetCharacterData("Skin") or 0);
end;

-- A function to add a character to the character screen.
function Clockwork.player:CharacterScreenAdd(player, character)
	local info = {
		name = character.name,
		model = character.model,
		banned = character.data["CharBanned"],
		faction = character.faction,
		characterID = character.characterID,
		skin = character.data["Skin"] or 0
	};
	
	print(info.skin)
	
	if (character.data["PhysDesc"]) then
		if (string.len(character.data["PhysDesc"]) > 64) then
			info.details = string.sub(character.data["PhysDesc"], 1, 64).."...";
		else
			info.details = character.data["PhysDesc"];
		end;
	end;
	
	if (character.data["CharBanned"]) then
		info.details = "This character is banned.";
	end;
	
	Clockwork.plugin:Call("PlayerAdjustCharacterScreenInfo", player, character, info);
	Clockwork.datastream:Start(player, "CharacterAdd", info);
end;
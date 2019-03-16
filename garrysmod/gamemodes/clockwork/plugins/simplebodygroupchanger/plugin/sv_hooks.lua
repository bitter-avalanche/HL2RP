--[[
	Plugin by iKosmonaut.com
--]]

local PLUGIN = PLUGIN;

-- Called just after a player spawns.
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	local modelGroups = player:GetCharacterData("BodyGroups");
	local model = player:GetModel();
	local Skin = player:GetCharacterData("Skin");

	if( modelGroups and modelGroups[model] )then
		for bodyGroup, bodyGroupState in pairs(modelGroups[model])do
			player:SetBodygroup(tonumber(bodyGroup), bodyGroupState);
		end;
	end;
	if(Skin) then
		player:SetSkin(Skin);
	end

end;


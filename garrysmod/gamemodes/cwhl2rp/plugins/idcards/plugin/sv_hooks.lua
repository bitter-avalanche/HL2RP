
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local table = table;
local pairs = pairs;

function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (firstSpawn) then
		if (Clockwork.player:GetFactionTable(player).giveCard and !player:GetCharacterData("CIDCard")) then
			local itemTable = Clockwork.item:CreateInstance(Clockwork.player:GetFactionTable(player).giveCard)
			if (itemTable) then
				player:GiveItem(itemTable, true);
			end;
		end;
	end;
end;

-- Called when a player uses a command.
function PLUGIN:PlayerUsedCommand(player, commandTable, arguments)
	if (commandTable.name == "CharSetName") then
		local playerName = table.concat(arguments, " ", 2);
		local target = Clockwork.player:FindByID(playerName);

		if (target and Clockwork.player:GetFactionTable(player).giveCard) then
			local itemsList = target:GetItemsByID(Clockwork.player:GetFactionTable(player).giveCard);
			if (itemsList) then
				local key = target:GetCharacterKey();

				for k, v in pairs(itemsList) do
					if (v:GetData("Key") == key) then
						v:SetData("Owner", playerName);
					end;
				end;
			end;
		end;
	end;
end;

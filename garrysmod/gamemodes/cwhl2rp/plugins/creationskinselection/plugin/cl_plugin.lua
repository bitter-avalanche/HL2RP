local PLUGIN = PLUGIN;
local Clockwork = Clockwork;
local THEME = Clockwork.theme:Get();

-- A function to refresh the character panel list.
function Clockwork.character:RefreshPanelList()
	local factionScreens = {};
	local factionList = {};
	local panelList = self:GetPanelList();
	
	if (panelList) then
		panelList:Clear();
		
		for k, v in pairs(self:GetAll()) do
			local faction = Clockwork.plugin:Call("GetPlayerCharacterScreenFaction", v);
			if (!factionScreens[faction]) then factionScreens[faction] = {}; end;
			
			factionScreens[faction][#factionScreens[faction] + 1] = v;
		end;
		
		for k, v in pairs(factionScreens) do
			table.sort(v, function(a, b)
				return Clockwork.plugin:Call("CharacterScreenSortFactionCharacters", k, a, b);
			end);
			
			factionList[#factionList + 1] = {name = k, characters = v};
		end;
		
		table.sort(factionList, function(a, b)
			return a.name < b.name;
		end);
		
		for k, v in pairs(factionList) do
			for k2, v2 in pairs(v.characters) do
				panelList.customData = {
					name = v2.name,
					model = v2.model,
					banned = v2.banned,
					faction = v.name,
					details = v2.details,
					charTable = v2,
					characterID = v2.characterID,
					skin = v2.skin or 0
				};
				
				v2.panel = vgui.Create("cwCharacterPanel", panelList);
				
				if (IsValid(v2.panel)) then
					panelList:AddPanel(v2.panel);
				end;
			end;
		end;
	end;
end;

function PLUGIN:GetCharacterPanelSequence(entity, character)
	entity:SetSkin(character.skin)
end;
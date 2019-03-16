--[[
	© by Songbird aka Alko -  do not re-distribute without permission of its author (ael9000 gmail.com).
--]]

local PLUGIN = PLUGIN
-- Called when a player's typing display has started.
function PLUGIN:PlayerStartTypingDisplay(player, code)
	if (Schema:PlayerIsCombine(player) and !player:IsNoClipping()) then
		if (code == "n" or code == "y" or code == "w" or code == "r") then
			if (!player.typingBeep) then
				player.typingBeep = true;
				
				local ran = math.random(1, 3)
				if ran == 2 then
				ran = 1 
				end
					if player:GetFaction() == FACTION_MPF then
				player:EmitSound("npc/overwatch/radiovoice/on"..ran..".wav");
				else
				player:EmitSound("npc/combine_soldier/vo/on"..math.random(1, 2)..".wav");
				end
				
			end;
		end;
	end;
end;

-- Called when a player's typing display has finished.
function PLUGIN:PlayerFinishTypingDisplay(player, textTyped)
	if (Schema:PlayerIsCombine(player) and textTyped) then
		if (player.typingBeep) then
		local rand = math.random(2, 4)
				if rand == 3 then
				 rand = 2 
				end
				if player:GetFaction() == FACTION_MPF then
			player:EmitSound("npc/overwatch/radiovoice/off"..rand..".wav");
			else
			player:EmitSound("npc/combine_soldier/vo/off"..math.random(1, 3)..".wav");
		end;
		end
	end;
	
	player.typingBeep = nil;
end;
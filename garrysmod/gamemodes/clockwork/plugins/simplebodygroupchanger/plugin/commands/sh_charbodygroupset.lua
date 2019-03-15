--[[
	Plugin by iKosmonaut.com
--]]

local COMMAND = Clockwork.command:New("CharBodyGroupSet");
COMMAND.tip = "Sets a bodygroup for a players' active model to something.";
COMMAND.text = "<string Name> <number BodyGroup> <number State>";
COMMAND.access = "s";
COMMAND.arguments = 3;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if( target )then
		local targetBodyGroups = target:GetCharacterData("BodyGroups") or {};
		local bodyGroupState = tonumber(arguments[3]) or 0;
		local bodyGroup = tonumber(arguments[2]) or 0;
		local model = target:GetModel();
		
		if( bodyGroup < target:GetNumBodyGroups() )then
			targetBodyGroups[model] = targetBodyGroups[model] or {};
			
			if( bodyGroupState == 0 )then
				targetBodyGroups[model][tostring(bodyGroup)] = nil;
			else
				targetBodyGroups[model][tostring(bodyGroup)] = bodyGroupState;
			end;
			
			target:SetBodygroup(bodyGroup, bodyGroupState);
			
			target:SetCharacterData("BodyGroups", targetBodyGroups);
			
			Clockwork.player:Notify(player, "Successfully changed " .. target:Name() .. "'s '".. target:GetBodygroupName(bodyGroup) .."' (".. bodyGroup ..") bodygroup to '".. bodyGroupState .."'.");
		else
			Clockwork.player:Notify(player, "'".. bodyGroup .. "' is not a valid bodygroup for this model!");
		end;
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
	end;
end;

COMMAND:Register();
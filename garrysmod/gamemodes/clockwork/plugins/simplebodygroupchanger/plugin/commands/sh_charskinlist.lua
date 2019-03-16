--[[
	Plugin by iKosmonaut.com
--]]

local COMMAND = Clockwork.command:New("CharSkinList");
COMMAND.tip = "Lists all valid skins for a characters' current model.";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if( target )then
		local text = "Here's a list of available skins for '".. player:GetModel() .."':";
		
		for i = 0, player:SkinCount() - 1 do
			text = text .. "\n " .. i;
		end;
		
		Clockwork.player:Notify(player, text);
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
	end;
end;

COMMAND:Register();
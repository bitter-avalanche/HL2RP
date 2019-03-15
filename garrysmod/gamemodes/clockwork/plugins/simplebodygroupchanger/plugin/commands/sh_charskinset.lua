--[[
	Plugin by iKosmonaut.com
--]]

local COMMAND = Clockwork.command:New("CharSkinSet");
COMMAND.tip = "Sets a skin for a players' active model to something.";
COMMAND.text = "<string Name> <number Skin>";
COMMAND.access = "s";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if( target )then
		local targetSkin = target:GetCharacterData("Skin") or {};
		local Skin = tonumber(arguments[2]) or 0;
		local model = target:GetModel();
		
		if( Skin < target:SkinCount() )then
			
			target:SetSkin(Skin);
			print("hax")
			target:SetCharacterData("Skin", Skin);
			
			Clockwork.player:Notify(player, "Successfully changed " .. target:Name() .. "'s Skin to '".. Skin .."'.");
		else
			Clockwork.player:Notify(player, "'".. Skin .. "' is not a valid Skin for this model!");
		end;
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
	end;
end;

COMMAND:Register();
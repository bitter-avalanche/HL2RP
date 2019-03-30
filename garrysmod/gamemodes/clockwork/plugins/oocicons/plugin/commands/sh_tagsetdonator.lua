--[[
                Created by Polis - June 2014.
                Parts of this command were created by Spencer.
                Do not re-distribute as your own.  The .ini file of this plugin is protected!
]]

COMMAND = Clockwork.command:New("TagSetDonator")
COMMAND.tip = "Give or take a player's donator tag in the OOC chat.";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
        local target = Clockwork.player:FindByID( arguments[1] );
        
        if (Clockwork.player:HasFlags(target, "D") or Clockwork.player:HasFlags(target, "h")) then
                Clockwork.player:Notify(player, "This player already has a tag!")
        return end;

        if (target) then
                if (!Clockwork.player:HasFlags(target, "d")) then
                        Clockwork.player:NotifyAll(target:Name().." has been given the donator tag by "..player:Name()..".");
                        Clockwork.player:GiveFlags(target, "d")
                        target:SetData("donator", 1)
                        Clockwork.player:LightSpawn(target, true, true);
                else
                        Clockwork.player:NotifyAll(target:Name().."'s donator tag has been taken away by "..player:Name()..".");
                        Clockwork.player:TakeFlags(target, "d")
                        target:SetData("donator", 0)
                        Clockwork.player:LightSpawn(target, true, true);

                end
        else
                Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
        end;
end;

COMMAND:Register();
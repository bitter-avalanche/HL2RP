local COMMAND = Clockwork.command:New("ForceReloadFields");
local PLUGIN = PLUGIN;

COMMAND.tip = "Force load all saved forcefields.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.text = "";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	for k, v in pairs(ents.FindByClass("z_forcefield")) do
		v:Remove();
	end;

	timer.Simple( 0.2, function() PLUGIN:LoadAFields() end );
	Clockwork.player:Notify(player, "Fields loaded.");
end;
COMMAND:Register()

local COMMAND = Clockwork.command:New("ForceSaveFields");
local PLUGIN = PLUGIN;

COMMAND.tip = "Force save all currently placed forcefields.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.text = "";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	PLUGIN:SaveAFields();
  Clockwork.player:Notify(player, "Fields saved:");
  local buffer = {};
  for k, v in pairs(ents.FindByClass("z_forcefield")) do
    Clockwork.player:Notify(player, tostring(v:GetPos()));

		Clockwork.player:Notify(player, tostring(sql.LastError()));
  end;
end;

COMMAND:Register()

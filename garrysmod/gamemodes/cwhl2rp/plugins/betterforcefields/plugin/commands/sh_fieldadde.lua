local COMMAND = Clockwork.command:New("FieldAddE");

COMMAND.tip = "Add a ENHANCED Combine field at your cursor.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";
COMMAND.text = "";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	if (!trace.Hit) then return end


	local field = ents.Create("z_forcefield");
	local entity = field:SpawnFunction(player, trace)
	field:Remove()

	if (IsValid(entity)) then
		Clockwork.player:Notify(player, "You have added a force field.");
	end;
end;

COMMAND:Register()

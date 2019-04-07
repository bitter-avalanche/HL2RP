local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.config:Add("field_load_time", 2);

function PLUGIN:LoadAFields()
	local buffer = Clockwork.kernel:RestoreSchemaData("plugins/betterfields/"..game.GetMap());
	for k, v in ipairs(buffer) do
		local entity = ents.Create("z_forcefield");

		entity:SetPos(v.pos);
		entity:SetAngles(v.ang);
		entity.save = v.saveData1;
		entity.save2 = v.saveData2;
		entity.save3 = v.saveData3;
		entity:Spawn();
		entity.AllowedTeams = v.teams;
		entity.AllowedPlayers = v.plys;
	end;
	print("FIELDS LOADED.");
end;




function PLUGIN:SaveAFields()
	if(#_player.GetAll() == 0 or #_player.GetAll() == nil) then
		print("No connected clients, not saving fields.");
		return;
	end;
	local buffer = {};

	for k, v in pairs(ents.FindByClass("z_forcefield")) do
		print("FIELD FOUND", v:GetPos());
		buffer[#buffer + 1] = {
			pos = v:GetPos(),
			ang = v:GetAngles(),
			mode = v.mode or 1,
			plys = v.AllowedPlayers,
			teams = v.AllowedTeams,
			saveData1 = v.save;
			saveData2 = v.save2;
			saveData3 = v.save3;
		};
	end;

	Clockwork.kernel:SaveSchemaData("plugins/betterfields/"..game.GetMap(), buffer);
	print("FIELDS SAVED");
end;

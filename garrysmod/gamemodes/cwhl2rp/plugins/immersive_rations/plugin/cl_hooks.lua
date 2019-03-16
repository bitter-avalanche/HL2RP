local PLUGIN = PLUGIN;

function PLUGIN:DrawTargetPlayerStatus(target, alpha, x, y)
	local informationColor = cwOption:GetColor("information");
	local action = Clockwork.player:GetAction(target);
	
	if (target:Alive()) then
		if (action == "open") then
			return Clockwork.kernel:DrawInfo("Opening a ration.", x, y, informationColor, alpha);
		end;
	end;
end;

function PLUGIN:GetProgressBarInfo()
	local action, percentage = Clockwork.player:GetAction(Clockwork.Client, true);

	if (Clockwork.Client:Alive() and action == "open") then
		return {text = "Opening ration packet...", percentage = percentage};
	end;
end;

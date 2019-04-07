local Clockwork = Clockwork;
local PLUGIN = PLUGIN;

-- Called when OpenAura has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
    self:LoadAFields();
end;

-- Called when data should be saved.
function PLUGIN:PostSaveData()
	self:SaveAFields();
end;

local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.kernel:IncludePrefixed("cl_intro.lua");
Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
Clockwork.kernel:IncludePrefixed("cl_hooks.lua");

if (SERVER) then
	Clockwork.config:Add("intro_sound", "music/HL2_song30.mp3", true);
else
	Clockwork.config:AddToSystem("Introduction sound", "intro_sound", "The sound to play during the custom introduction.");
	PLUGIN:WrapText();
end;
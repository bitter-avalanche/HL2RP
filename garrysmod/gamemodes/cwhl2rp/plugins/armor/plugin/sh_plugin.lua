
local Clockwork = Clockwork;

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

-- Called when the Clockwork shared variables are added.
function PLUGIN:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:Number("FilterQuality", true);
	playerVars:Number("MaxFilterQuality", true);
	playerVars:Bool("IsConcealed");
	playerVars:Bool("HasGasmask");
end;
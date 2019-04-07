
local CHANNEL = Clockwork.radio:New();
CHANNEL.name = "MPF - Global";
CHANNEL.uniqueID = "mpf_global";
CHANNEL.subChannels = 1;
CHANNEL.global = true;
CHANNEL.defaultPriority = 8;
CHANNEL.color = Color(255, 0, 0, 255);
CHANNEL.targetChannels = {["mpf_network"] = "all"}

CHANNEL:Register();
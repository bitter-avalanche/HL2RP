
local CHANNEL = Clockwork.radio:New();
CHANNEL.name = "MPF - Network";
CHANNEL.uniqueID = "mpf_network";
CHANNEL.subChannels = 4;
CHANNEL.global = false;
CHANNEL.defaultPriority = 1;
CHANNEL.color = Color(67, 142, 192, 255);

CHANNEL:Register();
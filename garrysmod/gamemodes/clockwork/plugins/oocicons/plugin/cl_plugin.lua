--[[
		Created by Polis - June 2014.
		Do not re-distribute as your own.  The .ini file of this plugin is protected!
]]

local PLUGIN = PLUGIN;

function PLUGIN:ChatBoxAdjustInfo(info)
	local player = info.speaker
	
	if (info.class == "ooc") then
		
		if (player:SteamID() == "STEAM_0:0:43357646") then -- Remove this if you want to.  That's my SteamID.
				info.icon = "icon16/sum.png" 

		elseif (Clockwork.player:HasFlags(info.speaker, "D")) then
					info.icon = "icon16/plugin.png";

				elseif (Clockwork.player:HasFlags(info.speaker, "h")) then
								info.icon = "icon16/rainbow.png";			

		elseif player:IsSuperAdmin() then
			info.icon = "icon16/shield.png"

				elseif player:IsAdmin() then
					info.icon = "icon16/star.png"

					elseif player:IsUserGroup("operator") then
						info.icon = "icon16/eye.png"
	
							elseif (Clockwork.player:HasFlags(info.speaker, "d")) then
								info.icon = "icon16/heart.png";	

								elseif (player:GetFaction() == FACTION_CITIZEN and player:GetGender() == GENDER_FEMALE) then
									info.icon = "icon16/user_female.png";
			
									elseif (player:GetFaction() == FACTION_CITIZEN and player:GetGender() == GENDER_MALE) then
										info.icon = "icon16/user_gray.png";

									else
										info.icon = "icon16/add.png"

		end;
	
	end;

end;
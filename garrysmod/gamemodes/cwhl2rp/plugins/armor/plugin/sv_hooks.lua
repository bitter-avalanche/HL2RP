
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when a player's shared variables should be set.
function PLUGIN:PlayerSetSharedVars(player, curTime)
	if (player:HasRebreather() or player:HasGasmask()) then
		player:SetSharedVar("HasGasmask", true);
	else
		player:SetSharedVar("HasGasmask", false);
	end;

	if (player:IsAnonymous()) then
		player:SetSharedVar("IsConcealed", true);
	else
		player:SetSharedVar("IsConcealed", false);
	end;

	player:SetSharedVar("FilterQuality", math.Round(player:GetFilterQuality()));
end;

function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	local clothes = player:GetClothesItem()
	if (clothes and clothes("maxArmor")) then
		player:SetMaxArmor(clothes("maxArmor"));
	end;

	if (player:IsAnonymous()) then
		player:SetSharedVar("IsConcealed", true);
	else
		player:SetSharedVar("IsConcealed", false);
	end;

	if (firstSpawn) then
		player.filterItem = nil;
		local items = player:GetInventory();
		for uniqueID, itemList in pairs(items) do
			for id, itemTable in pairs(itemList) do
				if (!itemTable:IsBasedFrom("filter_base")) then
					break;
				elseif (itemTable:GetData("equipped")) then
					player.filterItem = itemTable;
					player:SetSharedVar("MaxFilterQuality", itemTable("maxFilterQuality"));
					return;
				end;
			end;
		end;
	end;
end;

--[[
function PLUGIN:PlayerUseItem(player, itemTable, itemEntity)
	if (!Schema:PlayerIsCombine(player) and itemTable("isCombineSuit")) then
		local location = Schema:PlayerGetLocation(player);
			
		Schema:AddCombineDisplayLine("Downloading ping statistics for disengaged MPF STD regalia...", Color(255, 255, 255, 255), nil, player);
		Schema:AddCombineDisplayLine("WARNING! Contact established with non authorized personnel at "..location.."...", Color(255, 0, 0, 255), nil, player);
	end;
end;
--]]

-- Called when the player takes damage
function PLUGIN:EntityTakeDamage(entity, damageInfo)
	if (entity:IsPlayer()) then
		local attacker = damageInfo:GetAttacker();
		if (attacker and (attacker:IsPlayer() or attacker:IsNPC())) then
			local clothes = entity:GetClothesItem();
			if (clothes and clothes("protection", 0) > 0) then
				damageInfo:ScaleDamage(1 - math.Clamp(clothes("protection"), 0, 1));
			end;
		end;
	end;
end;

function PLUGIN:PlayerRagdolled(player)
	player:SaveClothesArmor();
end;

function PLUGIN:EntityHandleMenuOption(player, entity, option, arguments)
	if (entity:GetClass() == "cw_item" and option == "Customize" and player:IsSuperAdmin()) then
		local itemTable = entity:GetItemTable();
		
		for field, data in pairs (arguments) do
			itemTable:SetData(field, data);
		end;
		Clockwork.kernel:PrintLog(LOGTYPE_MINOR, player:Name().." has customized a '"..itemTable("name").."'.");
		return true;
	end;
end;
local PLUGIN = PLUGIN;

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");

Clockwork.animation.holdTypes["cw_ration"] = "package";

if (CLIENT) then
	Clockwork.config:AddToSystem("Ration Open Delay", "ration_open_delay", "The time it takes to open a ration packet.");
else
	Clockwork.config:Add("ration_open_delay", 15);
end;

local stance = {
	"stand",
	"crouch"
};

local activity = {
	"idle",
	"walk",
	"run"
};

for k, v in pairs(Clockwork.animation.stored) do
	for _, stance in pairs(stance) do
		for _, activity in pairs(activity) do
			v[stance.."_package_"..activity] = v[stance.."_"..activity];
			v[stance.."_package_aim_"..activity] = v[stance.."_"..activity];
		end;
	end;

	if (k == "maleHuman" or k == "femaleHuman") then
		v["stand_package_idle"] = ACT_IDLE_PACKAGE;
		v["stand_package_walk"] = ACT_WALK_PACKAGE;
		v["stand_package_aim_idle"] = ACT_IDLE_PACKAGE;
		v["stand_package_aim_walk"] = ACT_WALK_PACKAGE;
	end;
end;

-- A function to make a player drop a weapon.
function Clockwork.player:DropWeapon(player, class)
	local ragdollEntity = player:GetRagdollEntity();
	
	if (player:IsRagdolled()) then
		local ragdollWeapons = player:GetRagdollWeapons();
		
		for k, v in pairs(ragdollWeapons) do
			if (v.weaponData.class == class) then
				local itemTable = v.weaponData["itemTable"];
				
				if (itemTable and Clockwork.plugin:Call("PlayerCanDropWeapon", player, itemTable, NULL, true)) then
					local info = {
						itemTable = itemTable,
						position = ragdollEntity:GetPos() + Vector(0, 0, math.random(1, 48)),
						angles = Angle(0, 0, 0)
					};
					
					player:TakeItem(info.itemTable, true);
					ragdollWeapons[k] = nil;
					
					if (Clockwork.plugin:Call("PlayerAdjustDropWeaponInfo", player, info)) then
						local entity = Clockwork.entity:CreateItem(player, info.itemTable, info.position, info.angles);
						
						if (IsValid(entity)) then
							Clockwork.plugin:Call("PlayerDropWeapon", player, info.itemTable, entity, NULL);
						end;
					end;
				end;
			end;
		end;
	else
		local weapon = player:GetWeapon(class);
		local itemTable = Clockwork.item:GetByWeapon(weapon);
		
		if (itemTable and Clockwork.plugin:Call("PlayerCanDropWeapon", player, itemTable, weapon, true)) then
			local info = {
				itemTable = itemTable,
				position = player:GetPos() + Vector(0, 0, math.random(1, 48)),
				angles = Angle(0, 0, 0)
			};
			
			if (Clockwork.plugin:Call("PlayerAdjustDropWeaponInfo", player, info)) then
				local entity = Clockwork.entity:CreateItem(
					player, info.itemTable, info.position, info.angles
				);
				
				if (IsValid(entity)) then
					Clockwork.plugin:Call("PlayerDropWeapon", player, info.itemTable, entity, weapon);
					player:StripWeapon(weapon:GetClass());
					player:TakeItem(info.itemTable, true);
				end;
			end;
		end;
	end;
end;

if (SERVER) then
	function PLUGIN:PlayerRagdolled(player, state)
		if (state == RAGDOLL_FALLENOVER and player:RagdollHasWeapon("cw_ration")) then
			Clockwork.player:DropWeapon(player, "cw_ration");
		end;
	end;
end;
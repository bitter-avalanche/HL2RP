--[[
	This file overrides some properties and functions of the default
	cwhl2rp ration item found in 'schema\items\sh_ration.lua'.
--]]

local ITEM = Clockwork.item:FindByID("ration");

if (!ITEM) then
	debug.Trace(); -- Server does not have item installed.
	return;
end;

ITEM.Open = ITEM.OnUse;
ITEM.OnUse = nil;
ITEM.useText = nil;
ITEM.category = "Storage";
ITEM.weaponClass = "cw_ration";
ITEM.toolTip = "Primary Fire (Hold):\nOpen ration packet, moving will cancel.";

function ITEM:CanPickup(player, bQuickUse) 
	if (!bQuickUse) then
		Clockwork.player:Notify(player, "You must equip this item to pick it up!");
		return false;
	end;
end;

function ITEM:OnEquip(player)
	player:SelectWeapon("cw_ration");
end;

function ITEM:CanHolsterWeapon(player)
	Clockwork.player:Notify(player, "You cannot holster this weapon!");
	return false;
end;

function ITEM:OnHandleUnequip(Callback)
	if (self.OnDrop) then
		local menu = DermaMenu();
			menu:SetMinimumWidth(100);
			menu:AddOption("Drop", function()
				Callback("drop");
			end);
		menu:Open();
	else
		Callback();
	end;
end;

Clockwork.item:Merge(ITEM, "weapon_base");

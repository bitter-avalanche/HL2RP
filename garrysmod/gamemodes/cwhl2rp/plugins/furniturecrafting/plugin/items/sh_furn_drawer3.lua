local ITEM = Clockwork.item:New();

ITEM.name = "Tall Drawers";
ITEM.uniqueID = "talldrawers3";
ITEM.model = "models/props_c17/FurnitureDrawer003a.mdl";
ITEM.plural = "Tall Drawers";
ITEM.weight = 4;
ITEM.category = "Furniture";
ITEM.batch = 1;
ITEM.useText = "Open";
ITEM.description = "Tall drawers. I wouldn't put anything heavy in here as it looks like it might collapse out of misery alone.";

ITEM:AddData("Inventory", nil);
ITEM:AddData("Cash", 0);

function ITEM:OnSaved(newData)
	if (newData["Inventory"] != nil) then
		newData["Inventory"] = Clockwork.inventory:ToSaveable(newData["Inventory"]);
		
		if (CloudAuthX.Base64Encode) then
			newData["Inventory"] = "@"..CloudAuthX.Base64Encode(newData["Inventory"]);
		end;
	end;
end;

function ITEM:OnLoaded()
	local inventory = self("Inventory");
	
	if (inventory != nil) then
		if (CloudAuthX.Base64Decode and string.utf8sub(inventory, 1, 1) == "@") then
			inventory = CloudAuthX.Base64Decode(string.utf8sub(inventory, 2));
		end;
		
		self:SetData("Inventory", Clockwork.inventory:ToLoadable(inventory));
	end;
end;

if (SERVER) then
	function ITEM:GetInventory()
		local inventory = self:GetData("Inventory");
		
		if (inventory == nil) then
			self:SetData("Inventory", {});
		end;
		
		return inventory;
	end;
		
	function ITEM:HasItem(itemTable)
		if (type(itemTable) == "string") then
			Clockwork.inventory:HasItemByID(self:GetInventory(), itemTable);
		else
			Clockwork.inventory:HasItemInstance(self:GetInventory(), itemTable);
		end;
	end;

	function ITEM:RemoveFromInventory(itemTable)
		if (type(itemTable) == "string") then
			Clockwork.inventory:RemoveUniqueID(self:GetInventory(), itemTable);
		else
			Clockwork.inventory:RemoveInstance(self:GetInventory(), itemTable);
		end;
	end;

	function ITEM:InventoryAsItemsList()
		return Clockwork.inventory:GetAsItemsList(self:GetInventory());
	end;

	function ITEM:AddToInventory(itemTable)
		Clockwork.inventory:AddInstance(self:GetInventory(), itemTable);
	end;

	function ITEM:GetCash()
		return self("Cash");
	end;
end;

function ITEM:OnUse(player, itemEntity)
	self:OpenFor(player, itemEntity);
	
	return false;
end;

function ITEM:OpenFor(player, itemEntity)
	local inventory = self:GetInventory();
	local cash = self:GetCash();
	local name = self("name");
	
	Clockwork.storage:Open(player, {
		name = name,
		weight = self("storageWeight"),
		space = self("storageSpace"),
		entity = itemEntity or false,
		distance = 192,
		cash = cash,
		inventory = inventory,
		OnGiveCash = function(player, storageTable, cash)
			self:SetData("Cash", self:GetCash() + cash);
		end,
		OnTakeCash = function(player, storageTable, cash)
			self:SetData("Cash", self:GetCash() - cash);
		end
	});
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
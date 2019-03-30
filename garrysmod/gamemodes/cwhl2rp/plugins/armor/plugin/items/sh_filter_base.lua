
local Clockwork = Clockwork;

local ITEM = Clockwork.item:New("equipable_item_base", true);
ITEM.name = "Filter Base";
ITEM.uniqueID = "filter_base";
ITEM.model = "models/gibs/hgibs.mdl";
ITEM.weight = 1;
ITEM.useText = "Screw On";
ITEM.category = "Filters";
ITEM.description = "A filter you can screw onto a gasmask.";
ITEM.business = false;
ITEM.isAttachment = false;

ITEM:AddData("FilterQuality", -1, true);

-- Called when a player wears the accessory.
function ITEM:OnWearItem(player, bIsWearing)
	if (!bIsWearing) then
		player.filterItem = nil;
	else
		player.filterItem = self;
	end;
end;

function ITEM:CanPlayerWear(player, itemEntity)
	if (player:HasGasmask()) then
		if (player.filterItem == nil) then
			return true;
		else
			Clockwork.player:Notify(player, "You are already wearing a filter!");
		end;
	else
		if (player:HasRebreather()) then
			Clockwork.player:Notify(player, "Rebreathers do not need a filter!");
		else
			Clockwork.player:Notify(player, "You are not wearing a gasmask!");
		end;
	end

	return false;
end;

function ITEM:EntityHandleMenuOption(player, entity, option, argument)
	-- Filter refill
	if (option == "Refill") then
		self:RefillFilter(player);

	-- Admin filter refill
	elseif (option == "AdminRefill") then
		if (player:IsSuperAdmin()) then
			self:SetData("FilterQuality", self("maxFilterQuality"));
			Clockwork.kernel:PrintLog(LOGTYPE_MAJOR, player:Name().." has admin-refilled a "..self("name")..".");
		else
			Clockwork.Notify(player, "You are not a super admin!");
		end;
	end;
end;

if (CLIENT) then
	function ITEM:GetClientSideInfo()
		if (!self:IsInstance()) then return; end;
		
		if (self:GetData("equipped") == true) then
			return "Filter Quality: "..Clockwork.Client:GetSharedVar("FilterQuality").."\nIs Wearing: Yes";
		else
			return "Filter Quality: "..self:GetData("FilterQuality").."\nIs Wearing: No";
		end;
	end;
	
	function ITEM:GetEntityMenuOptions(entity, options)
		if (!IsValid(entity)) then
			return;
		end;

		if (Clockwork.Client:IsSuperAdmin()) then
			options["AdminRefill"] = function()
				Clockwork.entity:ForceMenuOption(entity, "AdminRefill", nil);
			end;
		end;

		options["Refill"] = function()
			Clockwork.entity:ForceMenuOption(entity, "Refill", nil);
		end;
	end;
else
	function ITEM:OnInstantiated()
		if (self:GetData("FilterQuality") == -1) then
			self:SetData("FilterQuality", self("maxFilterQuality"));
		end;
	end;

	function ITEM:RefillFilter(player)
		if (!self("refillItem")) then
			Clockwork.player:Notify(player, "This item cannot be refilled! (Contact a dev if it should be)");
			return;
		end;
		if (self:GetData("FilterQuality") == self("maxFilterQuality")) then
			Clockwork.player:Notify(player, "This item already has its max filter quality!");
			return;
		end;

		-- Check if a flag is required and if the player has it
		if (self("refillFlag") and !Clockwork.player:HasFlags(player, self("refillFlag"))) then
			Clockwork.player:Notify(player, "You do not have the "..self("refillFlag").." flag!");
		end;

		local item = player:FindItemByID(self("refillItem"));

		-- Check if the player has the needed item
		if (!player:HasItemByID(self("refillItem"))) then
			item = Clockwork.item:FindByID(self("refillItem"));
			Clockwork.player:Notify(player, "You do not have enough "..item("name").." to refill this!");
			return;
		end;

		-- Take the refill item
		player:TakeItem(item);
		-- Set filter to new value
		self:SetData("FilterQuality", self("maxFilterQuality"));
		-- Notify player
		Clockwork.player:Notify(player, "You have refilled the "..self("name")..".");
		Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name().." has refilled a "..self("name")..".");
	end;
end;

Clockwork.item:Register(ITEM);
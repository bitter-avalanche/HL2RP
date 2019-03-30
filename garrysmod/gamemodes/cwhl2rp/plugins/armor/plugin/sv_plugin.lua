
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local playerMeta = FindMetaTable("Player");

-- Sceen overlay texture files
Clockwork.kernel:AddFile("materials/effects/gasmask_screen.vtf");
Clockwork.kernel:AddFile("materials/effects/gasmask_screen_1.vtf");
Clockwork.kernel:AddFile("materials/effects/gasmask_screen_2.vtf");
Clockwork.kernel:AddFile("materials/effects/gasmask_screen_3.vtf");
Clockwork.kernel:AddFile("materials/effects/gasmask_screen_4.vtf");
Clockwork.kernel:AddFile("materials/effects/gasmask_screen.vmt");
Clockwork.kernel:AddFile("materials/effects/gasmask_screen_1.vmt");
Clockwork.kernel:AddFile("materials/effects/gasmask_screen_2.vmt");
Clockwork.kernel:AddFile("materials/effects/gasmask_screen_3.vmt");
Clockwork.kernel:AddFile("materials/effects/gasmask_screen_4.vmt");

Clockwork.hint:Add("Durability", "Your suit degrades as it takes damage. Don't forget to repair it.");
Clockwork.hint:Add("Gasmask", "Gasmasks need a filter to provide protection against toxic gasses.");
Clockwork.hint:Add("Protection", "Better armor provides more damage reduction, regardless of durability.");

function playerMeta:GetFilterQuality()
	if (self:HasRebreather()) then
		return math.huge;
	elseif (self:HasGasmask()) then
		return (self.filterItem and self.filterItem:GetData("FilterQuality", 0)) or 0;
	end;

	return 0;
end;

function playerMeta:UpdateFilterQuality(amount)
	if (!self:HasRebreather()) then
		self:SetFilterQuality(self:GetFilterQuality() + amount);
	end;
end;

function playerMeta:SetFilterQuality(amount)
	if (self:HasRebreather()) then
		return;
	elseif (self.filterItem) then
		self.filterItem:SetData("FilterQuality", math.Clamp(amount, 0, self.filterItem("maxFilterQuality")));
	end;
end;

function playerMeta:HasRebreather()
	local clothes = self:GetClothesItem();
	return clothes and clothes("hasRebreather", false);
end;

function playerMeta:HasGasmask()
	local clothes = self:GetClothesItem();
	return clothes and clothes("hasGasmask", false) and !clothes("hasRebreather");
end;

function playerMeta:IsAnonymous()
	local clothes = self:GetClothesItem();
	return clothes and clothes("isAnonymous", false);
end;

function playerMeta:SaveClothesArmor()
	local clothes = self:GetClothesItem();
	if (clothes and clothes:GetData("Armor")) then
		clothes:SetData("Armor", math.Clamp(self:Armor(), 0, clothes("maxArmor", 0)));
	end;
end;

local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local playerMeta = FindMetaTable("Player");

local tonumber = tonumber;
local tostring = tostring;
local string = string;

function playerMeta:GetCardText()
	if (Clockwork.player:GetFactionTable(self).giveCard and self:GetCharacterData("CIDCard")) then
		local itemInstance = Clockwork.item:FindInstance(self:GetCharacterData("CIDCard"));
		if (itemInstance) then
			return itemInstance:GetData("CardNumber");
		else
			return PLUGIN:GetDigits(tonumber(self:GetCharacterData("CIDCard")));
		end;
	end;
end;

local prime = 999999883; -- As little below 999999 as possible, and prime % 4 = 3
local primeLength = string.len(tostring(prime));
function PLUGIN:GetCardID(itemID)
	itemID = itemID % 1000000000; -- ensures itemID is only 9 digits at most
	if (itemID * 2 < prime) then
		return Clockwork.kernel:ZeroNumberToDigits((itemID * itemID) % prime, primeLength);
	else
		return Clockwork.kernel:ZeroNumberToDigits((prime - (itemID * itemID)) % prime, primeLength);
	end;
end;

function PLUGIN:GetDigits(itemID)
	local cardID = self:GetCardID(itemID);
	local checkText = Clockwork.kernel:ZeroNumberToDigits(tonumber(cardID) % 97, 2);

	return string.gsub(cardID, "^(%d%d%d)(%d%d%d%d)(%d%d)", "%1:%2:%3").."-"..checkText;
end;

-- A function to get if someone has a Union card.
function playerMeta:HasUnionCard(bAllowCitizens)
	if (!self:GetCharacterData("CIDCard")) then
		return false;
	end;
	local itemInstance = Clockwork.item:FindInstance(self:GetCharacterData("CIDCard"));
	if (!itemInstance) then
		return false;
	end;
	if (!self:HasItemInstance(itemInstance)) then
		return false;
	end;

	if (itemInstance:CanMakeOwner(self)) then
		if (bAllowCitizens != false) then
			return itemInstance("canOpenUnionLock");
		else
			return itemInstance("canOpenRestrictedUnionLock");
		end;
	else
		return false;
	end;
end;
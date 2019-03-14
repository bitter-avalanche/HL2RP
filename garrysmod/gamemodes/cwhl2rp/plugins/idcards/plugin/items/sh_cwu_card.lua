
local ITEM = Clockwork.item:New("card_base");
ITEM.name = "CWU Employee Card";
ITEM.uniqueID = "cwu_card";
ITEM.model = "models/dorado/tarjetazero.mdl";
ITEM.description = "A small, metallic card with a magnetic strip used to identify CWU employees.";
ITEM.canOpenUnionLock = true;
ITEM.canOpenRestrictedUnionLock = true;

function ITEM:GetClientSideInfo()
	return string.format("This ID belongs to %s, CID %s.\nRegID:#%s\nThis card is property of the Civil Worker's Union. If found, return it to a local protection officer immediately. Illegal carrying is a violation and will result in prosecution. This card will be deactivated upon loss.", self:GetData("Owner"), self:GetData("CombineID"), self:GetData("CardNumber"));
end;

if (SERVER) then
	function ITEM:CanMakeOwner(player)
		return player:GetFaction() == FACTION_CWU or player:GetFaction() == FACTION_BIOTIC;
	end;
end;

ITEM:Register();

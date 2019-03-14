
local ITEM = Clockwork.item:New("card_base");
ITEM.name = "Citizen Identification Card";
ITEM.uniqueID = "cid_card";
ITEM.model = "models/dorado/tarjeta2.mdl";
ITEM.description = "A small, metallic card that is used for identification purposes. It features a Universal Union logo.";

function ITEM:GetClientSideInfo()
	return string.format("This ID belongs to %s, CID %s.\nRegID:#%s\nThis card is property of the Universal Union. If found, return it to a local protection officer immediately. Illegal carrying is a violation and will result in prosecution.", self:GetData("Owner"), self:GetData("CombineID"), self:GetData("CardNumber"));
end;

if (SERVER) then
	function ITEM:CanMakeOwner(player)
		return Clockwork.player:GetFactionTable(player).giveCard == self("uniqueID");
	end;
end;

ITEM:Register();

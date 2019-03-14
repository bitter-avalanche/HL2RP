
local PLUGIN = PLUGIN;

local ITEM = Clockwork.item:New(nil, true);
ITEM.name = "Card Base";
ITEM.uniqueID = "card_base";
ITEM.model = "models/dorado/tarjeta2.mdl";
ITEM.weight = 0.05;
ITEM.description = "A small, metallic card with a magnetic strip used for identification purposes.";

ITEM:AddData("Key", 0, true);
ITEM:AddData("CombineID", "123456", true);
ITEM:AddData("CardNumber", "123:4567:89-02", true);
ITEM:AddData("Owner", "John Doe", true);

function ITEM:OnDrop(player, position) end;

if (CLIENT) then
	function ITEM:OnHUDPaintTargetID(ent, x, y, alpha) 
		return Clockwork.kernel:DrawInfo("["..self:GetData("Owner")..": #"..self:GetData("CombineID").."]", x, y, Color(255, 255, 255), alpha);
	end;
else
	function ITEM:MakeOwner(player)
		self:SetData("Key", player:GetCharacterKey());
		self:SetData("CardNumber", PLUGIN:GetDigits(self("itemID")));
		self:SetData("CombineID", player:GetCharacterData("citizenid"));
		self:SetData("Owner", player:Name());
		player:SetCharacterData("CIDCard", self("itemID"));
	end;

	-- Called when an item is given to a player.
	function ITEM:OnGiveToPlayer(player)
		if (self:GetData("Key") == 0 and (!self.CanMakeOwner or self:CanMakeOwner(player))) then
			self:MakeOwner(player);
		end;
	end;

	-- Called when the player's gear is restored.
	function ITEM:OnRestorePlayerGear(player)
		if (self:GetData("Key") == 0 and (!self.CanMakeOwner or self:CanMakeOwner(player))) then
			self:MakeOwner(player);
		elseif (self:GetData("Key") == player:GetCharacterKey()) then
			self:SetData("Owner", player:Name());
		end;
	end;
end;

ITEM:Register();

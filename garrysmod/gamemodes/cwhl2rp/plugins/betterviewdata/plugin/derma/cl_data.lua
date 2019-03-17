local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	self:SetBackgroundBlur(true);
	self:SetDeleteOnClose(false);

	-- Called when the button is clicked.
	function self.btnClose.DoClick(button)
		self:Close();
		self:Remove();

		gui.EnableScreenClicker(false);
	end;
end;

-- Called each frame.
function PANEL:Think()
	local scrW = ScrW();
	local scrH = ScrH();

	self:SetSize(720, 480);
	self:SetPos( (scrW / 2) - (self:GetWide() / 2), (scrH / 2) - (self:GetTall() / 2) );
end;

-- A function to populate the panel.
function PANEL:Populate(player, data, pointTable, CID, deletionTable)
	local title = player:Name();

	if string.len(tostring(CID)) > 0 then
		title = title .. ", #" .. CID;
	else
		CID = "n/a";
	end;

	self:SetTitle( title );

	self.isCombine = Schema:PlayerIsCombine(player);
	self.dataPoints = pointTable;
	self.dataName = player:Name();
	self.dataCID = CID;
	self.dataDeleted = deletionTable;

	local width = 720 - 10;

	local doneButton = vgui.Create("DButton", self);
	doneButton:SetText("Done");
	doneButton:DockMargin(0, 4, 0, 0);
	doneButton:Dock(BOTTOM);

	local leftDock = vgui.Create("Panel", self);
	leftDock:SetSize(width * 0.3 - 4, 0);
	leftDock:Dock(LEFT);

		local infoBackground = vgui.Create("DPanel", leftDock);
		infoBackground:SetSize(0, 128);
		infoBackground:Dock(TOP);
		infoBackground:SetBackgroundColor( Color(64, 64, 64, 255) );

			local infoRichText = vgui.Create("RichText", infoBackground);
			infoRichText:SetVerticalScrollbarEnabled(false);
			infoRichText:DockMargin(1, 1, 1, 1);
			infoRichText:Dock(FILL);
			self.infoRichText = infoRichText;

			function infoRichText:PerformLayout()
				self:SetBGColor( Color(255, 255, 255) );
			end;

		local textEntry = vgui.Create("DTextEntry", leftDock);
		textEntry:SetMultiline(true);
		textEntry:DockMargin(0, 4, 0, 0);
		textEntry:Dock(FILL);
		textEntry:SetText(data);

	local rightSheet = vgui.Create("DPropertySheet", self);
	rightSheet:SetSize(width * 0.7, 0);
	rightSheet:Dock(RIGHT);

		local tab1 = vgui.Create("Panel", rightSheet);
		rightSheet:AddSheet("Current Records", tab1, "icon16/table.png");

			local buttonRow = vgui.Create("Panel", tab1);
			buttonRow:SetSize(0, 25);
			buttonRow:DockMargin(0, 4, 0, 0);
			buttonRow:Dock(BOTTOM);

				local btnWidth = (479 / 2) - 2;

				local createButton = vgui.Create("DButton", buttonRow);
				createButton:SetText("Add Record");
				createButton:SetSize(btnWidth);
				createButton:Dock(LEFT);
				createButton.DoClick = function()
					if (Schema.dataDraftPanel and Schema.dataDraftPanel:IsValid()) then
						Schema.dataDraftPanel:Close();
						Schema.dataDraftPanel:Remove();
					end;

					Schema.dataDraftPanel = vgui.Create("cwDataDraft");
					Schema.dataDraftPanel:Populate(self);
					Schema.dataDraftPanel:MakePopup();
				end;

				local deleteButton = vgui.Create("DButton", buttonRow);
				deleteButton:SetText("Delete Selected");
				deleteButton:SetSize(btnWidth);
				deleteButton:Dock(RIGHT);
				deleteButton.DoClick = function()
					if (Schema.dataDeletePanel and Schema.dataDeletePanel:IsValid()) then
						Schema.dataDeletePanel:Close();
						Schema.dataDeletePanel:Remove();
					end;

					Schema.dataDeletePanel = vgui.Create("cwDataDelete");
					Schema.dataDeletePanel:Populate(self);
					Schema.dataDeletePanel:MakePopup();
				end;

			local listView = vgui.Create("DListView", tab1);
			listView:SetMultiSelect(false);
			listView:Dock(FILL);
			listView:AddColumn("Reason");
			listView:AddColumn("Added By");
			listView:AddColumn("Point Type");
			listView:AddColumn("Amount");

			self.listView = listView;

		local tab2 = vgui.Create("Panel", rightSheet);
		rightSheet:AddSheet("Deleted Records", tab2, "icon16/table_delete.png");

			local listRemoved = vgui.Create("DListView", tab2);
			listRemoved:SetMultiSelect(false);
			listRemoved:Dock(FILL);
			listRemoved:AddColumn("Add Reason");
			listRemoved:AddColumn("Del Reason");
			listRemoved:AddColumn("Added By");
			listRemoved:AddColumn("Deleted By");
			listRemoved:AddColumn("Point Type");
			listRemoved:AddColumn("Amount");

			self.listRemoved = listRemoved;

	self:PopulateRecords();
	self:PopulateRichText();

	-- A function to set the text entry's real value.
	function textEntry:SetRealValue(text)
		self:SetValue(text);
		self:SetCaretPos( string.len(text) );
	end;

	-- Called each frame.
	function textEntry:Think()
		local text = self:GetValue();

		if (string.len(text) > 1024) then
			self:SetRealValue( string.sub(text, 0, 1024) );

			surface.PlaySound("common/talk.wav");
		end;
	end;

	-- Called when the button is clicked.
	function doneButton.DoClick(button)
		self:Close(); self:Remove();

		if (IsValid(player)) then
			Clockwork.datastream:Start("EditData", {
				player,
				string.sub(textEntry:GetValue(), 0, 1024),
				self.dataPoints,
				self.dataDeleted
			});
		end;

		gui.EnableScreenClicker(false);
	end;
end;

function PANEL:PopulateRichText()
	local infoRichText = self.infoRichText;

	infoRichText:SetText("");
	infoRichText:InsertColorChange(64, 64, 64, 255);

	infoRichText:AppendText("Name: " .. self.dataName .. "\n");
	infoRichText:AppendText("CID: " .. self.dataCID .. "\n\n");

	local loyaltyPoints = 0;
	local penaltyPoints = 0;

	for i, v in pairs(self.dataPoints) do
		local isLoyal = v.loy;
		local amount = tonumber(v.num) or 0;

		if isLoyal then
			loyaltyPoints = loyaltyPoints + amount;
		else
			penaltyPoints = penaltyPoints + amount;
		end;
	end;

	local totalPoints = loyaltyPoints - penaltyPoints;

	if (self.isCombine) then
		infoRichText:AppendText("Sterilized Credits: " .. totalPoints .. "\n");
	else
		infoRichText:AppendText("Loyalty Points: " .. loyaltyPoints .. "\n");
		infoRichText:AppendText("Penalty Points: " .. penaltyPoints .. "\n\n");
		infoRichText:AppendText("Total Points: " .. totalPoints .. "\n");
	end;

	local statusLevel = 0;
	local statusData = nil;

	for i, v in pairs(PLUGIN.config.loyaltyLevels) do
		if (totalPoints > 0 and i > statusLevel and i <= totalPoints)
		or (totalPoints < 0 and i < statusLevel and i >= totalPoints) then
			statusLevel = i;
			statusData = v;
		end;
	end;

	if statusData then
		local c = statusData.color;
		if (statusLevel < 0) then
			infoRichText:AppendText("WARNING! ");
			infoRichText:InsertColorChange(c.r, c.g, c.b, 255);
			infoRichText:AppendText(statusData.name .. "!");
		else
			infoRichText:AppendText("Loyalist Status: ");
			infoRichText:InsertColorChange(c.r, c.g, c.b, 255);
			infoRichText:AppendText(statusData.name);
		end;
	end;
end;

function PANEL:PopulateRecords()
	local listView = self.listView;
	listView:Clear();

	for i, v in pairs(self.dataPoints) do
		local reason = v.rsn or "Unspecified";
		local addedBy = v.usr or "Unknown";
		local isLoyal = v.loy;
		local amount = tonumber(v.num) or 0;

		local pointType = isLoyal and (self.isCombine and "Sterilized Credit" or "Loyalty") or "Penalty";

		local linePanel = listView:AddLine(reason, addedBy, pointType, amount);
		linePanel.dataIndex = i;
	end;

	local listRemoved = self.listRemoved;
	listRemoved:Clear();

	for i, v in pairs(self.dataDeleted) do
		local reason = v.rsn or "Unspecified";
		local reasonDel = v.rsd or "Unspecified";
		local addedBy = v.usr or "Unknown";
		local deletedBy = v.usd or "Unknown";
		local isLoyal = v.loy;
		local amount = tonumber(v.num) or 0;

		local pointType = isLoyal and (self.isCombine and "Sterilized Credit" or "Loyalty") or "Penalty";

		listRemoved:AddLine(reason, reasonDel, addedBy, deletedBy, pointType, amount);
	end;
end;

-- Called when the layout should be performed.
function PANEL:PerformLayout()
	DFrame.PerformLayout(self);
end;

vgui.Register("cwData", PANEL, "DFrame");

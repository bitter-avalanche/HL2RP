local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	self:SetBackgroundBlur(false);
	self:SetDeleteOnClose(false);

	-- Called when the button is clicked.
	function self.btnClose.DoClick(button)
		self:Close();
		self:Remove();
	end;
end;

-- Called each frame.
function PANEL:Think()
	local scrW = ScrW();
	local scrH = ScrH();

	self:SetSize(320, 180);
	self:SetPos( (scrW / 2) - (self:GetWide() / 2), (scrH / 2) - (self:GetTall() / 2) );
end;

-- A function to populate the panel.
function PANEL:Populate(motherPanel)
	if (!ispanel(motherPanel)) then
		self:Close();
		self:Remove();
	end;

	self:SetTitle("Delete Record");

	local doneButton = vgui.Create("DButton", self);
	doneButton:SetText("Delete");
	doneButton:DockMargin(0, 4, 0, 0);
	doneButton:Dock(BOTTOM);

	local panel = vgui.Create("DPanel", self);
	panel:Dock(FILL);

		local width = 320 - 10 - 8;

		local entryReason = vgui.Create("DTextEntry", panel);
		entryReason:SetSize(width, 25);
		entryReason:SetPos(4, 4);
		entryReason:SetText("Reason");

	-- Called when the button is clicked.
	function doneButton.DoClick(button)
		self:Close();
		self:Remove();

		if (!ispanel(motherPanel)) then
			return;
		end;

		local selectedID = motherPanel.listView:GetSelectedLine();

		if selectedID then
			local linePanel = motherPanel.listView:GetLine(selectedID);

			if linePanel.dataIndex then
				local oldData = motherPanel.dataPoints[linePanel.dataIndex];
				motherPanel.dataPoints[linePanel.dataIndex] = nil;

				table.insert(motherPanel.dataDeleted, {
					rsn = oldData.rsn,
					rsd = entryReason:GetText(),
					usr = oldData.usr,
					usd = Clockwork.Client:Name(),
					loy = oldData.loy,
					num = oldData.num
				});
			end;
		end;

		motherPanel:PopulateRecords();
		motherPanel:PopulateRichText();
	end;
end;

-- Called when the layout should be performed.
function PANEL:PerformLayout()
	DFrame.PerformLayout(self);
end;

vgui.Register("cwDataDelete", PANEL, "DFrame");

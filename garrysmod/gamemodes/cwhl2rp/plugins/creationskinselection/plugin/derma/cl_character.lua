--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode
--]]

local Clockwork = Clockwork;
local pairs = pairs;
local RunConsoleCommand = RunConsoleCommand;
local SysTime = SysTime;
local ScrH = ScrH;
local ScrW = ScrW;
local table = table;
local string = string;
local vgui = vgui;
local math = math;

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	local smallTextFont = Clockwork.option:GetFont("menu_text_small");
	local tinyTextFont = Clockwork.option:GetFont("menu_text_tiny");
	local buttonsList = {};
	local colorWhite = Clockwork.option:GetColor("white");
	local buttonX = 20;
	local buttonY = 0;
	
	self.customData = self:GetParent().customData;
	self.buttonPanels = {};
	self:SetPaintBackground(false);
	
	self.nameLabel = vgui.Create("cwLabelButton", self);
	self.nameLabel:SetDisabled(true);
	self.nameLabel:SetFont(smallTextFont);
	self.nameLabel:SetText(string.upper(self.customData.name));
	self.nameLabel:SizeToContents();
	
	self.factionLabel = vgui.Create("cwLabelButton", self);
	self.factionLabel:SetDisabled(true);
	self.factionLabel:SetFont(tinyTextFont);
	self.factionLabel:SetText(string.upper(self.customData.faction));
	self.factionLabel:SizeToContents();
	self.factionLabel:SetPos(0, self.nameLabel:GetTall() + 8);
	
	self.characterModel = vgui.Create("cwCharacterModel", self);
	self.characterModel:SetModel(self.customData.model, self.customData.skin);
	self.characterModel:SetPos(0, self.factionLabel.y + self.factionLabel:GetTall() + 8);
	self.characterModel:SetSize(256, 256);
	buttonY = self.characterModel.y + self.characterModel:GetTall() + 8;
	
	local modelPanel = self.characterModel:GetModelPanel();
	local sequence = Clockwork.plugin:Call(
		"GetCharacterPanelSequence", modelPanel.Entity, self.customData.charTable
	);
	
	if (sequence) then
		modelPanel.Entity:ResetSequence(sequence);
	end;
	
	self.useButton = vgui.Create("DImageButton", self);
	self.useButton:SetToolTip("Use this character.");
	self.useButton:SetImage("icon16/tick.png");
	self.useButton:SetSize(16, 16);
	self.useButton:SetPos(0, buttonY);
	
	self.deleteButton = vgui.Create("DImageButton", self);
	self.deleteButton:SetToolTip("Delete this character.");
	self.deleteButton:SetImage("icon16/cross.png");
	self.deleteButton:SetSize(16, 16);
	self.deleteButton:SetPos(20, buttonY);
	
	Clockwork.plugin:Call(
		"GetCustomCharacterButtons", self.customData.charTable, buttonsList
	);
	
	for k, v in pairs(buttonsList) do
		local button = vgui.Create("DImageButton", self);
			buttonX = buttonX + 20;
			button:SetToolTip(v.toolTip);
			button:SetImage(v.image);
			button:SetSize(16, 16);
			button:SetPos(buttonX, buttonY);
		self.buttonPanels[#self.buttonPanels + 1] = button;
		
		-- Called when the button is clicked.
		function button.DoClick(button)
			local function Callback()
				Clockwork.datastream:Start("InteractCharacter", {
					characterID = self.customData.characterID, action = k
				});
			end;
			
			if (!v.OnClick or v.OnClick(Callback) != false) then
				Callback();
			end;
		end;
	end;
	
	-- Called when the button is clicked.
	function self.useButton.DoClick(spawnIcon)
		Clockwork.datastream:Start("InteractCharacter", {
			characterID = self.customData.characterID, action = "use"}
		);
	end;
	
	-- Called when the button is clicked.
	function self.deleteButton.DoClick(spawnIcon)
		Clockwork.kernel:AddMenuFromData(nil, {
			["Yes"] = function()
				Clockwork.datastream:Start("InteractCharacter", {
					characterID = self.customData.characterID, action = "delete"}
				);
			end,
			["No"] = function() end
		});
	end;
	
	local modelPanel = self.characterModel:GetModelPanel();
	
	-- Called when the character model is clicked.
	function modelPanel.DoClick(modelPanel)
		local activePanel = Clockwork.character:GetActivePanel();
		
		if (activePanel:GetSelectedModel() == self) then
			local options = {};
			local panel = Clockwork.character:GetPanel();
			
			options["Use"] = function()
				Clockwork.datastream:Start("InteractCharacter", {
					characterID = self.customData.characterID, action = "use"}
				);
			end;
			
			options["Delete"] = {};
			options["Delete"]["No"] = function() end;
			options["Delete"]["Yes"] = function()
				Clockwork.datastream:Start("InteractCharacter", {
					characterID = self.customData.characterID, action = "delete"}
				);
			end;
			
			Clockwork.plugin:Call(
				"GetCustomCharacterOptions", self.customData.charTable, options, menu
			);
			
			Clockwork.kernel:AddMenuFromData(nil, options, function(menu, key, value)
				menu:AddOption(key, function()
					Clockwork.datastream:Start("InteractCharacter", {
						characterID = self.customData.characterID, action = value}
					);
				end);
			end);
		else
			for k, v in pairs(activePanel:GetCharacterPanels()) do
				if (v == self) then
					activePanel:SetSelectedIdx(k);
				end;
			end;
		end;
	end;
	
	local maxWidth = math.max(buttonX, 200);
	
	if (self.nameLabel:GetWide() > maxWidth) then
		maxWidth = self.nameLabel:GetWide();
	end;
	
	if (self.factionLabel:GetWide() > maxWidth) then
		maxWidth = self.factionLabel:GetWide();
	end;
	
	self.characterModel:SetPos((maxWidth / 2) - 128, self.characterModel.y);
	self.factionLabel:SetPos((maxWidth / 2) - (self.factionLabel:GetWide() / 2), self.factionLabel.y);
	self.nameLabel:SetPos((maxWidth / 2) - (self.nameLabel:GetWide() / 2), self.nameLabel.y);
	self:SetSize(maxWidth, buttonY + 32);
	
	local buttonAddX = ((maxWidth / 2) - (buttonX / 2)) - 10;
		self.useButton:SetPos(self.useButton.x + buttonAddX, self.useButton.y);
		self.deleteButton:SetPos(self.deleteButton.x + buttonAddX, self.deleteButton.y);
	for k, v in pairs(self.buttonPanels) do
		v:SetPos(v.x + buttonAddX, v.y);
	end;
end;

-- A function to set whether the panel is active.
function PANEL:SetActive(bActive)
	if (bActive) then
		self.nameLabel:OverrideTextColor(
			Clockwork.option:GetColor("information")
		);
	else
		self.nameLabel:OverrideTextColor(false);
	end;
end;

-- Called each frame.
function PANEL:Think()
	local informationColor = Clockwork.option:GetColor("information");
	local weaponModel = Clockwork.plugin:Call(
		"GetCharacterPanelWeaponModel", self, self.customData.charTable
	);
	local toolTip = Clockwork.plugin:Call(
		"GetCharacterPanelToolTip", self, self.customData.charTable
	);
	local details = Clockwork.kernel:MarkupTextWithColor("[Details]", informationColor);
	
	details = Clockwork.kernel:AddMarkupLine(
		details, self.customData.details or "This character has no details to display."
	);
	
	if (toolTip and toolTip != "") then
		details = Clockwork.kernel:AddMarkupLine(details, "[Information]", informationColor);
		details = Clockwork.kernel:AddMarkupLine(details, toolTip);
	end;
	
	if (weaponModel) then
		self.characterModel:SetWeaponModel(weaponModel);
	else
		self.characterModel:SetWeaponModel(false);
	end;
	
	self.characterModel:SetDetails(details);
end;
	
vgui.Register("cwCharacterPanel", PANEL, "DPanel");

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	self:SetPaintBackground(false);
	
	self.modelPanel = vgui.Create("DModelPanel", self);
	self.modelPanel:SetAmbientLight(Color(255, 255, 255, 255));
	Clockwork.kernel:CreateMarkupToolTip(self.modelPanel);
	
	-- Called when the entity should be laid out.
	function self.modelPanel.LayoutEntity(modelPanel, entity)
		modelPanel:RunAnimation();
	end;
end;

-- A function to make the panel fade out.
function PANEL:FadeOut(speed, Callback)
	if (self:GetAlpha() > 0 and (!self.animation or !self.animation:Active())) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetAlpha(255 - (delta * 255));
			
			if (animation.Finished) then
				panel:SetVisible(false);
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		Clockwork.option:PlaySound("rollover");
		
		return true;
	else
		self:SetAlpha(0);
		self:SetVisible(false);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- A function to make the panel fade in.
function PANEL:FadeIn(speed, Callback)
	if (self:GetAlpha() == 0 and (!self.animation or !self.animation:Active())) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetAlpha(delta * 255);
			
			if (animation.Finished) then
				self.animation = nil;
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		Clockwork.option:PlaySound("click_release");
		self:SetVisible(true);
		
		return true;
	else
		self:SetVisible(true);
		self:SetAlpha(255);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- A function to set the alpha of the panel.
function PANEL:SetAlpha(alpha)
	local color = self.modelPanel:GetColor();
	
	self.modelPanel:SetColor(Color(color.r, color.g, color.b, alpha));
end;

-- A function to get the alpha of the panel.
function PANEL:GetAlpha(alpha)
	local color = self.modelPanel:GetColor();
	
	return color.a;
end;

-- Called each frame.
function PANEL:Think()
	local entity = self.modelPanel.Entity;
	
	if (IsValid(entity)) then
		entity:SetPos(Vector(0, 0, 0));
	end;
	
	if (self.animation) then
		self.animation:Run();
	end;
	
	entity:ClearPoseParameters();
	self:InvalidateLayout(true);
end;

-- A function to get the panel's model panel.
function PANEL:GetModelPanel()
	return self.modelPanel;
end;

-- Called when the layout should be performed.
function PANEL:PerformLayout(w, h)
	self.modelPanel:SetSize(w, h);
end;

-- A function to set the model details.
function PANEL:SetDetails(details)
	self.modelPanel:SetMarkupToolTip(details);
end;

-- A function to set the model weapon.
function PANEL:SetWeaponModel(weaponModel)
	if (!weaponModel and IsValid(self.weaponEntity)) then
		self.weaponEntity:Remove();
		return;
	end;
	
	if (!weaponModel and !IsValid(self.weaponEntity)
	or IsValid(self.weaponEntity) and self.weaponEntity:GetModel() == weaponModel) then
		return;
	end;
	
	if (IsValid(self.weaponEntity)) then
		self.weaponEntity:Remove();
	end;
	
	self.weaponEntity = ClientsideModel(weaponModel, RENDER_GROUP_OPAQUE_ENTITY);
	self.weaponEntity:SetParent(self.modelPanel.Entity);
	self.weaponEntity:AddEffects(EF_BONEMERGE);
end;

-- A function to set the model.
function PANEL:SetModel(model, skin)
	self.modelPanel:SetModel(model, skin);
	print(skin)
	
	local entity = ents.CreateClientProp("models/error.mdl");
		entity:SetAngles(Angle(0, 0, 0));
		entity:SetPos(Vector(0, 0, 0));
		entity:SetModel(model);
		entity:Spawn();
		entity:Activate();
	entity:PhysicsInit(SOLID_VPHYSICS);
	
	local skin = skin;
	
	if (skin != nil) then
		entity:SetSkin(skin);
	end;
	
	local obbCenter = entity:OBBCenter();
		obbCenter.z = obbCenter.z * 1.09;
	local distance = entity:BoundingRadius() * 1.2;
	
	self.modelPanel:SetLookAt(obbCenter)
	self.modelPanel:SetCamPos(
		obbCenter + Vector(distance * 1.56, distance * 0.31, distance * 0.4)
	);
	
	entity:Remove();
	
	if (IsValid(self.modelPanel.Entity)) then
		local sequence = self.modelPanel.Entity:LookupSequence("idle");
		local menuSequence = Clockwork.animation:GetMenuSequence(model, true);
		local leanBackAnims = {"LineIdle01", "LineIdle02", "LineIdle03"};
		local leanBackAnim = self.modelPanel.Entity:LookupSequence(
			leanBackAnims[math.random(1, #leanBackAnims)]
		);
		
		
		if (leanBackAnim > 0) then
			sequence = leanBackAnim;
		end;
		
		if (menuSequence) then
			menuSequence = self.modelPanel.Entity:LookupSequence(menuSequence);
			
			if (menuSequence > 0) then
				sequence = menuSequence;
			end;
		end;
		
		if (sequence <= 0) then
			sequence = self.modelPanel.Entity:LookupSequence("idle_unarmed");
		end;
		
		if (sequence <= 0) then
			sequence = self.modelPanel.Entity:LookupSequence("idle1");
		end;
		
		if (sequence <= 0) then
			sequence = self.modelPanel.Entity:LookupSequence("walk_all");
		end;
		
		self.modelPanel.Entity:ResetSequence(sequence);
	end;
end;
	
vgui.Register("cwCharacterModel", PANEL, "DPanel");

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	local smallTextFont = Clockwork.option:GetFont("menu_text_small");
	local panel = Clockwork.character:GetPanel();
	
	self.categoryList = vgui.Create("DCategoryList", self);
 	self.categoryList:SetPadding(2);
 	self.categoryList:SizeToContents();
	
	self.overrideModel = nil;
	self.bSelectModel = nil;
	self.bPhysDesc = (Clockwork.command:FindByID("CharPhysDesc") != nil);
	self.info = Clockwork.character:GetCreationInfo();
	
	if (!Clockwork.faction.stored[self.info.faction].GetModel) then
		self.bSelectModel = true;
	end;
	
	local genderModels = Clockwork.faction.stored[self.info.faction].models[string.lower(self.info.gender)];
	
	if (genderModels and #genderModels == 1) then
		self.bSelectModel = false;
		self.overrideModel = genderModels[1];
		
		if (!panel:FadeInModelPanel(self.overrideModel)) then
			panel:SetModelPanelModel(self.overrideModel);
		end;
	end;
	
	if (!Clockwork.faction.stored[self.info.faction].GetName) then
		self.nameForm = vgui.Create("DForm", self);
		self.nameForm:SetPadding(4);
		self.nameForm:SetName("Name");
		
		if (Clockwork.faction.stored[self.info.faction].useFullName) then
			self.fullNameTextEntry = self.nameForm:TextEntry("Full Name");
			self.fullNameTextEntry:SetAllowNonAsciiCharacters(true);
		else
			self.forenameTextEntry = self.nameForm:TextEntry("Forename");
			self.forenameTextEntry:SetAllowNonAsciiCharacters(true);
			
			self.surnameTextEntry = self.nameForm:TextEntry("Surname");
			self.surnameTextEntry:SetAllowNonAsciiCharacters(true);
		end;
	end;
	
	if (self.bSelectModel or self.bPhysDesc) then
		self.appearanceForm = vgui.Create("DForm");
		self.appearanceForm:SetPadding(4);
		self.appearanceForm:SetName("Appearance");
		
		if (self.bPhysDesc and self.bSelectModel) then
			self.appearanceForm:Help("Write a physical description for your character in full English, and select an appropriate model.");
		elseif (self.bPhysDesc) then
			self.appearanceForm:Help("Write a physical description for your character in full English.");
		end;
		
		if (self.bPhysDesc) then
			self.physDescTextEntry = self.appearanceForm:TextEntry("Description");
			self.physDescTextEntry:SetAllowNonAsciiCharacters(true);
		end;
		
		if (self.bSelectModel) then
			self.modelItemsList = vgui.Create("DPanelList", self);
				self.modelItemsList:SetPadding(4);
				self.modelItemsList:SetSpacing(16);
				self.modelItemsList:EnableHorizontal(true);
				self.modelItemsList:EnableVerticalScrollbar(true);
			self.appearanceForm:AddItem(self.modelItemsList);
			self.skinItemsList = vgui.Create("DPanelList", self);
				self.skinItemsList:SetName("Skins (If any)");
				self.skinItemsList:SetPadding(4);
				self.skinItemsList:SetSpacing(16);
				self.skinItemsList:EnableHorizontal(true);
				self.skinItemsList:EnableVerticalScrollbar(true);
			self.appearanceForm:AddItem(self.skinItemsList);
		end;
	end;
	
	if (self.nameForm) then
		self.categoryList:AddItem(self.nameForm);
	end;
	
	if (self.appearanceForm) then
		self.categoryList:AddItem(self.appearanceForm);
	end;
	
	local informationColor = Clockwork.option:GetColor("information");
	local lowerGender = string.lower(self.info.gender);
	local spawnIcon = nil;
	
	for k, v in pairs(Clockwork.faction.stored) do
		if (v.name == self.info.faction) then
			if (self.modelItemsList and v.models[lowerGender]) then
				for k2, v2 in pairs(v.models[lowerGender]) do
					spawnIcon = Clockwork.kernel:CreateMarkupToolTip(vgui.Create("cwSpawnIcon", self));
					spawnIcon:SetModel(v2);
					
					-- Called when the spawn icon is clicked.
					function spawnIcon.DoClick(spawnIcon)
						if (self.selectedSpawnIcon) then
							self.selectedSpawnIcon:SetColor(nil);
						end;
						
						spawnIcon:SetColor(informationColor);
						
						if (!panel:FadeInModelPanel(v2)) then
							panel:SetModelPanelModel(v2, 0);
							
						end;
						
						self.selectedSpawnIcon = spawnIcon;
							local entity = ents.CreateClientProp("models/error.mdl");
								entity:SetAngles(Angle(0, 0, 0));
								entity:SetPos(Vector(0, 0, 0));
								entity:SetModel(v2);
								entity:Spawn();
								entity:Activate();
							entity:PhysicsInit(SOLID_VPHYSICS);

							self.skinCount = entity:SkinCount();

							entity:Remove();
						self.selectedModel = v2;
						self.skinItemsList:Clear();
						if (self.skinCount > 1) then						
							for i = 1, self.skinCount do
								skinIcon = Clockwork.kernel:CreateMarkupToolTip(vgui.Create("cwSpawnIcon", self));
								skinIcon:SetModel(self.selectedModel, i);
											
								-- Called when the spawn icon is clicked.
								function skinIcon.DoClick(skinIcon)
									if (self.selectedskinIcon) then
										self.selectedskinIcon:SetColor(nil);
									end;
											
									skinIcon:SetColor(informationColor);
													
									if (!panel:FadeInModelPanel(v2)) then
										panel:SetModelPanelModel(v2, i);
										panel.characterModel:GetModelPanel().Entity:SetSkin(i)
									end;
													
									self.selectedskinIcon = skinIcon;
									self.selectedSkin = i;
								end;
												
								self.skinItemsList:AddItem(skinIcon);
							end;
						end;
					end;				
					self.modelItemsList:AddItem(spawnIcon);
				end;
			end;
		end;
	end;		
end;

-- Called when the next button is pressed.
function PANEL:OnNext()
	if (self.overrideModel) then
		self.info.model = self.overrideModel;
	else
		self.info.model = self.selectedModel;
	end;
	
	self.info.skin = self.selectedSkin or 0
	
	if (!Clockwork.faction.stored[self.info.faction].GetName) then
		if (IsValid(self.fullNameTextEntry)) then
			self.info.fullName = self.fullNameTextEntry:GetValue();
			
			if (self.info.fullName == "") then
				Clockwork.character:SetFault("You did not choose a name, or the name that you chose is not valid!");
				return false;
			end;
		else
			self.info.forename = self.forenameTextEntry:GetValue();
			self.info.surname = self.surnameTextEntry:GetValue();
			
			if (self.info.forename == "" or self.info.surname == "") then
				Clockwork.character:SetFault("You did not choose a name, or the name that you chose is not valid!");
				return false;
			end;
			
			if (string.find(self.info.forename, "[%p%s%d]") or string.find(self.info.surname, "[%p%s%d]")) then
				Clockwork.character:SetFault("Your forename and surname must not contain punctuation, spaces or digits!");
				return false;
			end;
			
			if (!string.find(self.info.forename, "[aeiou]") or !string.find(self.info.surname, "[aeiou]")) then
				Clockwork.character:SetFault("Your forename and surname must both contain at least one vowel!");
				return false;
			end;
			
			if (string.len(self.info.forename) < 2 or string.len(self.info.surname) < 2) then
				Clockwork.character:SetFault("Your forename and surname must both be at least 2 characters long!");
				return false;
			end;
			
			if (string.len(self.info.forename) > 16 or string.len(self.info.surname) > 16) then
				Clockwork.character:SetFault("Your forename and surname must not be greater than 16 characters long!");
				return false;
			end;
		end;
	end;
	
	if (self.bSelectModel and !self.info.model) then
		Clockwork.character:SetFault("You did not choose a model, or the model that you chose is not valid!");
		return false;
	end;
	
	if (self.bPhysDesc) then
		local minimumPhysDesc = Clockwork.config:Get("minimum_physdesc"):Get();
			self.info.physDesc = self.physDescTextEntry:GetValue();
		if (string.len(self.info.physDesc) < minimumPhysDesc) then
			Clockwork.character:SetFault("The physical description must be at least "..minimumPhysDesc.." characters long!");
			return false;
		end;
	end;
end;

-- Called when the panel is painted.
function PANEL:Paint(w, h) end;

-- A function to make the panel fade out.
function PANEL:FadeOut(speed, Callback)
	if (self:GetAlpha() > 0 and (!self.animation or !self.animation:Active())) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetAlpha(255 - (delta * 255));
			
			if (animation.Finished) then
				panel:SetVisible(false);
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		Clockwork.option:PlaySound("rollover");
	else
		self:SetVisible(false);
		self:SetAlpha(0);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- A function to make the panel fade in.
function PANEL:FadeIn(speed, Callback)
	if (self:GetAlpha() == 0 and (!self.animation or !self.animation:Active())) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetVisible(true);
			panel:SetAlpha(delta * 255);
			
			if (animation.Finished) then
				self.animation = nil;
			end;
			
			if (animation.Finished and Callback) then
				Callback();
			end;
		end);
		
		if (self.animation) then
			self.animation:Start(speed);
		end;
		
		Clockwork.option:PlaySound("click_release");
	else
		self:SetVisible(true);
		self:SetAlpha(255);
		
		if (Callback) then
			Callback();
		end;
	end;
end;

-- Called each frame.
function PANEL:Think()
	self:InvalidateLayout(true);
	
	if (self.animation) then
		self.animation:Run();
	end;
end;

-- Called when the layout should be performed.
function PANEL:PerformLayout(w, h)
	self.categoryList:StretchToParent(0, 0, 0, 0);
	
	if (IsValid(self.modelItemsList)) then
		self.modelItemsList:SetTall(256);
		self.skinItemsList:SetTall(256);
	end;
	
	self:SetSize(512, math.min(self.categoryList.pnlCanvas:GetTall() + 8, ScrH() * 0.6));
end;

vgui.Register("cwCharacterStageTwo", PANEL, "EditablePanel");
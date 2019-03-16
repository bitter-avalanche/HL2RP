AddCSLuaFile();

SWEP.PrintName = "Ration";
SWEP.Purpose = "Containing and transporting Citizen rations.";
SWEP.Author = "Viz";
SWEP.Instructions = "Primary Fire (Hold):\nOpen ration packet, moving will cancel.";
SWEP.WorldModel = "models/weapons/w_package.mdl";
SWEP.ViewModel = ""; -- TODO
SWEP.DrawAmmo = false;
SWEP.DrawCrosshair = false;
SWEP.Spawnable = true;
SWEP.AdminOnly = true;
SWEP.AdminSpawnable = true;
SWEP.Category = "Clockwork";

SWEP.Primary.Ammo = "none";
SWEP.Primary.ClipSize = -1;
SWEP.Primary.DefaultClip = -1;

SWEP.Secondary.Ammo = "none";
SWEP.Secondary.ClipSize = -1;
SWEP.Secondary.DefaultClip = -1;

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + 1.5);

	if (SERVER) then
		local openTime = Clockwork.config:Get("ration_open_delay"):Get();

		Clockwork.player:SetAction(self.Owner, "open", openTime);
		Clockwork.player:ConditionTimer(self.Owner, openTime, function()
			if (!IsValid(self) or self.Owner:GetVelocity():Length2D() != 0 or !self.Owner:KeyDown(IN_ATTACK)) then
				return false;
			end;

			local curTime = CurTime();
			if (!self.nextSound or self.nextSound <= curTime) then
				local sound = "immersiverations/search"..math.random(1, 6)..".wav";
				local duration = SoundDuration(sound);
				
				if (duration == 0) then
					duration = 3.5;
				end;

				self.nextSound = curTime + duration;
				self.Owner:EmitSound(sound);
			end;

			return true;
		end, function(bSuccess)
			if (!IsValid(self)) then return; end;

			self:SetNextPrimaryFire(CurTime() + 1.5);
			self.nextSound = nil;

			Clockwork.player:SetAction(self.Owner, "open", false);

			if (!bSuccess) then return; end;

			local itemTable = Clockwork.item:GetByWeapon(self);

			if (itemTable and itemTable:Open(self.Owner) != false) then
				self.Owner:StripWeapon("cw_ration");
			end;
		end);
	end;
end;

function SWEP:Holster()
	if (!IsFirstTimePredicted()) then return; end;

	Clockwork.player:Notify(self.Owner, "You have dropped your ration!");
	Clockwork.player:DropWeapon(self.Owner, "cw_ration");

	return true;
end;

function SWEP:CanSecondaryAttack() return false; end;

function SWEP:GetRaised() return true; end;

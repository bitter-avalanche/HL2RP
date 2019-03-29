-- Called when a player attempts to change class.
function Schema:PlayerCanChangeClass(player, class)
	Clockwork.player:Notify(player, "You don't have permission to do this!");
	return false;
end;
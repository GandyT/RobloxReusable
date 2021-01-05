local part = script.Parent
part.Touched:Connect(function(Object) 
	if Object.Parent:FindFirstChild("Humanoid") then
		local Player = game.Players[Object.Parent.Name]
	end	
end)

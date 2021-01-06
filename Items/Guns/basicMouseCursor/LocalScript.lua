local maxAmmo = 10
local ammo = maxAmmo
local reloading = false
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local textLabel = playerGui:WaitForChild("AmmoGui"):FindFirstChild("Ammo")
local Mouse = player:GetMouse()

script.parent.Equipped:Connect(function(Mouse) 
	local function reload()
		reloading = true
		wait(1)
		ammo = maxAmmo
		reloading = false
	end	
	
	script.parent.Activated:Connect(function()
		if ammo > 0 and not reloading then
			ammo = ammo - 1
			script.Parent.GunShot:Play()
			
			print("Searching Target")
			if Mouse.Target.Parent:FindFirstChild("Humanoid") then
				print("Target found!")
				script.Parent.DamageDealt:FireServer(Mouse.Target.Parent, 20)
			end
		elseif reloading == false then
			reload()
			script.Parent.GunShot:Stop()
		end
		while wait() do
			textLabel.Text = (ammo).."/"..maxAmmo
		end
	end)
	
	local input = game:GetService("UserInputService")
	input.InputBegan:Connect(function (Key) 
		if Key.KeyCode == Enum.KeyCode.R and reloading == false and ammo ~= maxAmmo then
			reload()
		end
	end)
end)

script.Parent.DamageDealt.OnServerEvent:Connect(function(player, Target, Damage)
	print("Damage Dealt")
	Target.Humanoid:TakeDamage(Damage)
end)

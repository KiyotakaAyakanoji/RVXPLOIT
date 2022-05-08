local UILib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local UITab = UILib:NewWindow("Rvxploit | AFS")
local SectionTab = UITab:NewSection("Farm")
local SectionTab2 = UITab:NewSection("Misc")
local SectionTab3 = UITab:NewSection("Teleport")

local Replicated = game:GetService('ReplicatedStorage')
local Multiplier = 100

SectionTab:CreateDropdown("Stats", {"Strength", "Durability", "Chakra", "Sword", "Agility","Speed"},1,function(t)
	_G.Test = t
end)

SectionTab:CreateToggle("Auto Train",function(ToggleVal)
	_G.toggleAT = ToggleVal
	if _G.Test == "Sword" then
		while _G.toggleAT do
			wait()
			local args = {[1] = "SE",[2] = true}
			game:GetService("ReplicatedStorage").RSPackage.Events.GeneralEvent:FireServer(unpack(args))    
			local a = require(game:GetService("Players").LocalPlayer.PlayerGui.Main.MainClient.StatModuleClient)
			a.SendToServer("Sword")
		end
	else
		while _G.toggleAT do
			wait()
			local a = require(game:GetService("Players").LocalPlayer.PlayerGui.Main.MainClient.StatModuleClient)
			a.SendToServer(_G.Test)
		end
	end
end)
		
SectionTab:CreateDropdown("Stat",{"Strength", "Durability", "Chakra", "Sword", "Agility","Speed"},1,function(upg)
	_G.SUD = upg
end)

SectionTab:CreateToggle("Auto Upgrade",function(ToggleUPG)
	_G.SUT = ToggleUPG
	while _G.SUT do
		wait(1)
			local args = {[1] = "Upgrade",[2] = _G.SUD}
		game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
	end
end)

SectionTab:CreateButton("One Time Upgrade",function()
	local args = {[1] = "Upgrade",[2] = _G.SUD}
	game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
end)

SectionTab:CreateButton("Fast Chakra(Froze Screen)",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/KiyotakaAyakanoji/RVXPLOIT/main/chakra"))()
end)

SectionTab:CreateToggle("Auto Yen/Chakra(Lag)", function(ToggleYC)
	_G.YC = ToggleYC
	while _G.YC do task.wait(0)
		for i = 10, Multiplier do
			task.spawn(function()
				Replicated.RSPackage.Events.GeneralFunction:InvokeServer("LotteryRandomDraw")
				Replicated.RSPackage.Events.GeneralEvent:FireServer("SpinFinished")
			end)
		end
	end
end)

SectionTab2:CreateSlider("Walkspeed",0,200,100,false,function(ws)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ws
end)

SectionTab2:CreateSlider("Jump Power",0,200,100,false,function(jp)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = jp
end)

SectionTab2:CreateButton("Max WalkSpeed",function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 126
end)

SectionTab2:CreateButton("Max JumpPower",function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 175
end)

SectionTab2:CreateTextbox("Fly Speed",function(fs)
	local lp = game.Players.LocalPlayer
	local mc = lp.PlayerGui.Main.MainClient
	local fly, speedidx

	for i, f in pairs(getconnections(lp.CharacterAdded)) do
		if f.Function and debug.getinfo(f.Function).short_src == mc:GetFullName() then
			fly = debug.getupvalues(f.Function)[1]
			for _, v in pairs(debug.getupvalues(fly)) do
				if v==20 and type(v) == 'number' then
					speedidx = _
					break
				end
			end
		end
	end
	local function onCharacterAdded()
		repeat wait() until lp.Character and lp.Character:FindFirstChild('HumanoidRootPart') and lp.Character.HumanoidRootPart:FindFirstChild('BodyPosition')
		local bp = lp.Character.HumanoidRootPart.BodyPosition
		bp.Changed:Connect(function(prop)
			if prop == 'Position' then
				debug.setupvalue(fly, speedidx or 22, fs)
			end
		end)
	end
	lp.CharacterAdded:Connect(onCharacterAdded)
	onCharacterAdded()
end)

SectionTab3:CreateButton("Dragon Ball",function()
	local old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	
	for _,i in pairs(game.Workspace.MouseIgnore:GetChildren()) do
		if i:FindFirstChild("ClickPart") then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = i.ClickPart.CFrame
			break
		end
	end
	if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == old then
		game.StarterGui:SetCore("SendNotification", {
			Title = "No Dragon Ball Found",
			Text = "Dragon Ball still not spawned",
			Icon = "",
			Duration = 2,
		})
	end
end)

SectionTab3:CreateButton("Devil Fruit",function()
	local old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	local player = game:GetService('Players').LocalPlayer

	for k,v in next,game:GetService("Workspace").MiscModels:GetDescendants() do 
		if v.Name == "ManualWeld" and v.Parent.Parent.Name == "Model" then
			player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(0,2,0)
		end
	end
	if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == old then
		game.StarterGui:SetCore("SendNotification", {
			Title = "No Devil Fruit Found",
			Text = "Devil Fruit still not spawned",
			Icon = "",
			Duration = 2,
		})
	end
end) 

SectionTab3:CreateButton("Save Position",function()
	local player = game:GetService('Players').LocalPlayer
	_G.SP = player.Character.HumanoidRootPart.CFrame
end)

SectionTab3:CreateButton("Load Position",function()
	local test1 = _G.SP
	local player = game:GetService('Players').LocalPlayer
	player.Character.HumanoidRootPart.CFrame = test1
end)

if game.PlaceId == 4042427666 then
	local player = game:GetService('Players').LocalPlayer
		SectionTab3:CreateDropdown("Dimension",{"Dimension 2", "Dimension 3", "Dimension 4", "Dimension 5", "Tournament Dimension"},1,function(t)
		player.Character.HumanoidRootPart.CFrame = CFrame.new(3572.78687, 59.9999886, -105.535889)
		wait(1.5)
		for k,v in next,game:GetService("Workspace").DimensionPortal:GetDescendants() do 
			if v.Name == "ClickDetector" and v.Parent.Parent.Name == t then
				player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(2,2,0)
				wait(1.5)
				local args = {[1] = "Portal",[2] = {["PlaceID"] = t}}
				game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
			end
		end
	end)
elseif game.PlaceId == 5113678354 then
		SectionTab3:CreateDropdown("Dimension",{"Dimension 1", "Dimension 3", "Dimension 4", "Dimension 5", "Tournament Dimension"},1,function(t)
		player.Character.HumanoidRootPart.CFrame = CFrame.new(554.137451, 56.5079231, -309.66806)    
		wait(1.5)
		for k,v in next,game:GetService("Workspace").DimensionPortal:GetDescendants() do 
			if v.Name == "ClickDetector" and v.Parent.Parent.Name == t then
				player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(2,2,0)
				wait(1.5)
				local args = {[1] = "Portal",[2] = {["PlaceID"] = t}}
				game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
			end
		end
	end)
elseif game.PlaceId == 5113680396 then
		SectionTab3:CreateDropdown("Dimension",{"Dimension 1", "Dimension 2", "Dimension 4", "Dimension 5", "Tournament Dimension"},1,function(t)
		player.Character.HumanoidRootPart.CFrame = CFrame.new(79.5033646, 56.5079231, 76.6112061)    
		wait(1.5)
		for k,v in next,game:GetService("Workspace").DimensionPortal:GetDescendants() do 
			if v.Name == "ClickDetector" and v.Parent.Parent.Name == t then
				player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(2,2,0)
				wait(1.5)
				local args = {[1] = "Portal",[2] = {["PlaceID"] = t}}
				game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
			end
		end
	end)
elseif game.PlaceId == 5445525505 then
		SectionTab3:CreateDropdown("Dimension",{"Dimension 1", "Dimension 2", "Dimension 3", "Dimension 5", "Tournament Dimension"},1,function(t)
		player.Character.HumanoidRootPart.CFrame = CFrame.new(-1305.71106, 85.4299393, -246.323242)    
		wait(1.5)
		for k,v in next,game:GetService("Workspace").DimensionPortal:GetDescendants() do 
			if v.Name == "ClickDetector" and v.Parent.Parent.Name == t then
				player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(2,2,0)
				wait(1.5)
				local args = {[1] = "Portal",[2] = {["PlaceID"] = t}}
				game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
			end
		end
	end)
elseif game.PlaceId == 6479720355 then
	SectionTab3:CreateDropdown("Dimension",{"Dimension 1", "Dimension 2", "Dimension 3", "Dimension 4", "Tournament Dimension"},1,function(t)
		player.Character.HumanoidRootPart.CFrame = CFrame.new(-823.57959, 29.0810032, -1379.17505)    
		wait(1.5)
		for k,v in next,game:GetService("Workspace").DimensionPortal:GetDescendants() do 
			if v.Name == "ClickDetector" and v.Parent.Parent.Name == t then
				player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(2,2,0)
				wait(1.5)
				local args = {[1] = "Portal",[2] = {["PlaceID"] = t}}
				game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
			end
		end
	end)
end
		
local cs = game.Players.LocalPlayer
local mc = cs.PlayerGui.Main.MainClient
local t1 = "Welcome "
local t2 = cs.Name
wait(0.5)
require(mc.NotifModule).Notify(t1..t2)
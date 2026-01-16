--================================================
-- Fish It Script Hub
-- Developer : gixss
-- Key       : VIP-233
--================================================

------------------
-- KEY SYSTEM
------------------
local VALID_KEY = "VIP-233"
local passed = false

local KeyGui = Instance.new("ScreenGui", game.CoreGui)
local KF = Instance.new("Frame", KeyGui)
KF.Size = UDim2.new(0,300,0,180)
KF.Position = UDim2.new(0.35,0,0.35,0)
KF.BackgroundColor3 = Color3.fromRGB(20,20,20)
KF.Active = true
KF.Draggable = true
Instance.new("UICorner", KF)

local KT = Instance.new("TextLabel", KF)
KT.Size = UDim2.new(1,0,0,40)
KT.BackgroundTransparency = 1
KT.Text = "🔐 Fish It Key System"
KT.TextColor3 = Color3.new(1,1,1)
KT.Font = Enum.Font.GothamBold
KT.TextSize = 18

local KB = Instance.new("TextBox", KF)
KB.Size = UDim2.new(0.9,0,0,35)
KB.Position = UDim2.new(0.05,0,0,60)
KB.PlaceholderText = "Enter Key"
KB.BackgroundColor3 = Color3.fromRGB(40,40,40)
KB.TextColor3 = Color3.new(1,1,1)
KB.Font = Enum.Font.Gotham
KB.TextSize = 14
Instance.new("UICorner", KB)

local KS = Instance.new("TextLabel", KF)
KS.Size = UDim2.new(1,0,0,20)
KS.Position = UDim2.new(0,0,0,100)
KS.BackgroundTransparency = 1
KS.TextColor3 = Color3.fromRGB(255,80,80)
KS.Font = Enum.Font.Gotham
KS.TextSize = 13

local KBTN = Instance.new("TextButton", KF)
KBTN.Size = UDim2.new(0.9,0,0,35)
KBTN.Position = UDim2.new(0.05,0,0,130)
KBTN.Text = "Verify"
KBTN.BackgroundColor3 = Color3.fromRGB(60,60,60)
KBTN.TextColor3 = Color3.new(1,1,1)
KBTN.Font = Enum.Font.GothamBold
KBTN.TextSize = 14
Instance.new("UICorner", KBTN)

KBTN.MouseButton1Click:Connect(function()
	if KB.Text == VALID_KEY then
		passed = true
		KeyGui:Destroy()
	else
		KS.Text = "❌ Key salah"
	end
end)

repeat task.wait() until passed

------------------
-- SERVICES
------------------
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer
local Char = LP.Character or LP.CharacterAdded:Wait()

------------------
-- STATES
------------------
local State = {
	AutoFish = false,
	AutoSell = false,
	AutoPerfect = false,
	AutoTotem = false,
	DivingGear = false,
	Fly = false,
	AutoBuyRod = false,
	AutoBuyBait = false,
	AutoBuyWeather = false
}

------------------
-- GUI
------------------
local gui = Instance.new("ScreenGui", game.CoreGui)
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,380,0,600)
main.Position = UDim2.new(0.3,0,0.15,0)
main.BackgroundColor3 = Color3.fromRGB(18,18,18)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "🎣 Fish It Script Hub | Dev: gixss"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 18

local function btn(txt,y)
	local b = Instance.new("TextButton", main)
	b.Size = UDim2.new(0.9,0,0,32)
	b.Position = UDim2.new(0.05,0,0,y)
	b.BackgroundColor3 = Color3.fromRGB(45,45,45)
	b.TextColor3 = Color3.new(1,1,1)
	b.Text = txt
	b.Font = Enum.Font.Gotham
	b.TextSize = 14
	Instance.new("UICorner", b)
	return b
end

-- BUTTONS
local AF = btn("Auto Fishing (Blatant) : OFF",50)
local AP = btn("Auto Perfect : OFF",85)
local AS = btn("Auto Sell All Fish : OFF",120)
local AT = btn("Auto Totem : OFF",155)
local DG = btn("Diving Gear : OFF",190)
local FL = btn("Fly : OFF",225)

local BR = btn("Auto Buy Rod : OFF",260)
local BB = btn("Auto Buy Bait : OFF",295)
local BW = btn("Auto Buy Weather : OFF",330)

local TP1 = btn("Teleport Esoteric Depths",370)
local TP2 = btn("Teleport Ancient Jungle",405)
local TP3 = btn("Teleport Ancient Ruin",440)
local TP4 = btn("Teleport Secret Temple",475)
local TP5 = btn("Teleport Tropical Grove",510)
local TP6 = btn("Teleport Coral",545)

------------------
-- AUTO LOOPS
------------------
task.spawn(function()
	while task.wait(0.25) do
		if State.AutoFish then
			local tool = Char:FindFirstChildOfClass("Tool")
			if tool then tool:Activate() end
		end
	end
end)

task.spawn(function()
	while task.wait(0.2) do
		if State.AutoPerfect then
			local r = RS:FindFirstChild("PerfectCatch")
			if r then r:FireServer() end
		end
	end
end)

task.spawn(function()
	while task.wait(3) do
		if State.AutoSell then
			local r = RS:FindFirstChild("SellAllFish")
			if r then r:FireServer() end
		end
	end
end)

task.spawn(function()
	while task.wait(2) do
		if State.AutoTotem then
			local r = RS:FindFirstChild("UseTotem")
			if r then r:FireServer() end
		end
	end
end)

-- AUTO BUY
task.spawn(function()
	while task.wait(5) do
		if State.AutoBuyRod then
			local r = RS:FindFirstChild("BuyRod")
			if r then r:FireServer() end
		end
		if State.AutoBuyBait then
			local r = RS:FindFirstChild("BuyBait")
			if r then r:FireServer() end
		end
		if State.AutoBuyWeather then
			local r = RS:FindFirstChild("BuyWeather")
			if r then r:FireServer() end
		end
	end
end)

-- DIVING GEAR
task.spawn(function()
	while task.wait(1) do
		if State.DivingGear then
			local bp = LP.Backpack
			local tool = bp:FindFirstChild("Diving Gear") or bp:FindFirstChild("DivingGear")
			if tool then Char.Humanoid:EquipTool(tool) end
		end
	end
end)

-- FLY
local BV, BG
local function startFly()
	local hrp = Char:WaitForChild("HumanoidRootPart")
	BV = Instance.new("BodyVelocity", hrp)
	BG = Instance.new("BodyGyro", hrp)
	BV.MaxForce = Vector3.new(9e9,9e9,9e9)
	BG.MaxTorque = Vector3.new(9e9,9e9,9e9)

	RunService:BindToRenderStep("Fly",0,function()
		if not State.Fly then return end
		local cam = workspace.CurrentCamera
		local v = Vector3.zero
		if UIS:IsKeyDown(Enum.KeyCode.W) then v += cam.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.S) then v -= cam.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.A) then v -= cam.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.D) then v += cam.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.Space) then v += cam.CFrame.UpVector end
		if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then v -= cam.CFrame.UpVector end
		BV.Velocity = v * 60
		BG.CFrame = cam.CFrame
	end)
end

local function stopFly()
	RunService:UnbindFromRenderStep("Fly")
	if BV then BV:Destroy() end
	if BG then BG:Destroy() end
end

------------------
-- TOGGLES
------------------
AF.MouseButton1Click:Connect(function()
	State.AutoFish = not State.AutoFish
	AF.Text = "Auto Fishing (Blatant) : "..(State.AutoFish and "ON" or "OFF")
end)
AP.MouseButton1Click:Connect(function()
	State.AutoPerfect = not State.AutoPerfect
	AP.Text = "Auto Perfect : "..(State.AutoPerfect and "ON" or "OFF")
end)
AS.MouseButton1Click:Connect(function()
	State.AutoSell = not State.AutoSell
	AS.Text = "Auto Sell All Fish : "..(State.AutoSell and "ON" or "OFF")
end)
AT.MouseButton1Click:Connect(function()
	State.AutoTotem = not State.AutoTotem
	AT.Text = "Auto Totem : "..(State.AutoTotem and "ON" or "OFF")
end)
DG.MouseButton1Click:Connect(function()
	State.DivingGear = not State.DivingGear
	DG.Text = "Diving Gear : "..(State.DivingGear and "ON" or "OFF")
end)
FL.MouseButton1Click:Connect(function()
	State.Fly = not State.Fly
	FL.Text = "Fly : "..(State.Fly and "ON" or "OFF")
	if State.Fly then startFly() else stopFly() end
end)
BR.MouseButton1Click:Connect(function()
	State.AutoBuyRod = not State.AutoBuyRod
	BR.Text = "Auto Buy Rod : "..(State.AutoBuyRod and "ON" or "OFF")
end)
BB.MouseButton1Click:Connect(function()
	State.AutoBuyBait = not State.AutoBuyBait
	BB.Text = "Auto Buy Bait : "..(State.AutoBuyBait and "ON" or "OFF")
end)
BW.MouseButton1Click:Connect(function()
	State.AutoBuyWeather = not State.AutoBuyWeather
	BW.Text = "Auto Buy Weather : "..(State.AutoBuyWeather and "ON" or "OFF")
end)

------------------
-- TELEPORT
------------------
local TP = {
	EsotericDepths = Vector3.new(120,10,-80),
	AncientJungle = Vector3.new(-200,12,150),
	AncientRuin = Vector3.new(300,15,-200),
	SecretTemple = Vector3.new(80,20,250),
	TropicalGrove = Vector3.new(-150,8,-300),
	Coral = Vector3.new(220,6,100)
}

local function teleport(v)
	if Char:FindFirstChild("HumanoidRootPart") then
		Char.HumanoidRootPart.CFrame = CFrame.new(v)
	end
end

TP1.MouseButton1Click:Connect(function() teleport(TP.EsotericDepths) end)
TP2.MouseButton1Click:Connect(function() teleport(TP.AncientJungle) end)
TP3.MouseButton1Click:Connect(function() teleport(TP.AncientRuin) end)
TP4.MouseButton1Click:Connect(function() teleport(TP.SecretTemple) end)
TP5.MouseButton1Click:Connect(function() teleport(TP.TropicalGrove) end)
TP6.MouseButton1Click:Connect(function() teleport(TP.Coral) end)

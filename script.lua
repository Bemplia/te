-- Variables
local Lighting = game:GetService("Lighting")
local uis = game:GetService("UserInputService")

-- Gui
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("The rake Noob Edition V1", "BloodTheme")

local Main = Window:NewTab("Main")
local Combat = Window:NewTab("Combat")
local Movement = Window:NewTab("Movement")
local Esp = Window:NewTab("Esp")
local World = Window:NewTab("World")
local Scripts = Window:NewTab("Scripts")
local Gui = Window:NewTab("Gui")
local Credits = Window:NewTab("Credits")

local MainSection = Main:NewSection("Main")
local CombatSection = Combat:NewSection("Combat")
local MovementSection = Movement:NewSection("Movement")
local EspSection = Esp:NewSection("Esp")
local WorldSection = World:NewSection("World")
local ScriptsSection = Scripts:NewSection("Scripts")
local GuiSection = Gui:NewSection("Gui")
local CreditsSection = Credits:NewSection("Creator: arbuzik.new")

-- Main
MainSection:NewButton("Rejoin", "", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)

MainSection:NewButton("Unlock Chat", "", function()
    game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = true
    game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Position = UDim2.new(0, 0, 1, -42)
end)

MainSection:NewButton("Unlock Camera", "", function()
    game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
    game.Players.LocalPlayer.CameraMinZoomDistance = 0.5
    game.Players.LocalPlayer.CameraMaxZoomDistance = 999
    game.Players.LocalPlayer.DevCameraOcclusionMode = 1
end)

MainSection:NewButton("Unlock Shop", "", function()
    game.Workspace.LocationsFolder.Shop.OutsidePlrPos:Destroy()
    game.Workspace.LocationsFolder.Shop.ShopDoor:Destroy()
end)

MainSection:NewButton("No Hud", "", function()
    game.Players.LocalPlayer.PlayerGui.RakeChaseGui:Destroy()
    game.Players.LocalPlayer.PlayerGui.HoursGui:Destroy()
end)

MainSection:NewButton("Remove Crawling", "", function()
    while game:GetService("RunService").RenderStepped:wait() do
        game.Players.LocalPlayer.Character.CharValues.Crawling.Value = false
        game.Players.LocalPlayer.Character.CharValues.NearRake.Value = false
        game.Players.LocalPlayer.Character.CharValues.CantRun.Value = false
    end
end)

MainSection:NewButton("Fullbright", "", function()
    local Lighting = game:GetService("Lighting")
	Lighting.Brightness = 2
	Lighting.ClockTime = 14
	Lighting.FogEnd = 100000
	Lighting.GlobalShadows = false
	Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
end)

-- Combat


-- Movement
MovementSection:NewButton("Inf stamina", "", function()
    local stam = game.Players.LocalPlayer.Character.CharValues.StaminaPercentValue
    local stamh;
    stamh = hookmetamethod(game, "__index", function(self, v)
        if self == stam and v == "Value" then
            return 100
        end
        return stamh(self,v)
    end)
end)

MovementSection:NewTextBox("Bypassing JumpPower", "Yay", function(power)
    _G.jump = power
    uis.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Space then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, _G.jump, 0)
        end
    end)
end)

-- Esp
EspSection:NewButton("Rakoof esp", "", function()
    while task.wait(3) do
        pcall (function()
            local BillboardGui = Instance.new("BillboardGui")
            local TextLabel = Instance.new("TextLabel")
            local TextLabel1 = Instance.new("TextLabel")
            local esp = Instance.new("BoxHandleAdornment",game.Workspace.RakoofNPC)
            BillboardGui.Parent = game.Workspace.RakoofNPC
            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            BillboardGui.Active = true
            BillboardGui.AlwaysOnTop = true
            BillboardGui.LightInfluence = 1
            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
            TextLabel.Parent = BillboardGui
            TextLabel.BackgroundTransparency = 1
            TextLabel.Size = UDim2.new(0, 200, 0, 50)
            TextLabel.Font = Enum.Font.SourceSans
            TextLabel.Text = "The Rakoof"
            TextLabel.Font = "Legacy"
            TextLabel.TextColor3 = Color3.new(225, 255, 0)
            TextLabel.TextScaled = false
            TextLabel.TextStrokeTransparency = 0
            TextLabel.TextSize = 8
            TextLabel.TextWrapped = true
            TextLabel1.Parent = BillboardGui
            TextLabel1.BackgroundTransparency = 1
            TextLabel1.Size = UDim2.new(0, 200, 0, 50)
            TextLabel1.Font = Enum.Font.SourceSans
            TextLabel1.Font = "Legacy"
            TextLabel1.TextScaled = false
            TextLabel1.TextStrokeTransparency = 0
            TextLabel1.TextSize = 8
            TextLabel1.TextColor3 = Color3.fromRGB(225, 255, 0)
            TextLabel1.Position = UDim2.new(0, 0, -0.3, 0)
            esp.Adornee = game.Workspace.RakoofNPC
            esp.ZIndex = 0
            esp.AlwaysOnTop = true
            esp.Color3 = Color3.fromRGB(225, 255, 0)
            esp.Transparency = 0.5
            esp.Size = Vector3.new(5,6,1,5)
            while task.wait() do
                TextLabel1.Text = "Health: ".. workspace.RakoofNPC.NPC.Health
            end
        end)
    end
end)

EspSection:NewButton("Players esp", "", function()
    while task.wait(1) do
        for i,v in pairs(game.Players:GetChildren()) do
            if v ~= game.Players.LocalPlayer then
                if v.Character.Torso:FindFirstChild("BoxHandleAdornment") == nil and v.Character:FindFirstChild("BillboardGui") == nil then 
                    local esp = Instance.new("BoxHandleAdornment", v.Character.Torso)
                    local BillboardGui = Instance.new("BillboardGui", v.Character)
                    local TextLabel = Instance.new("TextLabel", BillboardGui)
                    esp.Adornee = v.Character.Torso
                    esp.ZIndex = 0
                    esp.AlwaysOnTop = true
                    esp.Transparency = 0.7
                    esp.Size = Vector3.new(1.7,4.7,1)
                    BillboardGui.AlwaysOnTop = true
                    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                    BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
                    TextLabel.BackgroundTransparency = 1
                    TextLabel.Size = UDim2.new(0, 200, 0, 50)
                    TextLabel.Text = v.Name
                    TextLabel.TextStrokeTransparency = 0
                    TextLabel.TextSize = 6
                    esp.Color3 = v.TeamColor.Color
                    TextLabel.TextColor3 = v.TeamColor.Color
                end
            end
        end
    end
end)

EspSection:NewButton("Shop esp", "", function()
    local BillboardGui = Instance.new("BillboardGui", game.Workspace.LocationsFolder.Shop.EnterShopPart)
    local TextLabel = Instance.new("TextLabel", BillboardGui)
    BillboardGui.AlwaysOnTop = true
    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(0, 200, 0, 50)
    TextLabel.Text = "Shop"
    TextLabel.TextStrokeTransparency = 0
    TextLabel.TextSize = 6
    TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
end)

EspSection:NewButton("PowerStation esp", "", function()
    local BillboardGui = Instance.new("BillboardGui", game.Workspace.LocationsFolder.PowerStation.PowerSounds)
    local TextLabel = Instance.new("TextLabel", BillboardGui)
    BillboardGui.AlwaysOnTop = true
    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(0, 200, 0, 50)
    TextLabel.Text = "PowerStatiom"
    TextLabel.TextStrokeTransparency = 0
    TextLabel.TextSize = 6
    TextLabel.TextColor3 = Color3.fromRGB(255, 106, 0)
end)

EspSection:NewButton("Duck esp", "", function()
    for i,v in pairs(game.Workspace.Filter.StuffGiversFolder.DuckParts:GetChildren()) do
        local esp = Instance.new("BoxHandleAdornment", v)
        local BillboardGui = Instance.new("BillboardGui", v)
        local TextLabel = Instance.new("TextLabel", BillboardGui)
        esp.Adornee = v
        esp.ZIndex = 0
        esp.AlwaysOnTop = true
        esp.Transparency = 0.7
        esp.Size = Vector3.new(0.5,0.5,0.05)
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
        BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Size = UDim2.new(0, 200, 0, 50)
        TextLabel.Text = v.Name
        TextLabel.TextStrokeTransparency = 0
        TextLabel.TextSize = 6
        esp.Color3 = Color3.fromRGB(9, 255, 0)
        TextLabel.TextColor3 = Color3.fromRGB(9, 255, 0)
    end
end)

EspSection:NewButton("Pan spawns esp", "", function()
    for i,v in pairs(game.Workspace.Filter.StuffGiversFolder.PanGiverSpawns:GetChildren()) do
        if v.Name ~= "GiverTool" then
            local BillboardGui = Instance.new("BillboardGui", v)
            local TextLabel = Instance.new("TextLabel", BillboardGui)
            BillboardGui.AlwaysOnTop = true
            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
            BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
            TextLabel.BackgroundTransparency = 1
            TextLabel.Size = UDim2.new(0, 200, 0, 50)
            TextLabel.Text = v.Name
            TextLabel.TextStrokeTransparency = 0
            TextLabel.TextSize = 6
            TextLabel.TextColor3 = Color3.fromRGB(92, 92, 92)
        end
    end
end)

EspSection:NewButton("Scrap Metals", "", function()
    while task.wait(5) do
        for i,v in pairs(game.Workspace.Filter.StuffGiversFolder.ScrapMetals:GetChildren()) do
            if v.TriggerPart:FindFirstChild("BoxHandleAdornment") == nil and v.TriggerPart:FindFirstChild("BillboardGui") == nil then
                local esp = Instance.new("BoxHandleAdornment", v.TriggerPart)
                local BillboardGui = Instance.new("BillboardGui", v.TriggerPart)
                local TextLabel = Instance.new("TextLabel", BillboardGui)
                esp.Adornee = v.TriggerPart
                esp.ZIndex = 0
                esp.AlwaysOnTop = true
                esp.Transparency = 0.7
                esp.Size = Vector3.new(3.2,0.5,3.2)
                BillboardGui.AlwaysOnTop = true
                BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Size = UDim2.new(0, 200, 0, 50)
                TextLabel.Text = v.Name
                TextLabel.TextStrokeTransparency = 0
                TextLabel.TextSize = 6
                esp.Color3 = Color3.fromRGB(59, 25, 0)
                TextLabel.TextColor3 = Color3.fromRGB(59, 25, 0)
            end
        end
    end
end)

EspSection:NewButton("Flare spawns esp", "", function()
    for i,v in pairs(game.Workspace.Filter.StuffGiversFolder.FlareSpawns:GetChildren()) do
        if v.name == "Flare" then
            local esp = Instance.new("BoxHandleAdornment", v.Handle)
            local BillboardGui = Instance.new("BillboardGui", v.Handle)
            local TextLabel = Instance.new("TextLabel", BillboardGui)
            esp.Adornee = v.Handle
            esp.ZIndex = 0
            esp.AlwaysOnTop = true
            esp.Transparency = 0.7
            esp.Size = Vector3.new(0.5,0.05,0.5)
            BillboardGui.AlwaysOnTop = true
            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
            BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
            TextLabel.BackgroundTransparency = 1
            TextLabel.Size = UDim2.new(0, 200, 0, 50)
            TextLabel.Text = "Flare spawn"
            TextLabel.TextStrokeTransparency = 0
            TextLabel.TextSize = 6
            esp.Color3 = Color3.fromRGB(255, 0, 0)
            TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end
end)

-- World
WorldSection:NewButton("Remove power damage", "", function()
    game.Workspace.LocationsFolder.PowerStation.PowerDamage:Destroy()
end)

WorldSection:NewButton("Remove Trees", "", function()
    game.Workspace.NatureFolder.Trees:Destroy()
end)

WorldSection:NewButton("Remove Rocks", "", function()
    game.Workspace.NatureFolder.Rocks:Destroy()
end)

WorldSection:NewButton("Remove Bush", "", function()
    game.Workspace.NatureFolder.Bush:Destroy()
end)

-- Scripts
ScriptsSection:NewButton("Dark dex", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
end)

ScriptsSection:NewButton("Simple Spy", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
end)

ScriptsSection:NewButton("infinite Yield", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- Gui
GuiSection:NewKeybind("Toggle GUI", "", Enum.KeyCode.L, function()
	Library:ToggleUI()
end)

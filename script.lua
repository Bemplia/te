-- Variables
local Lighting = game:GetService("Lighting")
local uis = game:GetService("UserInputService")
local tweenservice = game:GetService("TweenService")

-- Gui
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("The rake Noob Edition V1", "BloodTheme")

local Main = Window:NewTab("Main")
local Combat = Window:NewTab("Combat")
local Movement = Window:NewTab("Movement")
local Teleport = Window:NewTab("Teleport")
local Esp = Window:NewTab("Esp")
local World = Window:NewTab("World")
local Scripts = Window:NewTab("Scripts")
local Gui = Window:NewTab("Gui")
local Credits = Window:NewTab("Credits")

local MainSection = Main:NewSection("Main")
local CombatSection = Combat:NewSection("Combat")
local MovementSection = Movement:NewSection("Movement")
local TeleportSection = Teleport:NewSection("Teleport")
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
    local cam = game.Players.LocalPlayer
    cam.DevCameraOcclusionMode = 1
    local camv;
    camv = hookmetamethod(game, "__index", function(self, v)
        if self == cam and v == "CameraMode" then
            return 0
        elseif self == cam and v == "CameraMinZoomDistance" then
            return 0.5
        elseif self == cam and v == "CameraMaxZoomDistance" then
            return 999
        end
        return camv(self,v)
    end)
end)

MainSection:NewButton("Unlock Shop", "", function()
    game.Workspace.LocationsFolder.Shop.OutsidePlrPos:Destroy()
    game.Workspace.LocationsFolder.Shop.ShopDoor:Destroy()
end)

MainSection:NewButton("No Hud", "", function()
    game.Players.LocalPlayer.PlayerGui.RakeChaseGui:Destroy()
    game.Players.LocalPlayer.PlayerGui.HoursGui:Destroy()
end)

MainSection:NewButton("Fullbright", "", function()
    Lighting.NormalSky:Destroy()
    Lighting.Atmosphere:Destroy()
    Lighting.DepthOfField:Destroy()
    while task.wait() do
        local Lighting = game:GetService("Lighting")
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end
end)

MainSection:NewButton("GameStats gui", "", function()
    local GameStats = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
    local Main = Instance.new("Frame", GameStats)
    local UICorner1 = Instance.new("UICorner", Main)
    local Holder = Instance.new("Frame", Main)
    local GameStatsLabel = Instance.new("TextLabel", Main)
    local UICorner2 = Instance.new("UICorner", Holder)
    local List = Instance.new("UIListLayout", Holder)
    local CornerFixer = Instance.new("Frame", Holder)
    local RakoofHealthLable = Instance.new("TextLabel", Holder)
    local Padding1 = Instance.new("UIPadding", RakoofHealthLable)
    local GameTimerLable = Instance.new("TextLabel", Holder)
    local Padding2 = Instance.new("UIPadding", GameTimerLable)
    local PowerTimerLable = Instance.new("TextLabel", Holder)
    local Padding3 = Instance.new("UIPadding", PowerTimerLable)

    GameStats.Name = "GameStats";
    GameStats.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;

    Main.BackgroundColor3 = Color3.fromRGB(174, 0, 4);
    Main.Size = UDim2.new(0, 250, 0, 175);
    Main.Position = UDim2.new(0.09108781069517136, 0, 0.06356589496135712, 0);
    Main.Name = "Main";

    UICorner1.CornerRadius = UDim.new(0, 6);

    GameStatsLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    GameStatsLabel.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    GameStatsLabel.TextSize = 20;
    GameStatsLabel.TextColor3 = Color3.fromRGB(0, 0, 0);
    GameStatsLabel.Size = UDim2.new(1, 0, 0.25, 0);
    GameStatsLabel.Text = "Game stats";
    GameStatsLabel.Name = "Label";
    GameStatsLabel.BackgroundTransparency = 1;

    Holder.BorderSizePixel = 0;
    Holder.BackgroundColor3 = Color3.fromRGB(131, 0, 3);
    Holder.Size = UDim2.new(1, 0, 1, -37);
    Holder.BorderColor3 = Color3.fromRGB(0, 0, 0);
    Holder.Position = UDim2.new(0, 0, 0.21142856776714325, 0);
    Holder.Name = "Holder";

    UICorner2.CornerRadius = UDim.new(0, 6);

    CornerFixer.BorderSizePixel = 0;
    CornerFixer.BackgroundColor3 = Color3.fromRGB(131, 0, 3);
    CornerFixer.Size = UDim2.new(1, 0, 0, 15);
    CornerFixer.BorderColor3 = Color3.fromRGB(0, 0, 0);
    CornerFixer.Name = "CornerFixer";

    RakoofHealthLable.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    RakoofHealthLable.TextXAlignment = Enum.TextXAlignment.Left;
    RakoofHealthLable.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    RakoofHealthLable.TextSize = 20;
    RakoofHealthLable.TextColor3 = Color3.fromRGB(0, 0, 0);
    RakoofHealthLable.Size = UDim2.new(1, 0, 0.25, 0);
    RakoofHealthLable.Text = "Rakoof Health:";
    RakoofHealthLable.Name = "Label";
    RakoofHealthLable.BackgroundTransparency = 1;

    Padding1.PaddingLeft = UDim.new(0, 12);

    GameTimerLable.TextWrapped = true;
    GameTimerLable.BorderSizePixel = 0;
    GameTimerLable.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    GameTimerLable.TextXAlignment = Enum.TextXAlignment.Left;
    GameTimerLable.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    GameTimerLable.TextSize = 20;
    GameTimerLable.TextColor3 = Color3.fromRGB(0, 0, 0);
    GameTimerLable.Size = UDim2.new(1, 0, 0.25, 0);
    GameTimerLable.BorderColor3 = Color3.fromRGB(0, 0, 0);
    GameTimerLable.Text = "Game Time:";
    GameTimerLable.Name = "Label";
    GameTimerLable.BackgroundTransparency = 1;

    Padding2.PaddingLeft = UDim.new(0, 12);

    PowerTimerLable.TextWrapped = true;
    PowerTimerLable.BorderSizePixel = 0;
    PowerTimerLable.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    PowerTimerLable.TextXAlignment = Enum.TextXAlignment.Left;
    PowerTimerLable.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    PowerTimerLable.TextSize = 20;
    PowerTimerLable.TextColor3 = Color3.fromRGB(0, 0, 0);
    PowerTimerLable.Size = UDim2.new(1, 0, 0.25, 0);
    PowerTimerLable.BorderColor3 = Color3.fromRGB(0, 0, 0);
    PowerTimerLable.Text = "Power Time:";
    PowerTimerLable.Name = "Label";
    PowerTimerLable.BackgroundTransparency = 1;

    Padding3.PaddingLeft = UDim.new(0, 12);

    while task.wait() do
        GameTimerLable.Text = "Game Time:  ".. game:GetService("ReplicatedStorage").Values.GameTimer.Value
        PowerTimerLable.Text = "Power Time: ".. game:GetService("ReplicatedStorage").Values.PowerTimer.Value
        pcall(function()
            RakoofHealthLable.Text = "Rakoof Health: ".. game.Workspace.RakoofNPC.NPC.Health
        end)
    end
end)

-- Combat

-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Bemplia/te/main/script.lua"))()

-- Movement
MovementSection:NewButton("Inf stamina", "", function()
    local stam = game.Players.LocalPlayer.Character.CharValues.StaminaPercentValue
    local run = game.Players.LocalPlayer.Character.CharValues.CantRun
    local craw = game.Players.LocalPlayer.Character.CharValues.Crawling
    local rake = game.Players.LocalPlayer.Character.CharValues.NearRake
    local health = game.Players.LocalPlayer.Character.CharValues.HumanoidLowHealth
    local stamh;
    stamh = hookmetamethod(game, "__index", function(self, v)
        if self == stam and v == "Value" then
            return 100
        elseif self == run and v == "Value" then
            return false
        elseif self == craw and v == "Value" then
            return false
        elseif self == rake and v == "Value" then
            return false
        elseif self == health and v == "Value" then
            return false
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

-- Teleport

TeleportSection:NewButton("Teleport to Shop", "", function()
    local tween = tweenservice:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(6), {CFrame = CFrame.new(-277.085724, 5.19999886, -383.390472, 0.0596817881, -2.56916355e-09, -0.998217463, -2.71031708e-09, 1, -2.73579692e-09, 0.998217463, 2.868763e-09, 0.0596817881)})
    tween:Play()
end)

TeleportSection:NewButton("Teleport to PowerStation", "", function()
    local tween = tweenservice:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(6), {CFrame = CFrame.new(375.112946, 9.31250763, 259.84726, -0.0547578856, 5.71634473e-08, -0.998499632, -9.16319891e-08, 1, 6.22744523e-08, 0.998499632, 9.49045216e-08, -0.0547578856)})
    tween:Play()
end)

TeleportSection:NewButton("Teleport to Rakoof", "", function()
    local tween = tweenservice:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(6), {CFrame = workspace.RakoofNPC.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)})
    tween:Play()
end)

TeleportSection:NewButton("Teleport to SurvivorSafeHouse", "", function()
    local tween = tweenservice:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(6), {CFrame = CFrame.new(349.972809, 24.7999954, -328.633118, 0.00361409876, -8.98743213e-09, -0.999993443, 7.24482963e-09, 1, -8.96130725e-09, 0.999993443, -7.21239557e-09, 0.00361409876)})
    tween:Play()
end)

TeleportSection:NewButton("Teleport to ParkSafeHouse", "", function()
    local tween = tweenservice:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(6), {CFrame = CFrame.new(33.3288879, 14.9999981, -337.05542, 0.999986291, -4.47726691e-08, -0.00523636583, 4.46095605e-08, 1, -3.12661221e-08, 0.00523636583, 3.10321013e-08, 0.999986291)})
    tween:Play()
end)

TeleportSection:NewButton("Teleport to DestroyShelter", "", function()
    local tween = tweenservice:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(6), {CFrame = CFrame.new(-93.672493, 22.9999962, 242.216293, -0.252246112, 2.93387115e-09, -0.967663109, 5.22881782e-09, 1, 1.66888892e-09, 0.967663109, -4.63876315e-09, -0.252246112)})
    tween:Play()
end)

TeleportSection:NewButton("Teleport to safe", "", function()
    local tween = tweenservice:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(6), {CFrame = CFrame.new(476.334473, -15.1925945, -147.251419, -0.0390623249, -1.83383328e-17, 0.999236763, 1.00960762e-07, 1, 3.94677446e-09, -0.999236763, 1.0103787e-07, -0.0390623249)})
    tween:Play()
end)

TeleportSection:NewTextBox("Teleport to player", "", function(pl)
    local tween = tweenservice:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(6), {CFrame = game.Players[pl].Character.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)})
    tween:Play()
end)

TeleportSection:NewDropdown("Teleport to duck", "", {"Rainbow Jose Duck", "Robux Jose Duck", "Sad Jose Duck", "Slenderman Jose Duck", "Top Hat Jose Duck", "[Content Deleted] Jose Duck", "Burger Jose Duck", "Cheese Jose Duck", "O J S E Duck"}, function(duck)
    local tween = tweenservice:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(6), {CFrame = workspace.Filter.StuffGiversFolder.DuckParts[duck].CFrame + Vector3.new(0, 10, 0)})
    tween:Play()
end)

-- Esp
EspSection:NewButton("Rakoof esp", "", function()
    while task.wait(0.5) do
        pcall (function()
            if game.Workspace.RakoofNPC:FindFirstChild("BillboardGui") == nil then
                local BillboardGui = Instance.new("BillboardGui")
                local TextLabel = Instance.new("TextLabel")
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
                esp.Adornee = game.Workspace.RakoofNPC
                esp.ZIndex = 0
                esp.AlwaysOnTop = true
                esp.Color3 = Color3.fromRGB(225, 255, 0)
                esp.Transparency = 0.5
                esp.Size = Vector3.new(5,6,1,5)
            end
        end)
    end
end)

EspSection:NewButton("Players esp", "", function()
    while task.wait(0.5) do
        for i,v in pairs(game.Players:GetChildren()) do
            if v ~= game.Players.LocalPlayer then
                if v.Character:FindFirstChild("Torso") and v.Character.Torso:FindFirstChild("BoxHandleAdornment") == nil then 
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
    while task.wait(0.2) do
        for i,v in pairs(game.Workspace.Filter.StuffGiversFolder.DuckParts:GetChildren()) do
            if v:FindFirstChild("BillboardGui") == nil then
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
            elseif game.Players.LocalPlayer:FindFirstChild("DucksFounded") then
                for x,z in pairs(game.Players.LocalPlayer.DucksFounded:GetChildren()) do
                    if v.Name == z.Name then
                        v.BoxHandleAdornment.Color3 = Color3.fromRGB(191,48,48)
                        v.BillboardGui.TextLabel.TextColor3 = Color3.fromRGB(191,48,48)
                    end
                end
            end
        end
    end
end)

EspSection:NewButton("Pan esp", "", function()
    while task.wait(0.5) do
        for i,v in pairs(game.Workspace.Filter.StuffGiversFolder.PanGiverSpawns:GetChildren()) do
            if v.Name ~= "GiverTool" and v.Transparency == 0 and v:FindFirstChild("BillboardGui") == nil then
                local BillboardGui = Instance.new("BillboardGui", v)
                local TextLabel = Instance.new("TextLabel", BillboardGui)
                local esp = Instance.new("BoxHandleAdornment", v)
                esp.Adornee = v
                esp.ZIndex = 0
                esp.AlwaysOnTop = true
                esp.Transparency = 0.7
                esp.Size = Vector3.new(0.2, 1.9, 1.3)
                BillboardGui.AlwaysOnTop = true
                BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Size = UDim2.new(0, 200, 0, 50)
                TextLabel.Text = "Pan"
                TextLabel.TextStrokeTransparency = 0
                TextLabel.TextSize = 6
                TextLabel.TextColor3 = Color3.fromRGB(10,100,164)
            elseif v:FindFirstChild("BillboardGui") and v.Transparency == 1 then
                v.BillboardGui:Destroy()
            end
        end
    end
end)

EspSection:NewButton("Scrap Metals", "", function()
    while task.wait(0.5) do
        for i,v in pairs(game.Workspace.Filter.StuffGiversFolder.ScrapMetals:GetChildren()) do
            if v.TriggerPart:FindFirstChild("BillboardGui") == nil then
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
                esp.Color3 = Color3.fromRGB(255,118,64)
                TextLabel.TextColor3 = Color3.fromRGB(255,118,64)
            end
        end
    end
end)

EspSection:NewButton("Supplydrop esp", "", function()
    while task.wait(0.5) do
        for i,v in pairs(game.workspace.Filter:GetChildren()) do
            if v.Name == "Supply" and v:FindFirstChild("BillboardGui") == nil then
                local esp = Instance.new("BoxHandleAdornment", v)
                local BillboardGui = Instance.new("BillboardGui", v)
                local TextLabel = Instance.new("TextLabel", BillboardGui)
                esp.Adornee = v
                esp.ZIndex = 0
                esp.AlwaysOnTop = true
                esp.Transparency = 0.7
                esp.Size = Vector3.new(3.2,3.2,3.2)
                BillboardGui.AlwaysOnTop = true
                BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Size = UDim2.new(0, 200, 0, 50)
                TextLabel.Text = v.Name
                TextLabel.TextStrokeTransparency = 0
                TextLabel.TextSize = 6
                esp.Color3 = Color3.fromRGB(234,58,141)
                TextLabel.TextColor3 = Color3.fromRGB(234,58,141)
            end
        end
    end
end)

EspSection:NewButton("Flare esp", "", function()
    while task.wait(0.5) do
        for i,v in pairs(game.Workspace.Filter.StuffGiversFolder.FlareSpawns:GetChildren()) do
            if v.name == "Flare" and v.Handle.Transparency == 0 and v.Handle:FindFirstChild("BillboardGui") == nil then
                local esp = Instance.new("BoxHandleAdornment", v.Handle)
                local BillboardGui = Instance.new("BillboardGui", v.Handle)
                local TextLabel = Instance.new("TextLabel", BillboardGui)
                esp.Adornee = v.Handle
                esp.ZIndex = 0
                esp.AlwaysOnTop = true
                esp.Transparency = 0.7
                esp.Size = Vector3.new(0.5,0.5,0.5)
                BillboardGui.AlwaysOnTop = true
                BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Size = UDim2.new(0, 200, 0, 50)
                TextLabel.Text = "Flare"
                TextLabel.TextStrokeTransparency = 0
                TextLabel.TextSize = 6
                esp.Color3 = Color3.fromRGB(1,147,154)
                TextLabel.TextColor3 = Color3.fromRGB(1,147,154)
            elseif v.Name == "Flare" and v.Handle.Transparency == 1 and v.Handle:FindFirstChild("BillboardGui") then
                v.Handle.BoxHandleAdornment:Destroy()
                v.Handle.BillboardGui:Destroy()
            end
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

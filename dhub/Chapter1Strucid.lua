-- Dont say you paid for dark hub premium, because its shit

local Config = {
    Visuals = {
        BoxEsp = false,
        CornerBoxEsp = false,
        TracerEsp = false,
        TracersOrigin = "Top", -- "Top", "Middle", "Bottom", or "Mouse"
        NameEsp = false,
        DistanceEsp = false,
        SkeletonEsp = false,
        EnemyColor = Color3.fromRGB(190, 190, 0),
        TeamColor = Color3.fromRGB(0, 190, 0),
        TeamCheck = true -- Auto changes if gamemode is ffa
    },
    Aimbot = {
        Aimbot = false,
        TriggerBot = false,
        Smoothness = 0.25,
        AimBone = "Head",
        RandomAimBone = true,
        MouseTwoDown = false, -- Dont Touch
        Silent = false,
        VisCheck = false,
        DrawFOV = false,
        FOV = 200,
        SnapLines = false
    },
    GunMods = {
        Recoil = false,
        Spread = false,
        FireRate = false,
        InfAmmo = false,
        InfRange = false,
        Wallbang = false
    },
    LocalPlayer = {
        Nofatigue = false,
        PROFOV = false,
        NoFD = false,
        Godmode = false
    }
}

local Services =
    setmetatable(
    {
        LocalPlayer = game:GetService("Players").LocalPlayer,
        Camera = workspace.CurrentCamera
    },
    {
        __index = function(self, idx)
            return rawget(self, idx) or game:GetService(idx)
        end
    }
)

local Funcs = {}

function Funcs:IsAlive(player)
    if
        player and player.Character and player.Character:FindFirstChild("Head") and
            workspace:FindFirstChild(player.Character.Name) and
            player ~= Services.LocalPlayer
     then
        return true
    end
end

function Funcs:Round(number)
    return math.floor(tonumber(number) + 0.5)
end

function Funcs:DrawSquare()
    local Box = Drawing.new("Square")
    Box.Color = Color3.fromRGB(190, 190, 0)
    Box.Thickness = 0.5
    Box.Filled = false
    Box.Transparency = 1
    return Box
end

function Funcs:DrawQuad() -- Unused
    local quad = Drawing.new("Quad")
    quad.Color = Color3.fromRGB(190, 190, 0)
    quad.Thickness = 0.5
    quad.Filled = false
    quad.Transparency = 1
    return quad
end

function Funcs:DrawLine()
    local line = Drawing.new("Line")
    line.Color = Color3.new(190, 190, 0)
    line.Thickness = 0.5
    return line
end

function Funcs:DrawText()
    local text = Drawing.new("Text")
    text.Color = Color3.fromRGB(190, 190, 0)
    text.Size = 20
    text.Outline = true
    text.Center = true
    return text
end
local Numbers = {5, 6, 9, 23, 18, 19, 11, 23, 17, 20, 21, 39} -- All the possible anticheat remotes
local OldNamecall
OldNamecall =
    hookmetamethod(
    game,
    "__namecall",
    function(self, ...)
        local args = {...}
        local method = getnamecallmethod()

        if tostring(self) == "RemoteEvent" and getnamecallmethod() == "FireServer" then
            if args[1] == 1 and args[2] == Numbers[table.find(Numbers, args[2])] then
                return
            end
        end

        return OldNamecall(self, ...)
    end
)
function ThankYou(a)
    game:GetService("Players").LocalPlayer.PlayerGui.MenuGUI.ThankYou.TextLabel.Text = a
    game:GetService("Players").LocalPlayer.PlayerGui.MenuGUI.ThankYou.Visible = true
end
local start = os.clock()
wait(1)
local Mouse = Services.LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")
local target = false
local mt = getrawmetatable(game)
local oldIndex = mt.__index
local oldNamecall = mt.__namecall
local newClose = newcclosure or function(f)
        return f
    end
if setreadonly then
    setreadonly(mt, false)
else
    make_writeable(mt, true)
end
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/DarkHUB/main/Lib"))()
main = lib:Window()
Aimbot = main:Tab("Aimbot")
LPTab = main:Tab("LocalPlayer")
Esp = main:Tab("Visuals")
GunMods = main:Tab("Gun Mods")

Aimbot:Toggle(
    "Aimbot",
    function(state)
        Config.Aimbot.Aimbot = state
    end
)

LPTab:Toggle(
    "Godmode",
    function(state)
        Config.LocalPlayer.Godmode = state
    end
)

LPTab:Toggle(
    "No Fall Damage",
    function(state)
        Config.LocalPlayer.NoFD = state
    end
)
LPTab:Toggle(
    "No Fatigue",
    function(state)
        Config.LocalPlayer.Nofatigue = state
    end
)
if syn then
    LPTab:Toggle(
        "Pro FOV",
        function(state)
            Config.LocalPlayer.PROFOV = state
        end
    )
end
LPTab:Label("Capture The Flag Gamemode: ")
LPTab:Button(
    "Capture Blue Flag",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            720.119934,
            14.0500002,
            -141.047821,
            -0.182928354,
            0.149346098,
            -0.971716464,
            9.39479447e-17,
            0.988394439,
            0.151909381,
            0.983126223,
            0.0277885329,
            -0.18080537
        )
        wait(.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            144.149765,
            13.8993807,
            109.046661,
            -0.564625502,
            -0.0990719274,
            0.819379568,
            0,
            0.99276948,
            0.120036662,
            -0.825347245,
            0.0677757636,
            -0.560542941
        )
    end
)
LPTab:Button(
    "Capture Red Flag",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            144.149765,
            13.8993807,
            109.046661,
            -0.564625502,
            -0.0990719274,
            0.819379568,
            0,
            0.99276948,
            0.120036662,
            -0.825347245,
            0.0677757636,
            -0.560542941
        )
        wait(.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            720.119934,
            14.0500002,
            -141.047821,
            -0.182928354,
            0.149346098,
            -0.971716464,
            9.39479447e-17,
            0.988394439,
            0.151909381,
            0.983126223,
            0.0277885329,
            -0.18080537
        )
    end
)

local RunService = game:GetService("RunService")
RunService.Heartbeat:Connect(
    function()
        if Config.LocalPlayer.Nofatigue == true then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        end
        if Config.LocalPlayer.PROFOV == true then
            game.workspace.CurrentCamera.FieldOfView = 110
        else
            game.workspace.CurrentCamera.FieldOfView = 70
        end
        if Config.LocalPlayer.Godmode then
            if game.Players.LocalPlayer.Character:FindFirstChild("Shield") then
                game.Players.LocalPlayer.Character.Shield:Destroy()
            end
        end
    end
)
OldFire = require(game:GetService("ReplicatedStorage").NetworkModule).FireServer
require(game:GetService("ReplicatedStorage").NetworkModule).FireServer = function(...)
    args = {...}
    if Config.LocalPlayer.NoFD == true and tostring(args[2]) == "FallDamage" then
        return
    end
    return OldFire(...)
end

Aimbot:Toggle(
    "Silent Aim",
    function(state)
        Config.Aimbot.Silent = state
    end
)

Aimbot:Toggle(
    "Trigger Bot",
    function(state)
        Config.Aimbot.TriggerBot = state
    end
)

Aimbot:Dropdown(
    "Aim Bone",
    {"Random", "Head (Bannable!)", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"},
    function(selected)
        if selected == "Random" then
            Config.Aimbot.RandomAimBone = true
        elseif selected == "Head (Bannable!)" then
            Config.Aimbot.AimBone = "Head"
            Config.Aimbot.RandomAimBone = false
        elseif selected == "Torso" then
            Config.Aimbot.AimBone = "UpperTorso"
            Config.Aimbot.RandomAimBone = false
        elseif selected == "Left Arm" then
            Config.Aimbot.AimBone = "LeftLowerArm"
            Config.Aimbot.RandomAimBone = false
        elseif selected == "Right Arm" then
            Config.Aimbot.AimBone = "RightLowerArm"
            Config.Aimbot.RandomAimBone = false
        elseif selected == "Left Leg" then
            Config.Aimbot.AimBone = "LeftLowerLeg"
            Config.Aimbot.RandomAimBone = false
        elseif selected == "Right Leg" then
            Config.Aimbot.AimBone = "RightLowerLeg"
            Config.Aimbot.RandomAimBone = false
        end
    end
)

Aimbot:Toggle(
    "Draw FOV",
    function(state)
        Config.Aimbot.DrawFOV = state
    end
)

Aimbot:Slider(
    "Smoothness",
    0,
    10,
    function(number)
        Config.Aimbot.Smoothness = number / 10
    end
)

Aimbot:Slider(
    "FOV",
    0,
    1000,
    function(number)
        Config.Aimbot.FOV = number
    end
)

Esp:Toggle(
    "Boxes",
    function(state)
        Config.Visuals.BoxEsp = state
    end
)

Esp:Toggle(
    "Corner Boxes",
    function(state)
        Config.Visuals.CornerBoxEsp = state
    end
)

Esp:Toggle(
    "Skeleton",
    function(state)
        Config.Visuals.SkeletonEsp = state
    end
)

Esp:Toggle(
    "Tracers",
    function(state)
        Config.Visuals.TracerEsp = state
    end
)

Esp:Dropdown(
    "Tracers Origin",
    {"Top", "Middle", "Bottom", "Mouse"},
    function(selected)
        Config.Visuals.TracersOrigin = selected
    end
)

Esp:Colorpicker(
    "Team Esp Color",
    Color3.fromRGB(0, 190, 0),
    function(color)
        Config.Visuals.TeamColor = color
    end
)

Esp:Colorpicker(
    "Enemy Esp Color",
    Color3.fromRGB(190, 190, 0),
    function(color)
        Config.Visuals.EnemyColor = color
    end
)

GunMods:Toggle(
    "No Recoil",
    function(state)
        Config.GunMods.Recoil = state
        Funcs:UpdateGuns()
    end
)

GunMods:Toggle(
    "No Spread",
    function(state)
        Config.GunMods.Spread = state
    end
)

GunMods:Toggle(
    "FireRate",
    function(state)
        Config.GunMods.FireRate = state
        Funcs:UpdateGuns()
    end
)

GunMods:Toggle(
    "Infinite Ammo",
    function(state)
        Config.GunMods.InfAmmo = state
    end
)

GunMods:Toggle(
    "Infinite Range ( Buggy )",
    function(state)
        Config.GunMods.InfRange = state
    end
)

GunMods:Toggle(
    "Wallbang",
    function(state)
        Config.GunMods.Wallbang = state
    end
)

-- Aimbot
function Funcs:GetTarget()
    local nearestmagnitude = math.huge
    local nearestenemy = nil
    local vector = nil
    for i, v in next, Services.Players:GetChildren() do
        if Config.Visuals.TeamCheck then
            if v.Team ~= Services.LocalPlayer.Team and Funcs:IsAlive(v) then
                if
                    v.Character and v.Character:FindFirstChild("HumanoidRootPart") and
                        v.Character:FindFirstChild("Humanoid") and
                        v.Character.Humanoid.Health > 0
                 then
                    local vector, onScreen =
                        Services.Camera:WorldToScreenPoint(v.Character["HumanoidRootPart"].Position)
                    if onScreen then
                        local ray =
                            Ray.new(
                            Services.Camera.CFrame.p,
                            (v.Character["UpperTorso"].Position - Services.Camera.CFrame.p).unit * 500
                        )
                        local ignore = {
                            Services.LocalPlayer.Character
                        }
                        local magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
                        if magnitude < nearestmagnitude and magnitude <= Config.Aimbot["FOV"] then
                            nearestenemy = v
                            nearestmagnitude = magnitude
                        end
                    end
                end
            end
        else
            if
                v.Character and v.Character:FindFirstChild("HumanoidRootPart") and
                    v.Character:FindFirstChild("Humanoid") and
                    v.Character.Humanoid.Health > 0 and
                    Funcs:IsAlive(v)
             then
                local vector, onScreen = Services.Camera:WorldToScreenPoint(v.Character["HumanoidRootPart"].Position)
                if onScreen then
                    local ray =
                        Ray.new(
                        Services.Camera.CFrame.p,
                        (v.Character["UpperTorso"].Position - Services.Camera.CFrame.p).unit * 500
                    )
                    local ignore = {
                        Services.LocalPlayer.Character
                    }
                    local magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
                    if magnitude < nearestmagnitude and magnitude <= Config.Aimbot["FOV"] then
                        nearestenemy = v
                        nearestmagnitude = magnitude
                    end
                end
            end
        end
    end
    return nearestenemy
end

spawn(
    function()
        while wait() do
            pcall(
                function()
                    TargetPlayer = Funcs:GetTarget()
                    if TargetPlayer and Config.Aimbot.MouseTwoDown and Config.Aimbot.Aimbot then
                        local niggasbone =
                            game:GetService("Workspace").CurrentCamera:WorldToScreenPoint(
                            TargetPlayer.Character[Config.Aimbot.AimBone].Position
                        )
                        local moveto =
                            Vector2.new(
                            (niggasbone.X - Mouse.X) * Config.Aimbot.Smoothness,
                            (niggasbone.Y - Mouse.Y) * Config.Aimbot.Smoothness
                        )
                        mousemoverel(moveto.X, moveto.Y)
                    end
                    if Config.Aimbot.TriggerBot == true then
                        local Target = Mouse.Target
                        if Target then
                            local TargetPlayer = LocalPlayer.Parent:FindFirstChild(Target.Parent.Name)
                            if
                                Target.Parent and TargetPlayer ~= nil and TargetPlayer.Team ~= LocalPlayer.Team and
                                    LocalPlayer.Character.Head
                             then
                                mouse1press()
                                wait()
                                mouse1release()
                            end
                        end
                    end
                    Services.RunService.Heartbeat:wait()
                end
            )
        end
    end
)

Mouse.Button2Down:Connect(
    function()
        Config.Aimbot.MouseTwoDown = true
    end
)

Mouse.Button2Up:Connect(
    function()
        Config.Aimbot.MouseTwoDown = false
    end
)

function Funcs:AddEsp(player)
    local Box = Funcs:DrawSquare()
    local Tracer = Funcs:DrawLine()
    local Name = Funcs:DrawText()
    local Distance = Funcs:DrawText()
    local SnapLines = Funcs:DrawLine()
    local HeadLowerTorso = Funcs:DrawLine()
    local NeckLeftUpper = Funcs:DrawLine()
    local LeftUpperLeftLower = Funcs:DrawLine()
    local NeckRightUpper = Funcs:DrawLine()
    local RightUpperLeftLower = Funcs:DrawLine()
    local LowerTorsoLeftUpper = Funcs:DrawLine()
    local LeftLowerLeftUpper = Funcs:DrawLine()
    local LowerTorsoRightUpper = Funcs:DrawLine()
    local RightLowerRightUpper = Funcs:DrawLine()
    local bottomrightone = Funcs:DrawLine()
    local bottomleftone = Funcs:DrawLine()
    local toprightone = Funcs:DrawLine()
    local topleftone = Funcs:DrawLine()
    local toplefttwo = Funcs:DrawLine()
    local bottomlefttwo = Funcs:DrawLine()
    local toprighttwo = Funcs:DrawLine()
    local bottomrighttwo = Funcs:DrawLine()
    Services.RunService.Stepped:Connect(
        function()
            if Config.Visuals.TeamCheck and player.Team == Services.LocalPlayer.Team then
                Box.Color = Config.Visuals.TeamColor
                Tracer.Color = Config.Visuals.TeamColor
                HeadLowerTorso.Color = Config.Visuals.TeamColor
                NeckLeftUpper.Color = Config.Visuals.TeamColor
                LeftUpperLeftLower.Color = Config.Visuals.TeamColor
                NeckRightUpper.Color = Config.Visuals.TeamColor
                RightUpperLeftLower.Color = Config.Visuals.TeamColor
                LowerTorsoLeftUpper.Color = Config.Visuals.TeamColor
                LeftLowerLeftUpper.Color = Config.Visuals.TeamColor
                LowerTorsoRightUpper.Color = Config.Visuals.TeamColor
                RightLowerRightUpper.Color = Config.Visuals.TeamColor
                bottomrightone.Color = Config.Visuals.TeamColor
                bottomleftone.Color = Config.Visuals.TeamColor
                toprightone.Color = Config.Visuals.TeamColor
                topleftone.Color = Config.Visuals.TeamColor
                toplefttwo.Color = Config.Visuals.TeamColor
                bottomlefttwo.Color = Config.Visuals.TeamColor
                toprighttwo.Color = Config.Visuals.TeamColor
                bottomrighttwo.Color = Config.Visuals.TeamColor
            else
                Box.Color = Config.Visuals.EnemyColor
                Tracer.Color = Config.Visuals.EnemyColor
                HeadLowerTorso.Color = Config.Visuals.EnemyColor
                NeckLeftUpper.Color = Config.Visuals.EnemyColor
                LeftUpperLeftLower.Color = Config.Visuals.EnemyColor
                NeckRightUpper.Color = Config.Visuals.EnemyColor
                RightUpperLeftLower.Color = Config.Visuals.EnemyColor
                LowerTorsoLeftUpper.Color = Config.Visuals.EnemyColor
                LeftLowerLeftUpper.Color = Config.Visuals.EnemyColor
                LowerTorsoRightUpper.Color = Config.Visuals.EnemyColor
                RightLowerRightUpper.Color = Config.Visuals.EnemyColor
                bottomrightone.Color = Config.Visuals.EnemyColor
                bottomleftone.Color = Config.Visuals.EnemyColor
                toprightone.Color = Config.Visuals.EnemyColor
                topleftone.Color = Config.Visuals.EnemyColor
                toplefttwo.Color = Config.Visuals.EnemyColor
                bottomlefttwo.Color = Config.Visuals.EnemyColor
                toprighttwo.Color = Config.Visuals.EnemyColor
                bottomrighttwo.Color = Config.Visuals.EnemyColor
            end
            if Funcs:IsAlive(player) and player.Character:FindFirstChild("HumanoidRootPart") then
                local RootPosition, OnScreen =
                    Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
                local HeadPosition =
                    Services.Camera:WorldToViewportPoint(player.Character.Head.Position + Vector3.new(0, 0, 0)) -- can creat an offset if u want
                local LegPosition =
                    Services.Camera:WorldToViewportPoint(
                    player.Character.HumanoidRootPart.Position - Vector3.new(0, 5, 0)
                )
                local length = RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)
                local lengthx = RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2)
                local size = HeadPosition.Y - LegPosition.Y
                if Config.Visuals.BoxEsp then
                    Box.Visible = OnScreen
                    Box.Size = Vector2.new(HeadPosition.Y - LegPosition.Y, HeadPosition.Y - LegPosition.Y)
                    Box.Position =
                        Vector2.new(
                        RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2),
                        RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)
                    )
                else
                    Box.Visible = false
                end
                if Config.Visuals.CornerBoxEsp and Funcs:IsAlive(player) then
                    bottomrightone.Visible = OnScreen
                    bottomrightone.From = Vector2.new(RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2), length)
                    bottomrightone.To =
                        Vector2.new(RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2) + (size / 3), length)
                    bottomleftone.Visible = OnScreen
                    bottomleftone.From =
                        Vector2.new((RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2)) + size, length)
                    bottomleftone.To =
                        Vector2.new(RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2) + ((size / 3) * 2), length)
                    toprightone.Visible = OnScreen
                    toprightone.From =
                        Vector2.new(RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2), length + size)
                    toprightone.To =
                        Vector2.new(RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2) + (size / 3), length + size)
                    topleftone.Visible = OnScreen
                    topleftone.From =
                        Vector2.new((RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2)) + size, length + size)
                    topleftone.To =
                        Vector2.new(
                        RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2) + ((size / 3) * 2),
                        length + size
                    )
                    toplefttwo.Visible = OnScreen
                    toplefttwo.From =
                        Vector2.new(lengthx, (RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)) + size)
                    toplefttwo.To =
                        Vector2.new(
                        lengthx,
                        (RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)) + ((size / 3) * 2)
                    )
                    bottomlefttwo.Visible = OnScreen
                    bottomlefttwo.From = Vector2.new(lengthx, (RootPosition.Y - (HeadPosition.Y - LegPosition.Y) / 2))
                    bottomlefttwo.To =
                        Vector2.new(lengthx, (RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)) + (size / 3))
                    toprighttwo.Visible = OnScreen
                    toprighttwo.From =
                        Vector2.new(lengthx + size, (RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)) + size)
                    toprighttwo.To =
                        Vector2.new(
                        lengthx + size,
                        (RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)) + ((size / 3) * 2)
                    )
                    bottomrighttwo.Visible = OnScreen
                    bottomrighttwo.From =
                        Vector2.new(lengthx + size, (RootPosition.Y - (HeadPosition.Y - LegPosition.Y) / 2))
                    bottomrighttwo.To =
                        Vector2.new(
                        lengthx + size,
                        (RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)) + (size / 3)
                    )
                else
                    bottomrightone.Visible = false
                    bottomleftone.Visible = false
                    toprightone.Visible = false
                    topleftone.Visible = false
                    toplefttwo.Visible = false
                    bottomlefttwo.Visible = false
                    toprighttwo.Visible = false
                    bottomrighttwo.Visible = false
                end
                if Config.Visuals.TracerEsp then
                    Tracer.Visible = OnScreen
                    if Config.Visuals.TracersOrigin == "Top" then
                        Tracer.To = Vector2.new(Services.Camera.ViewportSize.X / 2, 0)
                        Tracer.From =
                            Vector2.new(
                            Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position).X - 1,
                            RootPosition.Y + (HeadPosition.Y - LegPosition.Y) / 2
                        )
                    elseif Config.Visuals.TracersOrigin == "Middle" then
                        Tracer.To = Vector2.new(Services.Camera.ViewportSize.X / 2, Services.Camera.ViewportSize.Y / 2)
                        Tracer.From =
                            Vector2.new(
                            Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position).X - 1,
                            (RootPosition.Y + (HeadPosition.Y - LegPosition.Y) / 2) -
                                ((HeadPosition.Y - LegPosition.Y) / 2)
                        )
                    elseif Config.Visuals.TracersOrigin == "Bottom" then
                        Tracer.To = Vector2.new(Services.Camera.ViewportSize.X / 2, 1000)
                        Tracer.From =
                            Vector2.new(
                            Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position).X - 1,
                            RootPosition.Y - (HeadPosition.Y - LegPosition.Y) / 2
                        )
                    elseif Config.Visuals.TracersOrigin == "Mouse" then
                        Tracer.To = game:GetService("UserInputService"):GetMouseLocation()
                        Tracer.From =
                            Vector2.new(
                            Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position).X - 1,
                            (RootPosition.Y + (HeadPosition.Y - LegPosition.Y) / 2) -
                                ((HeadPosition.Y - LegPosition.Y) / 2)
                        )
                    end
                else
                    Tracer.Visible = false
                end
                if Config.Visuals.SkeletonEsp then
                    HeadLowerTorso.Visible = OnScreen
                    HeadLowerTorso.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y
                    )
                    HeadLowerTorso.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).Y
                    )
                    NeckLeftUpper.Visible = OnScreen
                    NeckLeftUpper.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y +
                            ((Services.Camera:WorldToViewportPoint(player.Character.UpperTorso.Position).Y -
                                Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y) /
                                3)
                    )
                    NeckLeftUpper.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position).Y
                    )
                    LeftUpperLeftLower.Visible = OnScreen
                    LeftUpperLeftLower.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LeftLowerArm.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LeftLowerArm.Position).Y
                    )
                    LeftUpperLeftLower.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position).Y
                    )
                    NeckRightUpper.Visible = OnScreen
                    NeckRightUpper.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y +
                            ((Services.Camera:WorldToViewportPoint(player.Character.UpperTorso.Position).Y -
                                Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y) /
                                3)
                    )
                    NeckRightUpper.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position).Y
                    )
                    RightUpperLeftLower.Visible = OnScreen
                    RightUpperLeftLower.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.RightLowerArm.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.RightLowerArm.Position).Y
                    )
                    RightUpperLeftLower.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position).Y
                    )
                    LowerTorsoLeftUpper.Visible = OnScreen
                    LowerTorsoLeftUpper.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).Y
                    )
                    LowerTorsoLeftUpper.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position).Y
                    )
                    LeftLowerLeftUpper.Visible = OnScreen
                    LeftLowerLeftUpper.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LeftLowerLeg.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LeftLowerLeg.Position).Y
                    )
                    LeftLowerLeftUpper.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position).Y
                    )
                    LowerTorsoRightUpper.Visible = OnScreen
                    LowerTorsoRightUpper.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.RightLowerLeg.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.RightLowerLeg.Position).Y
                    )
                    LowerTorsoRightUpper.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position).Y
                    )
                    RightLowerRightUpper.Visible = OnScreen
                    RightLowerRightUpper.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).Y
                    )
                    RightLowerRightUpper.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position).Y
                    )
                else
                    HeadLowerTorso.Visible = false
                    NeckLeftUpper.Visible = false
                    LeftUpperLeftLower.Visible = false
                    NeckRightUpper.Visible = false
                    RightUpperLeftLower.Visible = false
                    LowerTorsoLeftUpper.Visible = false
                    LeftLowerLeftUpper.Visible = false
                    LowerTorsoRightUpper.Visible = false
                    RightLowerRightUpper.Visible = false
                end
            else
                Box.Visible = false
                Tracer.Visible = false
                HeadLowerTorso.Visible = false
                NeckLeftUpper.Visible = false
                LeftUpperLeftLower.Visible = false
                NeckRightUpper.Visible = false
                RightUpperLeftLower.Visible = false
                LowerTorsoLeftUpper.Visible = false
                LeftLowerLeftUpper.Visible = false
                LowerTorsoRightUpper.Visible = false
                RightLowerRightUpper.Visible = false
                bottomrightone.Visible = false
                bottomleftone.Visible = false
                toprightone.Visible = false
                topleftone.Visible = false
                toplefttwo.Visible = false
                bottomlefttwo.Visible = false
                toprighttwo.Visible = false
                bottomrighttwo.Visible = false
            end
        end
    )
end

for i, v in pairs(Services.Players:GetPlayers()) do
    if v ~= Services.LocalPlayer then
        Funcs:AddEsp(v)
    end
end

Services.Players.PlayerAdded:Connect(
    function(player)
        if v ~= Services.LocalPlayer then
            Funcs:AddEsp(player)
        end
    end
)

local HitParticle = require(game:GetService("ReplicatedStorage").GlobalStuff).HitParticle
local GetWSettings = require(game:GetService("ReplicatedStorage").GlobalStuff).GetWSettings
local WeaponModules = game:GetService("ReplicatedStorage").Weapons.Modules:Clone()

require(game:GetService("ReplicatedStorage").GlobalStuff).HitParticle = function(...)
    if Config.GunMods.Wallbang then
        return
    else
        return HitParticle(...)
    end
end

require(game:GetService("ReplicatedStorage").GlobalStuff).GetWSettings = function(Argument_1, Argument_2)
    if tostring(getfenv(2).script.Name) == "MainListener" then
        return GetWSettings(Argument_1, Argument_2)
    end
    return require(WeaponModules:FindFirstChild(Argument_2))
end

function Funcs:UpdateGuns()
    for a, b in pairs(WeaponModules:GetChildren()) do
        if b.Name ~= "Pickaxe" then
            if Config.GunMods.Recoil == true then
                require(b).Recoil = 0
            else
                require(b).Recoil = require(game:GetService("ReplicatedStorage").Weapons.Modules[b.Name]).Recoil
            end
        --   if Config.GunMods.FireRate == true then
        --     require(b).Debounce = 0
        --   else
        --     require(b).Debounce = require(game:GetService("ReplicatedStorage").Weapons.Modules[b.Name]).Debounce
        --   end
        end
    end
end

local hooked = false
local FOVCircle = Drawing.new("Circle")
FOVCircle.Color = Color3.fromRGB(190, 190, 0)
FOVCircle.Thickness = 0.5
FOVCircle.NumSides = 16
FOVCircle.Filled = false
FOVCircle.Transparency = 1

Services.RunService.Stepped:Connect(
    function()
        for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
            if v:FindFirstChild("ImageLabel") then
                game.Players.LocalPlayer:Kick(
                    "tell the darkhub people to fix their script (and dont worry you're not banned)"
                )
            end
        end
        FOVCircle.Position = game:GetService("UserInputService"):GetMouseLocation()
        FOVCircle.Radius = Config.Aimbot.FOV
        if Config.Aimbot.DrawFOV then
            FOVCircle.Visible = true
        else
            FOVCircle.Visible = false
        end
        if
            game.PlaceId == 10705886260 and
                Services.LocalPlayer.PlayerGui.MenuGUI.RoundInfoFrame.RoundType.Text == "FFA" or
                game.PlaceId == 10726543104
         then
            Config.Visuals.TeamCheck = false
        else
            Config.Visuals.TeamCheck = true
        end

        if Config.Aimbot.RandomAimBone then
            random = math.random(1, 3)
            if random == 1 then
                Config.Aimbot.AimBone = "Head"
            elseif random == 2 then
                Config.Aimbot.AimBone = "UpperTorso"
            elseif random == 3 then
                Config.Aimbot.AimBone = "LowerTorso"
            end
        end
        pcall(
            function()
                if Config.GunMods.Recoil == true then
                --getsenv(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.MainLocal).CameraRecoil = function() end
                end
                if Config.GunMods.FireRate == true then
                    getfenv(getsenv(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.MainLocal).Shoot).wait = function()
                        return game:GetService("RunService").Stepped:Wait()
                    end
                end

                if Config.GunMods.InfAmmo then
                    getsenv(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.MainLocal).UpdateAmmoLabel = function()
                        for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui:GetDescendants()) do
                            pcall(
                                function()
                                    if string.find(v.Text, " | ") then
                                        v.Text = "-1 | 0"
                                    end
                                end
                            )
                        end
                    end
                    A_1 = 4
                    A_2 = "Reload"
                    Event = game:GetService("ReplicatedStorage").Network.RemoteEvent
                    Event:FireServer(A_1, A_2)
                    local reload_stats = nil
                    for i, v in pairs(getsenv(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.MainLocal)) do
                        if i == "Reload" then
                            for k, x in pairs(debug.getupvalues(v)) do
                                if game.PlaceId ~= 10705886260 then
                                    if k == 6 then
                                        reload_stats = x
                                    end
                                else
                                    if k == 7 then
                                        reload_stats = x
                                    end
                                end
                            end
                        end
                    end
                    if reload_stats then
                        for i, v in pairs(reload_stats) do
                            if typeof(v) == "table" then
                                pcall(
                                    function()
                                        v[2] = math.huge
                                    end
                                )
                            end
                        end
                    end
                end
                if Config.GunMods.InfRange and hooked == false then
                    pcall(
                        function()
                            if
                                game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MainGui") and
                                    game:GetService("Players").LocalPlayer.PlayerGui.MainGui:FindFirstChild("MainLocal")
                             then
                                local RayCast =
                                    getsenv(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.MainLocal).RayCast
                                getsenv(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.MainLocal).RayCast = function(
                                    Argument_1,
                                    Argument_2,
                                    Argument_3,
                                    Argument_4,
                                    Argument_5,
                                    ...)
                                    hooked = true
                                    if Argument_1 ~= game:GetService("Players").LocalPlayer.Character.Head.Position then
                                        local RayHit, RayPosition =
                                            game:GetService("Workspace").FindPartOnRayWithIgnoreList(
                                            game:GetService("Workspace"),
                                            Ray.new(Argument_1, (Argument_2 - Argument_1).unit * 9007199300000000),
                                            Argument_3
                                        )
                                        return RayHit, RayPosition
                                    end
                                    return RayCast(Argument_1, Argument_2, Argument_3, Argument_4, Argument_5, ...)
                                end
                            else
                                hooked = false
                            end
                        end
                    )
                end
                if
                    Config.GunMods.Spread and Config.Aimbot.Silent == false or
                        Config.GunMods.Spread and Config.Aimbot.Silent and not Funcs:GetTarget()
                 then
                    require(game.ReplicatedStorage.GlobalStuff).ConeOfFire = function(...)
                        local args = {...}
                        local ret = (args[3] + Vector3.new(0.001, 0, 0.001))
                        return ret
                    end
                elseif
                    not Config.GunMods.Spread and Config.Aimbot.Silent and not Funcs:GetTarget() or
                        not Config.GunMods.Spread and Config.Aimbot.Silent == false
                 then
                    require(game:GetService("ReplicatedStorage").GlobalStuff).ConeOfFire = function(p83, p84, p85, p86)
                        local v60 = math.random(0, math.tan(math.rad(p86)) * (p85 - p84).magnitude * 100) / 100
                        local v61 = math.rad(math.random(0, 360))
                        return (CFrame.new(p85, p84) * CFrame.new(math.cos(v61) * v60, math.sin(v61) * v60, 0)).p
                    end
                end
                local ConeOfFire = require(game:GetService("ReplicatedStorage").GlobalStuff).ConeOfFire -- May be Introvert's if so, credits 2 introvert
                if Config.Aimbot.Silent then
                    local ConeOfFire = require(game:GetService("ReplicatedStorage").GlobalStuff).ConeOfFire
                    require(game:GetService("ReplicatedStorage").GlobalStuff).ConeOfFire = function(...)
                        if tostring(getfenv(2).script.Name) == "MainListener" then
                            return ConeOfFire(...)
                        end
                        if Funcs:GetTarget() ~= nil then
                            return Funcs:GetTarget().Character[Config.Aimbot.AimBone].Position
                        end
                        return ({...})[3]
                    end
                end
            end
        )
    end
)

ThankYou("Thanks for using DarkHUB V4 | Script took " .. math.floor(os.clock() - start) .. " seconds to load.")

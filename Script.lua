-- Создаем основу GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local FlyBtn = Instance.new("TextButton")
local NoclipBtn = Instance.new("TextButton")
local TPBtn = Instance.new("TextButton")

-- Настройка родителя (для Roblox)
ScreenGui.Parent = game:GetService("CoreGui")

-- Настройка главного окна
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
MainFrame.Size = UDim2.new(0, 200, 0, 180)
MainFrame.Active = true
MainFrame.Draggable = true -- Делаем окно перетаскиваемым

-- Заголовок
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "Universal Menu"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Функция создания кнопок (для экономии места)
local function setupButton(btn, text, pos, color)
    btn.Parent = MainFrame
    btn.Size = UDim2.new(0.8, 0, 0, 35)
    btn.Position = pos
    btn.Text = text
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.new(1, 1, 1)
end

setupButton(FlyBtn, "Fly", UDim2.new(0.1, 0, 0, 40), Color3.fromRGB(60, 120, 60))
setupButton(NoclipBtn, "Noclip", UDim2.new(0.1, 0, 0, 85), Color3.fromRGB(60, 60, 120))
setupButton(TPBtn, "Click TP", UDim2.new(0.1, 0, 0, 130), Color3.fromRGB(120, 60, 60))

-- ЛОГИКА ФУНКЦИЙ --

-- Fly (простой переключатель)
FlyBtn.MouseButton1Click:Connect(function()
    print("Fly активирован (нужен отдельный обработчик полета)")
end)

-- Noclip (проход сквозь стены)
NoclipBtn.MouseButton1Click:Connect(function()
    game:GetService("RunService").Stepped:Connect(function()
        if game.Players.LocalPlayer.Character then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end)
end)

-- Click TP (Телепорт по клику мыши)
TPBtn.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()
    mouse.Button1Down:Connect(function()
        if mouse.Target then
            player.Character:MoveTo(mouse.Hit.p)
        end
    end)
end)

-- Настройки
local BRAINROT_NAME = "Brainrot" -- Точное название предмета "Брейнрот"

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        
        -- Следим за добавлением предметов в персонажа (когда игрок берет предмет в руки)
        character.ChildAdded:Connect(function(child)
            if child:IsA("Tool") and child.Name == BRAINROT_NAME then
                
                print(player.Name .. " взял брейнрот! Активация защиты.")
                
                -- 1. Эффект Ragdoll (сбиваем с ног)
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.PlatformStand = true -- Отключаем управление телом
                end
                
                -- 2. Эффект Balloon (тянем вверх)
                -- Создаем силу, которая будет поднимать игрока
                local torso = character:FindFirstChild("HumanoidRootPart")
                if torso then
                    local bodyForce = Instance.new("BodyForce")
                    bodyForce.Name = "BalloonEffect"
                    -- Сила вверх (зависит от веса, 5000 обычно хватает для взлета)
                    bodyForce.Force = Vector3.new(0, 7000, 0) 
                    bodyForce.Parent = torso
                    
                    -- Удаляем силу через 5 секунд, чтобы игрок не улетел в космос навсегда
                    game.Debris:AddItem(bodyForce, 5)
                end
                
                -- (Опционально) Выкидываем предмет из рук
                child.Parent = workspace 
            end
        end)
    end)
end)

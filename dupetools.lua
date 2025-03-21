    local plr = game:GetService("Players").LocalPlayer
    local character = plr.Character
    local ogpos = character.HumanoidRootPart.Position

    for i = 1, amount do
        character:WaitForChild("HumanoidRootPart")
        
        for _, tool in ipairs(workspace:GetChildren()) do
            if tool:IsA("Tool") then
                tool.Parent = plr.Backpack
            end
        end
        
        for _, v in pairs(plr.Backpack:GetChildren()) do
            if v:IsA("Tool") then v.Parent = character end
        end
        for _, v in pairs(character:GetChildren()) do
            if v:IsA("Tool") then v.Parent = character end
        end
        
        character.HumanoidRootPart.CFrame = CFrame.new(0, 9999999999, 0)
        
        repeat wait() until not plr.Backpack:FindFirstChildOfClass("Tool")
        wait(0.75)
        
        for _, v in pairs(character:GetChildren()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
                v.Anchored = true
            end
        end
        
        for _, v in pairs(character:GetChildren()) do
            if v:IsA("Tool") then v.Parent = workspace end
        end
        
        character:BreakJoints()
        plr.CharacterAdded:Wait()
        character = plr.Character
    end
    character:WaitForChild('HumanoidRootPart')
    wait(0.15)
    character.HumanoidRootPart.CFrame = CFrame.new(ogpos)
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Tool") then
            character.Humanoid:EquipTool(v)
        end
    end

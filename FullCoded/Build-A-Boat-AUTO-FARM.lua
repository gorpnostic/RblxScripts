-- Teleportation Coordinates
local teleportPoints = {
    Vector3.new(36, 100, 1370),
    Vector3.new(36, 100, 1370),
    Vector3.new(36, 100, 1370),
    Vector3.new(36, 100, 2131),
    Vector3.new(36, 100, 2131),
    Vector3.new(36, 100, 2131),
    Vector3.new(36, 100, 2912),
    Vector3.new(36, 100, 2912),
    Vector3.new(36, 100, 2912),
    Vector3.new(36, 100, 3685),
    Vector3.new(36, 100, 3685),
    Vector3.new(36, 100, 3685),
    Vector3.new(36, 100, 4445),
    Vector3.new(36, 100, 4445),
    Vector3.new(36, 100, 4445),
    Vector3.new(36, 100, 5225),
    Vector3.new(36, 100, 5225),
    Vector3.new(36, 100, 5225),
    Vector3.new(36, 100, 5993),
    Vector3.new(36, 100, 5993),
    Vector3.new(36, 100, 5993),
    Vector3.new(36, 100, 6755),
    Vector3.new(36, 100, 6755),
    Vector3.new(36, 100, 6755),
    Vector3.new(36, 100, 7523),
    Vector3.new(36, 100, 7523),
    Vector3.new(36, 100, 7523),
    Vector3.new(36, 100, 8298),
    Vector3.new(36, 100, 8298),
    Vector3.new(36, 100, 8298),
    Vector3.new(-55, -270, 9499)
}

-- Function to teleport the player
local function teleportPlayer(character)
    for _, point in ipairs(teleportPoints) do
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(point)
        end
        wait(0.5)
    end
end

-- Restart teleportation if the player dies
local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        repeat
            wait(1) -- Wait for the character to respawn
        until game.Players.LocalPlayer.Character
        onCharacterAdded(game.Players.LocalPlayer.Character) -- Restart teleportation
    end)
    teleportPlayer(character)
end

-- Main Script
local player = game.Players.LocalPlayer
player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
    onCharacterAdded(player.Character)
end

-- Run TestEZ tests
local TestEZ = require(script.Parent.DevPackages.TestEZ);
TestEZ.TestBootstrap:run({script.Parent:FindFirstChild("UIPresets")});

-- Run live test modules
local TestModules = game.ReplicatedStorage:WaitForChild("TestModules");
for _,module: Instance in ipairs(TestModules:GetChildren()) do
    if not module:IsA("ModuleScript") then continue; end
    pcall(require,module);
end
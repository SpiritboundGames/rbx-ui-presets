print("Run")
local plr: Player = game.Players.LocalPlayer;

---@module src/Types
local Types = require(script.Parent:FindFirstChild("Types"));

local UIPresets: Types.UIPresets = require(script.Parent);

local PlayerGUI: PlayerGui = plr:WaitForChild("PlayerGui");
local TestUI: ScreenGui = PlayerGUI:WaitForChild("TestUI");

local testTextField: Types.TextField = UIPresets.newField(UIPresets.Field.TextField);
testTextField:SetParent(TestUI:FindFirstChild("Frame"):FindFirstChild("ScrollingFrame"));
testTextField.ValueChanged:Connect(function(value: string)
    print(`Value Changed: {value}`);
end);

--[[local testDropdown: Types.DropdownField = UIPresets.newField(UIPresets.Field.DropdownField, {
    Test = "TestValue",
    AnotherTest = "AnotherTestValue"
});
testDropdown:SetParent(TestUI:FindFirstChild("Frame"):FindFirstChild("ScrollingFrame"));--]]
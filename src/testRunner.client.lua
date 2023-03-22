print("Run")
local plr: Player = game.Players.LocalPlayer;

---@module src/Types
local Types = require(script.Parent:FindFirstChild("Types"));

local UIPresets: Types.UIPresets = require(script.Parent);

local testTextField: Types.TextField = UIPresets.newField(UIPresets.Field.TextField);

local PlayerGUI: PlayerGui = plr:WaitForChild("PlayerGui");

local TestUI: ScreenGui = PlayerGUI:FindFirstChild("TestUI");

testTextField:SetParent(TestUI:FindFirstChild("Frame"):FindFirstChild("ScrollingFrame"));
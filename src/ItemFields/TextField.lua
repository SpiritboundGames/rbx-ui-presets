--!strict
---@module src/Types
local Types = require(script.Parent.Parent.Types);
type TextField = Types.TextField;

local ItemField: Types.Schema_Base_ItemField = require(script.Parent.ItemField);

local TextField = {};
TextField.__index = TextField;
setmetatable(TextField,ItemField);

function TextField.new() : TextField
    local self = ItemField.newBase()::Types.Schema_Base_ItemField & Types.Object_TextField;
    local valueField: TextBox = Instance.new("TextBox");
    valueField.Name = "ValueField";
    valueField.Size = UDim2.new(0.4,0,1,0);
    valueField.TextXAlignment = Enum.TextXAlignment.Center;
    valueField.PlaceholderText = "Placeholder";
    valueField.Parent = self.InnerFrame;
    valueField.FocusLost:Connect(
        function(enterPressed: boolean, inputThatCausedFocusLoss: InputObject)
            self.Value = valueField.Text;
            self.ValueChanged:Fire(self.Value);
        end
    );
    self.ValueField = valueField;
    return setmetatable(self,TextField)::TextField;
end

return TextField;
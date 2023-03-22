--!strict
---@module src/Types
local Types = require(script.Parent.Parent.Types);
type TextField = Types.TextField;

local ItemField: Types.Schema_Base_ItemField = require(script.Parent.ItemField);

--[=[
    @class TextField

    This class is a derivitive of [ItemField] it contains an [ItemField.ValueField]
    which contains a [TextBox] which stores a value in string representation.
]=]
local TextField = {};
TextField.__index = TextField;
setmetatable(TextField,ItemField);

function TextField.new(labelTitle: string,defaultValue: string,placeholder: string?) : TextField
    local self = ItemField.newBase()::Types.Schema_Base_ItemField & Types.Object_TextField;
    self.ItemLabel.Text = labelTitle or "Unnamed";
    local valueField: TextBox = Instance.new("TextBox");
    valueField.Name = "ValueField";
    valueField.Size = UDim2.new(0.4,0,1,0);
    valueField.ClearTextOnFocus = false;
    valueField.TextColor3 = Color3.fromRGB(255,255,255);
    valueField.BorderColor3 = Color3.fromRGB(106,106,106);
    valueField.TextXAlignment = Enum.TextXAlignment.Center;
    valueField.Text = defaultValue or "";
    valueField.PlaceholderText = placeholder or "Placeholder";
    valueField.FocusLost:Connect(
        function(enterPressed: boolean, inputThatCausedFocusLoss: InputObject)
            self.Value = valueField.Text;
            self.ValueChanged:Fire(self.Value);
        end
    );
    self.BackFrame.AncestryChanged:Connect(function(child: Instance, parent: Instance)
        if not child == self.BackFrame then return; end
        if parent and parent:IsA("GuiObject") then
            local backgroundColour: Color3 = (parent::GuiObject).BackgroundColor3;
            self.ItemLabel.BackgroundColor3 = backgroundColour;
            valueField.BackgroundColor3 = backgroundColour;
        end
    end);
    self:AddValue(valueField);
    self.ValueField = valueField;
    return setmetatable(self,TextField)::TextField;
end

return TextField;
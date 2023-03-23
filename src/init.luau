--!strict

---@module src/Types
local Types = require(script.Types);

--[=[
    @class UIPresets

    This is the main class that should be used to create [ItemField] objects.
]=]
local UIPresets = {}::Types.UIPresets;

local ItemFieldsContainer: any = script.ItemFields;

local ItemField: Types.Schema_Base_ItemField = require(ItemFieldsContainer:FindFirstChild("ItemField"));
local TextField: Types.Schema_TextField = require(ItemFieldsContainer:FindFirstChild("TextField"));
local DropdownField: Types.Schema_DropdownField = require(ItemFieldsContainer:FindFirstChild("DropdownField"));


local Preset: Types.PresetSchemas = {
    ItemField = ItemField,
    TextField = TextField,
    DropdownField = DropdownField
};

UIPresets.Preset = Preset;

local Field: Types.Enum_ItemField = {
    TextField = 0,
    DropdownField = 1
};

UIPresets.Field = Field;

function UIPresets.newField<T>(itemField: number, ...: any) : T
    if itemField == Field.TextField then
        return TextField.new(...);
    elseif itemField == Field.DropdownField then
        return DropdownField.new(...);
    end
end

return UIPresets;
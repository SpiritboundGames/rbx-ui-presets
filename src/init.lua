--!strict

---@module src/Types
local Types = require(script.Types);

local UIPresets = {}::Types.UIPresets;

local ItemFieldsContainer: any = script.ItemFields;

local ItemField: Types.Schema_Base_ItemField = require(ItemFieldsContainer:FindFirstChild("ItemField"));
local TextField: Types.Schema_TextField = require(ItemFieldsContainer:FindFirstChild("TextField"));
local EnumField: Types.Schema_EnumField = require(ItemFieldsContainer:FindFirstChild("EnumField"));

local Preset: Types.PresetSchemas = {
    ItemField = ItemField,
    TextField = TextField,
    EnumField = EnumField
};

UIPresets.Preset = Preset;

local Field: Types.Enum_ItemField = {
    TextField = 0,
    EnumField = 1
};

UIPresets.Field = Field;

function UIPresets.newField<T>(itemField: number) : T
    if itemField == Field.TextField then
        
    end
end

local enumField: Types.EnumField = UIPresets.newField(Field.EnumField);

return UIPresets;
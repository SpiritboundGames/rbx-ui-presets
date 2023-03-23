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

--[=[
    @interface IPreset
    @within UIPresets
    .ItemField ItemField -- The [ItemField] class
    .TextField TextField -- The [TextField] class
    .DropdownField DropdownField -- The [DropdownField] class

    A dictionary that contains the [ItemField] classes.
]=]
--[=[
    @prop Preset IPreset
    @within UIPresets
    @tag enum-like

    This is a enum-like dictionary that contains [ItemField] classes.
]=]
UIPresets.Preset = Preset;

local Field: Types.Enum_ItemField = {
    TextField = 0,
    DropdownField = 1
};

--[=[
    @interface IField
    @within UIPresets
    .TextField 0
    .DropdownField 1

    An enum-like table that is used to distinguish the derivative of [ItemField].
]=]
--[=[
    @prop Field IField
    @within UIPresets
    @tag enum-like

    An enum-like table that is used to distinguish the derivative of [ItemField].
]=]
UIPresets.Field = Field;

--[=[
    @within UIPresets

    @param itemField Field -- The enum item in the [Field] enum-like table
    @param ... any -- The tuple of arguments to send to the [ItemField] derivative
]=]
function UIPresets.newField<T>(itemField: number, ...: any) : T
    if itemField == Field.TextField then
        return TextField.new(...);
    elseif itemField == Field.DropdownField then
        return DropdownField.new(...);
    end
end

return UIPresets;
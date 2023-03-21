--!strict
---@module src/Types
local Types = require(script.Parent.Parent.Types);
type EnumField = Types.EnumField;

local ItemField: Types.Schema_Base_ItemField = require(script.Parent.ItemField);

local EnumField = {};
EnumField.__index = EnumField;
setmetatable(EnumField,ItemField);

function EnumField.new(enumDictionary: {[string]: number | string}) : EnumField
    local self = ItemField.newBase()::Types.Schema_Base_ItemField & Types.Object_EnumField;

    return setmetatable(self,EnumField)::EnumField;
end

return EnumField;
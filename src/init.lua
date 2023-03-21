--!strict

---@module src/Types
local Types = require(script.Types);

local UIPresets = {};

local Field: Types.Enum_ItemField = {
    TextField = 0,
    EnumField = 1
};

UIPresets.Field = Field;

function UIPresets.newField(itemField: number) : Types.ItemField
    if itemField == Field.TextField then
        
    end
end

return UIPresets;
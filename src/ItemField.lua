---@module src/Types
local Types = require(script.Parent.Types);
type ItemField = Types.ItemField;

local ItemField = {} :: Types.Schema_ItemField;
ItemField.__index = ItemField;

local ItemFields: Types.Enum_ItemField = {
    TextField = 0,
    EnumField = 1
};

ItemField.Field = ItemFields;

function ItemField.new(itemField: number) : ItemField
    local self = {}::Types.Object_ItemField;
    
    return setmetatable(self,ItemField)::ItemField;
end

return ItemField;
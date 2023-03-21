---@module src/Types
local Types = require(script.Parent.Parent.Types);
type ItemField = Types.Base_ItemField;

local ItemField = {} :: Types.Schema_Base_ItemField;
ItemField.__index = ItemField;

function ItemField.newBase() : ItemField
    local self = {}::Types.Object_Base_ItemField;
    
    return setmetatable(self,ItemField)::ItemField;
end

return ItemField;
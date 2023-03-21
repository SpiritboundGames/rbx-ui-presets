--!strict
---@module src/Types
local Types = require(script.Parent.Parent.Types);
type EnumField = Types.EnumField;

local ItemField: Types.Schema_Base_ItemField = require(script.Parent.ItemField);

local EnumField = {};
EnumField.__index = EnumField;
setmetatable(EnumField,ItemField);

function EnumField.new() : EnumField
    local self: any = ItemField.newBase();
    
    return setmetatable(self,EnumField)::EnumField;
end

return EnumField;
--!strict
---@module src/Types
local Types = require(script.Parent.Parent.Types);
type TextField = Types.TextField;

local ItemField: Types.Schema_Base_ItemField = require(script.Parent.ItemField);

local TextField = {};
TextField.__index = TextField;
setmetatable(TextField,ItemField);

function TextField.new() : TextField
    local self = ItemField.newBase()::Types.Object_TextField;
    
    return setmetatable(self,TextField)::TextField;
end

return TextField;
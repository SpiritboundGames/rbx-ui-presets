--!strict
---@module src/Types
local Types = require(script.Parent.Parent.Types);
type DropdownField = Types.DropdownField;

local ItemField: Types.Schema_Base_ItemField = require(script.Parent.ItemField);

local DropdownField = {};
DropdownField.__index = DropdownField;
setmetatable(DropdownField,ItemField);

local function GetTableType(t: {[number]: any} | {[string]: any}): string
	assert(type(t) == "table", "Supplied argument is not a table")
	for i, _ in pairs(t) do
		if type(i) ~= "number" then
			return "dictionary"
		end
	end
	return "array"
end

function DropdownField.new(dropdownElements: {string} | {[string]: number} | {[string]: string}, defaultValue: number | string) : DropdownField
    local self = ItemField.newBase()::Types.Schema_Base_ItemField & Types.Object_DropdownField;

    local elementsType = GetTableType(dropdownElements)
    if elementsType == "array" then
        self._orderedEnums = dropdownElements
    elseif elementsType == "dictionary" then
        self._orderedEnums = {}

        --[[for enumTitle, enumValue in pairs(enumDictionary) do
            if typeof(enumValue) == "number" then
                table.insert(self._orderedEnums, math.max(1, math.round(enumValue)), enumTitle)
            elseif typeof(enumValue) == "string" then
                table.insert(self._orderedEnums, #self._orderedEnums+1, enumTitle)
            end
        end]]
    end

    return setmetatable(self,DropdownField)::DropdownField;
end

return DropdownField;
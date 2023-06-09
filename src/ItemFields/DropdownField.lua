--!strict
---@module src/Types
local Types = require(script.Parent.Parent.Types);
type DropdownField = Types.DropdownField;

local ItemField: Types.Schema_Base_ItemField = require(script.Parent.ItemField);

local DropdownField = {};
DropdownField.__index = DropdownField;
setmetatable(DropdownField,ItemField);

local function GetTableType(t: {[number]: any} | {[string]: any}): string
	if typeof(t) ~= "table" then error("The value supplied was not a table.") end
	for i, _ in pairs(t) do
		if type(i) ~= "number" then
			return "dictionary";
		end
	end
	return "array";
end

function DropdownField.new(dropdownElements: {string} | {[string]: number} | {[string]: string}, defaultValue: number | string | nil) : DropdownField
    local self = ItemField.newBase()::Types.Schema_Base_ItemField & Types.Object_DropdownField;

    local elementsType = GetTableType(dropdownElements)
    if elementsType == "array" then
        self._orderedElements = dropdownElements;
        self._currentIndex = table.find(self._orderedElements, defaultValue) or 1;
        self._correlationDictionary = {};

        for i, v in ipairs(self._orderedElements) do
            self._correlationDictionary[v] = i;
        end
    elseif elementsType == "dictionary" then
        self._orderedElements = {};
        self._correlationDictionary = {};

        local usesNumericValuation = false;
        for k, v in pairs(dropdownElements) do
            if typeof(v) == "number" then
                usesNumericValuation = true;
                break;
            elseif typeof(v) == "string" then
                usesNumericValuation = false;
                break;
            end
        end

        if usesNumericValuation then
            local zeroStart = false;
            for k, v in pairs(dropdownElements) do
                if v == 0 then
                    zeroStart = true;
                    break;
                end
            end

            for k, v in pairs(dropdownElements) do
                local position = v;
                if zeroStart then position += 1; end
                if v == defaultValue then self._currentIndex = position; end
                table.insert(self._orderedElements, position, k);
                self._correlationDictionary[k] = v
            end
        else
            for k, v in pairs(dropdownElements) do
                local position = #self._orderedElements+1
                if v == defaultValue then self._currentIndex = position; end
                table.insert(self._orderedElements, position, k)
                self._correlationDictionary[k] = v
            end
        end
    end

    self._currentIndex = self._currentIndex or 1

    print(self)

    return setmetatable(self,DropdownField)::DropdownField;
end

return DropdownField;
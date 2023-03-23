--!strict
---@module src/Types
local Types = require(script.Parent.Parent.Types);
type ItemField = Types.Base_ItemField;

--[=[
    @class ItemField

    This class is the base class for all ItemFields.
]=]
local ItemField = {} :: Types.Schema_Base_ItemField;
ItemField.__index = ItemField;

---@module Packages/GoodSignal
local GoodSignal = require(game.ReplicatedStorage.Packages:FindFirstChild("GoodSignal"));

local function createItemField() : (Frame,Frame,TextLabel)
    local BackFrame = Instance.new("Frame");
    BackFrame.Name = "BackFrame";
    BackFrame.AnchorPoint = Vector2.new(0.5, 0);
    BackFrame.Size = UDim2.new(1, 0, 0.15, 0);
    BackFrame.BackgroundTransparency = 0.7;
    BackFrame.Position = UDim2.new(0.5, 0, 0, 0);
    BackFrame.BackgroundColor3 = Color3.fromRGB(58, 58, 58);

    local InnerFrame = Instance.new("Frame");
    InnerFrame.Name = "InnerFrame";
    InnerFrame.Size = UDim2.new(0.9, 0, 0.9, 0);
    InnerFrame.BackgroundTransparency = 1;
    InnerFrame.Position = UDim2.new(0.05, 0, 0.05, 0);
    InnerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    InnerFrame.Parent = BackFrame;

    local ItemLabel = Instance.new("TextLabel");
    ItemLabel.Name = "ItemLabel";
    ItemLabel.AnchorPoint = Vector2.new(0, 0.5);
    ItemLabel.Size = UDim2.new(0.45, 0, 1, 0);
    ItemLabel.Position = UDim2.new(0, 0, 0.5, 0);
    ItemLabel.BackgroundColor3 = Color3.fromRGB(66, 66, 66);
    ItemLabel.BorderColor3 = Color3.fromRGB(106,106,106);
    ItemLabel.FontSize = Enum.FontSize.Size28;
    ItemLabel.TextSize = 24;
    ItemLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    ItemLabel.Text = "Placeholder";
    ItemLabel.Font = Enum.Font.SourceSans;
    ItemLabel.Parent = InnerFrame;

    return BackFrame,InnerFrame,ItemLabel;
end

--[=[
    @within ItemField
    This creates a new base object of [ItemField] which contains the UI elements.
]=]
function ItemField.newBase() : ItemField
    local self = {}::Types.Object_Base_ItemField;
    local backFrame: Frame, innerFrame: Frame,itemLabel: TextLabel = createItemField();
    --[=[
        @prop BackFrame Frame
        @within ItemField

        This property stores the back frame of all the UI elements for this ItemField.
    ]=]
    self.BackFrame = backFrame;
    --[=[
        @prop InnerFrame Frame
        @within ItemField

        This property is for maintaining the padding for the [ItemField.ItemLabel]
        and the ValueField objects.
    ]=]
    self.InnerFrame = innerFrame;
    --[=[
        @prop ItemLabel TextLabel
        @within ItemField

        This property is the label of the ValueField.
    ]=]
    self.ItemLabel = itemLabel;
    --[=[
        @prop ValueChanged GoodSignal
        @within ItemField

        This property is an event that is fired when the value of the ValueField changes.
    ]=]
    self.ValueChanged = GoodSignal.new();
    return setmetatable(self,ItemField)::ItemField;
end

--[=[
    @within ItemField
    @param self T | ItemField -- The [ItemField] object or a derivative

    This method takes a ValueUI([GuiObject]) and positions it correctly
    to the value place and parents it to the [ItemField.InnerFrame].
]=]
function ItemField.AddValue<T>(self: T | ItemField, valueObj: GuiObject,posOverride: UDim2?): ()
    valueObj.AnchorPoint = Vector2.new(1,0.5);
    valueObj.Position = posOverride or UDim2.new(1,0,0.5,0);
    valueObj.Parent = self.InnerFrame;
end

--[=[
    @within ItemField
    @error invalid_type -- This method will error if the parent is not a GuiObject.

    This method sets the [ItemField.BackFrame] parent to the specified parent [GuiObject].
]=]
function ItemField.SetParent<T>(self: T | ItemField,parent: GuiObject)
    if typeof(parent) ~= "Instance" or not parent:IsA("GuiObject") then
        error("ItemField :SetParent requires the parent to be a valid GUIObject Instance.");
    end
    self.BackFrame.Parent = parent;
end

return ItemField;
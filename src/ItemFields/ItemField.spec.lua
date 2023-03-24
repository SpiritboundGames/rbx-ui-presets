---@module src/Types
local Types = require(script.Parent.Parent.Types);

return function()
    type GlobalState = {
        ItemField: Types.Base_ItemField | nil
    };
    local globalState = {} :: GlobalState;

    local ItemField: Types.Schema_Base_ItemField = require(script.Parent.ItemField);

    it("Should be able to create a new base ItemField",function(context)
        local itemField: Types.Base_ItemField = ItemField.newBase();
        globalState.ItemField = itemField;
        expect(itemField).to.be.ok();
    end);
    it("Should be able to call SetParent for the BackFrame",function()
         local testFrame: Frame = Instance.new("Frame");
         globalState.ItemField:SetParent(testFrame);
         expect(globalState.ItemField.BackFrame.Parent).to.be.ok();
    end);
    it("Should be able to destroy the ItemField",function()
        globalState.ItemField:Destroy();
        globalState.ItemField = nil;
    end);
    afterAll(function()
        if not globalState.ItemField then return; end
        globalState.ItemField:Destroy();
        globalState.ItemField = nil;
    end);
end
---@module src/Types
local Types = require(script.Parent.Parent.Types);

return function()
    local UIPresets: Types.UIPresets = require(script.Parent.Parent);
    local Field: UIPresets.Field = UIPresets.Field;

    type GlobalState = {
        TextField: Types.TextField | nil
    };
    local globalState = {}::GlobalState;

    it("Should be able to create a new TextField",function()
        local textField: Types.TextField = UIPresets.newField(Field.TextField,"TestLabel","TestDefault");
        globalState.TextField = textField;
        expect(textField).to.be.ok();
        expect(textField.ItemLabel.Text).to.be.equal("TestLabel");
        expect(textField.ValueField.Text).to.be.equal("TestDefault");
    end);
    it("Should be able to call SetParent for the BackFrame",function(context)
        globalState.TextField:SetParent(context.TestFrame);
        expect(globalState.TextField.BackFrame.Parent).to.be.ok();
    end);
    it("Should be able to destroy the TextField",function()
        local textField: Types.TextField = globalState.TextField;
        textField:Destroy();
        globalState.TextField = nil;
        expect(textField.ValueChanged).to.be.equal(nil);
    end);
    afterAll(function()
        if not globalState.TextField then return; end
        globalState.TextField:Destroy();
        globalState.TextField = nil;
    end);
end
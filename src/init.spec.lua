return function()

    ---@module src/Types
    local Types = require(script.Parent:FindFirstChild("Types"));

    beforeAll(function(context)
        context.Types = Types;
    end);

end
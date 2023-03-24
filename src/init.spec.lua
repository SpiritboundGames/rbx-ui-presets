local plr: Player = game.Players.LocalPlayer;

return function()

    beforeAll(function(context)
        context.TestFrame = plr.PlayerGui:WaitForChild("TestUI"):WaitForChild("Frame"):WaitForChild("ScrollingFrame");
    end);

end
local checkAndRefuel = require("/code/lib/checkAndRefuel").checkAndRefuel


print("Refueled: " .. checkAndRefuel(1000))

local currentFuelLevel = turtle.getFuelLevel()
local maximumDistance = currentFuelLevel / 2 -- How far can the turtle go and still be able to come back

-- The turtles initial position is it's coordinate 0, and where it'll try to come back to
local x = 0
local y = 0
local z = 0
-- Used to keep track of the direction the turtle is facing
local facing = 1 -- [forward, right side, backwards, left side]

-- TODO: Set through input
local coalTarget = 64

-- TODO: The moving functions need to alter coodinates
-- To alter the coordinates they need to use what direction the turtle is facing
local function forward()
    if (turtle.forward()) then

    end
end

for i = 1, maximumDistance do

end

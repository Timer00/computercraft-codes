local checkAndRefuel = require("/code/lib/checkAndRefuel").checkAndRefuel

os.setComputerLabel("SimpleMiner")

print("Refueled: ", checkAndRefuel(80))

local currentFuelLevel = turtle.getFuelLevel()

if (currentFuelLevel < 10) then
    return "Please add fuel."
end

local maximumDistance = (currentFuelLevel / 2) - 1 -- How far can the turtle go and still be able to come back

print("Will mine ", maximumDistance, " blocks in the facing direction.")

local fuelConsumed = 0
while fuelConsumed < maximumDistance do
    local movedForward = turtle.forward()
    if movedForward then
        fuelConsumed = fuelConsumed + 1
    else
        turtle.dig()
    end
end

print("Reached maximum distance, turning back.")

turtle.turnLeft()

turtle.dig()
turtle.forward()

turtle.turnLeft()

fuelConsumed = 0

print("Will mine ", maximumDistance, " blocks on the way back.")

while fuelConsumed < maximumDistance do
    local movedForward = turtle.forward()
    if movedForward then
        fuelConsumed = fuelConsumed + 1
    else
        turtle.dig()
    end
end

print("Mining finished.")

local checkAndRefuel = require("/code/lib/checkAndRefuel").checkAndRefuel

os.setComputerLabel("SimpleMiner")

print("Please insert the number of blocks to mine in this direction:")

local blocksToMine = tonumber(read())

assert(blocksToMine, "Invalid input. Please enter a positive number.")

-- Ensure the miner has enough fuel for the trip there and back
blocksToMine = blocksToMine * 2
print("Fueled: ", checkAndRefuel(blocksToMine + 1))

local currentFuelLevel = turtle.getFuelLevel()

if (currentFuelLevel < blocksToMine) then
    return "Please add more fuel."
end

local maximumDistance = blocksToMine / 2 -- How far can the turtle go and still be able to come back

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

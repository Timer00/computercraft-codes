-- Table mapping items to their fuel values
local fuelValues = {
    ["coal"] = 80,
    ["log"] = 15,
    ["planks"] = 15,
    ["stick"] = 5,
    ["blaze_rod"] = 120,
    ["lava_bucket"] = 1000,
    ["sugar_cane"] = 0,
    ["wooden_axe"] = 10,
    ["wooden_hoe"] = 10,
    ["wooden_pickaxe"] = 10,
    ["wooden_shovel"] = 10,
    ["wooden_sword"] = 10,
    ["mushroom"] = 15,
    -- Add more items as needed
}

-- Function to get the fuel value of an item in a specific slot
local function getFuelValue(slot)
    local item = turtle.getItemDetail(slot)
    if item then
        for key, value in pairs(fuelValues) do
            if string.find(item.name, key) then
                return value
            end
        end
    end
    return 0
end

-- Checks if and how much the turtle needs to refuel and returns true if there is enough fuel or false if it can't refuel as much as needed.
local function checkAndRefuel(minMovesNeeded, slot)
    slot = slot or 1
    turtle.select(slot)

    local maximumFuelValue = turtle.getFuelLimit()
    local currentFuelValue = turtle.getFuelLevel()

    minMovesNeeded = minMovesNeeded or maximumFuelValue

    if (currentFuelValue >= minMovesNeeded) then
        print("Fuel is already at required/maximum level.")
        return true -- The turtle will be able to move as much as it can, so no fuel will be consumed
    end

    local itemFuelValue = getFuelValue(slot)
    local itemsTotalFuelValue = itemFuelValue * turtle.getItemCount(slot)

    local totalFuelAfterRefuel = itemsTotalFuelValue + currentFuelValue

    if totalFuelAfterRefuel < minMovesNeeded then
        print("Not enough fuel provided on slot: " .. slot)
        print("Fuel amount missing: " .. (minMovesNeeded - totalFuelAfterRefuel))
        return false
    end

    local amountItemsToConsume = math.ceil((minMovesNeeded - currentFuelValue) / itemFuelValue)

    if amountItemsToConsume < 1 then
        print("There is already more fuel than needed.")
        return true
    end

    return turtle.refuel(amountItemsToConsume)
end

return {
    checkAndRefuel = checkAndRefuel
}

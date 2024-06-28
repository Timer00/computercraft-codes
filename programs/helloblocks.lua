local function one180()
    turtle.turnLeft()
    turtle.turnLeft()
end

local function moveForward(blocks)
    for i = 1, blocks do
        turtle.forward()
    end
end

-- Function to reverse a table (array)
local function reverseTable(t)
    local reversed = {}
    for i = #t, 1, -1 do
        table.insert(reversed, t[i])
    end
    return reversed
end


local array2d = {
    { 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1 },
    { 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0 },
    { 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1 },
    { 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1 },
    { 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1 },
}

-- Reverse the second and fourth rows
array2d[2] = reverseTable(array2d[2])
array2d[4] = reverseTable(array2d[4])

-- Refuel before starting to make sure there is enough fuel.
turtle.select(1)
if not turtle.refuel(10) then
    print("Not enough fuel")
    return
end

local blockSlot = 2

turtle.select(blockSlot) -- Select building block

for i = #array2d, 1, -1 do
    for j = 1, #array2d[i] do
        local block = array2d[i][j]
        if block == 1 then turtle.placeDown() end
        if j < #array2d[i] then turtle.forward() end

        if turtle.getItemCount(blockSlot) < 1 then
            blockSlot = blockSlot + 1
            turtle.select(blockSlot)
        end
    end
    one180()
    turtle.up()
end

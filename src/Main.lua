--https://tweaked.cc/module/turtle.html

textutils.slowPrint("Make sure fuel is in slot 1, and chests are in slot 2")

textutils.slowPrint("Enter 2d x and y values")
textutils.slowPrint("Enter x value: ")
inputX = read(inputX)
textutils.slowPrint("Enter y value: ")
inputY = read(inputY)

textutils.slowPrint("It do be digging tho")

function refuel()
    turtle.select(1)
    turtle.refuel(1)
end

function digForward()
    while turtle.detect() do
        turtle.dig()
    end
end

function moveForward()
    if turtle.getFuelLevel() < 10 then
        refuel()
    end

    turtle.digUp()
    turtle.digDown()

    while turtle.forward() == false do
        digForward()
        turtle.digUp()
        turtle.attack()
    end
end

function emptyInventory()
    moveForward()
    turtle.back()
    turtle.select(2)
    if not (turtle.getItemCount() < 1) then
        turtle.place()
        for i = 3, 14 do
            turtle.select(i)
            turtle.drop()
        end
    end

end

for j = 1, inputX do
    moveForward()
end

emptyInventory()

for i = 1, inputY do

    turtle.turnRight()
    moveForward()
    turtle.turnRight()

    for j = 1, inputX do
        moveForward()
    end

    turtle.turnLeft()
    moveForward()
    turtle.turnLeft()

    for j = 1, inputX do
        moveForward()
    end

    emptyInventory()
end
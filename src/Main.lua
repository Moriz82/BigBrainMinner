--https://tweaked.cc/module/turtle.html

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
    while turtle.forward() == false do
        digForward()
        turtle.digUp()
        turtle.attack()
    end
end

for j = 1, 40 do
    moveForward()
end

for i = 1, 39 do

    turtle.turnRight()
    moveForward()
    turtle.turnRight()

    for j = 1, 40 do
        moveForward()
    end

    turtle.turnLeft()
    moveForward()
    turtle.turnLeft()

    for j = 1, 40 do
        moveForward()
    end
end
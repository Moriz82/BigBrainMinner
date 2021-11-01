--https://tweaked.cc/module/turtle.html

textutils.slowPrint("Make sure fuel is in slot 1\nMake sure chests are in slot 2")

textutils.slowPrint("Start Mining?[y/n] ")

yorn = read(yorn)
if (string.lower(yorn) == "n") then
    os.exit()
end

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

    while not turtle.forward() do
        digForward()
        turtle.digUp()
        turtle.attack()
    end
end

function emptyInventory()
    turtle.turnRight()
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
    turtle.turnLeft()
end

function checkInv()
    for i = 3, 14 do
        turtle.select(i)
        if (turtle.getItemCount() < 1) then
            return
        end
    end
    emptyInventory()
end
        
turnedAround = false
blocksMoved = 0

while true do
    if (turnedAround && blocksMoved==0) then
        break
    end
    moveForward()
    checkInv()
    turtle.select(2)
    if not (turnedAround) then
        blocksMoved += 1
    end
    if turnedAround then
        blocksMoved -= 1
        continue
    end
    if (turtle.getItemCount() < 1 && !turnedAround) then
        turtle.turnRight()
        turtle.turnRight()
        turnedAround = true
    end
end
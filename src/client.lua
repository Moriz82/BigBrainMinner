print("Enter server id: ")
hostId = tonumber(read(hostId))

rednet.open("top")

while true do
    print("Enter password: ")
    password = read(password)
    if string.lower(password) == "/exit" then
        os.exit()
    end
    rednet.send(hostId, password)
    id,msg = rednet.receive()
    if msg == "welcome" then
        break
    end
end

co = coroutine.create(function ()
    while true do
        id,msg = rednet.receive()
        print(msg)
    end
end)

coroutine.resume(co)

while true do
    msg = read(mess)
    rednet.send(hostId, msg)
    if string.lower(msg) == "/exit" then
        break
    end
end

rednet.close()
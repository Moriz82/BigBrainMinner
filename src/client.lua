print("Enter server id: ")
hostId = tonumber(read(hostId))
print("Enter password: ")
pass = tonumber(read(pass))

rednet.open("top")
rednet.send(hostId, password)

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
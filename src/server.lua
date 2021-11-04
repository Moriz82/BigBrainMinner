users = {
    [8] = "Admin"
}
ids = {}
rednet.open("top")

print("Enter password: ")
pass = tonumber(read(pass))


function split(s, sep)
    local fields = {}

    local sep = sep or " "
    local pattern = string.format("([^%s]+)", sep)
    string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)

    return fields
end

while true do
    id,msg = rednet.receive()
    if users[id] == nil then
        if msg == pass then
            users[id] = "guest-"..id
            len = #ids
            table.insert(ids, id)
        end
    end
    if not users[id] == nil then
        print(users[id]..": "..msg)
        for i = 1, #ids-1 do
            rednet.send(ids[i], users[id]..": "..msg)
        end
        if string.lower(msg) == "/exit" then
            for i = 1, #ids do
                if ids[i]==id then
                    ids[i]=nil
                end
            end
            users[id] = nil
        end
        if string.find(string.lower(msg), "/nick") then
            users[id] = split(msg,"/nick")[1]
        end
    end
end
rednet.close()

---@class LinkedList
local LinkedList = {}
LinkedList.__index = LinkedList

function LinkedList:new()
    return setmetatable(
        {
            body = {},
            first_element = nil,
            last_element = nil,
        },
        {
            __index = self
        }
    )
end

function LinkedList:add_last(value)
    local element = { value = value, next = nil, prev = nil }
    if next(self.body) then
        element.prev = self.last_element
        self.last_element.next = element
        self.last_element = element
        table.insert(self.body, #self.body + 1, element)
    else
        self.body = { element }
        self.first_element = element
        self.last_element = element
    end
end

function LinkedList:pop_last()
    if next(self.body) then
        local last_element = self.last_element
        self.last_element = last_element.prev
        local prev_element = last_element.prev
        prev_element.next = nil
        return last_element.value
    end
end

function LinkedList:add_first(value)
    local element = { value = value, next = nil, prev = nil }
    if next(self.body) then
        element.next = self.first_element
        self.first_element.prev = element
        self.first_element = element
        table.insert(self.body, #self.body + 1, element)
    else
        self.body = { element }
        self.first_element = element
        self.last_element = element
    end
end

function LinkedList:iter()
    return function(s, i)
        if not i then
            return s
        else
            return i.next
        end
    end, self.first_element
end

function LinkedList:debug()
    print('Linked list:\nvalue, next, prev')
    for i in self:iter() do
        print(i.value, i.next and i.next.value, i.prev and i.prev.value)
    end
end

local x = LinkedList:new()
x:add_last(2)
x:add_last(3)
x:add_first(1)
x:debug()
print('pop', x:pop_last())
x:debug()
collectgarbage('collect')
collectgarbage('collect')
print('body')
for k, v in pairs(x.body) do
    print(v.value)
end

return LinkedList

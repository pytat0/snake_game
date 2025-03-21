---@class LinkedList
local LinkedList = {}
LinkedList.__index = LinkedList

function LinkedList:new()
    return setmetatable(
        {
            first_element = nil,
            last_element = nil,
            length = 0,
        },
        {
            __index = self
        }
    )
end

function LinkedList:add_last(value)
    local element = { value = value, next = nil, prev = nil }
    if self.length > 0 then
        element.prev = self.last_element
        self.last_element.next = element
        self.last_element = element
    else
        self.first_element = element
        self.last_element = element
    end
    self.length = self.length + 1
end

function LinkedList:add_first(value)
    local element = { value = value, next = nil, prev = nil }
    if self.length > 0 then
        element.next = self.first_element
        self.first_element.prev = element
        self.first_element = element
    else
        self.first_element = element
        self.last_element = element
    end
    self.length = self.length + 1
end

function LinkedList:pop_last()
    if self.length == 1 then
        self.length = self.length - 1
        local last_element = self.first_element
        self.last_element = nil
        self.first_element = nil
        return last_element
    elseif self.length > 1 then
        self.length = self.length - 1
        local last_element = self.last_element
        self.last_element = last_element.prev
        local prev_element = last_element.prev
        prev_element.next = nil
        return last_element.value
    end
end

function LinkedList:pop_first()
    if self.length == 1 then
        self.length = self.length - 1
        local first_element = self.first_element
        self.first_element = nil
        self.last_element = nil
        return first_element
    elseif self.length > 1 then
        self.length = self.length - 1
        local first_element = self.first_element
        self.first_element = first_element.next
        local second_element = first_element.next
        second_element.prev = nil
        return first_element.value
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
    print('length: ' .. self.length)
end

-- tests
-- local x = LinkedList:new()
-- x:add_last(2)
-- x:add_last(3)
-- x:add_first(1)
-- x:debug()
-- print('pop', x:pop_first())
-- x:pop_last()
-- x:pop_last()
-- x:debug()
-- x:pop_last()
-- x:debug()


return LinkedList

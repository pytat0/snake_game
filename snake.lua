local config = require 'config'
local draw = require 'draw'
local LinkedList = require 'linked_list'

--- @class Snake
local Snake = {
    head_x = 6,
    head_y = 6,
    ---@type LinkedList
    body = LinkedList:new(),
    should_grow = 0,
}
Snake.body:add_last({ 6, 7 })
Snake.body:add_last({ 7, 7 })

function Snake:move(dx, dy)
    local new_x = self.head_x + dx
    local new_y = self.head_y + dy
    local last = self.body:pop_last()
    self.body:add_first({ self.head_x, self.head_y })
    self.head_x = self.head_x + dx
    self.head_y = self.head_y + dy
    if self.should_grow > 0 then
        self.body:add_last(last)
        self.should_grow = self.should_grow - 1
    end
end

function Snake:increase_size(count)
    self.should_grow = self.should_grow + (count or 1)
end

function Snake:draw()
    for v in self.body:iter() do
        draw.draw_box(v.value[1], v.value[2], config.colors.yellow)
    end
    draw.draw_box(self.head_x, self.head_y, config.colors.green)
end

return Snake

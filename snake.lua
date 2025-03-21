local config = require 'config'
local draw = require 'draw'

--- @class Snake
local Snake = {
    head_x = 6,
    head_y = 6,
    body = {
        { 6, 7 },
        { 7, 7 },
    },
    should_grow = 0,
}

function Snake:move(dx, dy)
    local new_x = self.head_x + dx
    local new_y = self.head_y + dy
    if
        new_x >= 1
        and new_x <= config.field.tile_count_x
        and new_y >= 1
        and new_y <= config.field.tile_count_y
    then
        local last = table.remove(self.body, #self.body)
        table.insert(self.body, 1, { self.head_x, self.head_y })
        self.head_x = self.head_x + dx
        self.head_y = self.head_y + dy
        if self.should_grow > 0 then
            table.insert(self.body, #self.body + 1, last)
            self.should_grow = self.should_grow - 1
        end
    end
end

function Snake:increase_size(count)
    self.should_grow = self.should_grow + (count or 1)
end

function Snake:draw()
    for i, v in ipairs(self.body) do
        draw.draw_box(v[1], v[2], config.colors.yellow)
    end
    draw.draw_box(self.head_x, self.head_y, config.colors.green)
end

return Snake

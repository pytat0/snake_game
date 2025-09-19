local config = require 'config'
local draw = require 'draw'

---@class Food
local Food = {
    pos_x = 4,
    pos_y = 4,
    temp_x = nil,
    temp_y = nil
}

function Food:draw()
    draw.draw_box(self.pos_x, self.pos_y, config.colors.red)
end


-- PLAN rewrite after 1.0
---@param snake Snake
function Food:regenerate(snake)

    if snake.body.length + 1 == config.field.tile_count_x * config.field.tile_count_y then
        return nil
    end

    local function is_food_on_snake(pos_x, pos_y, snake)
        if snake.head_x == pos_x and snake.head_y == pos_y then
            return true
        end
        for v in snake.body:iter() do
            if v.value[1] == pos_x and v.value[2] == pos_y then
                return true
            end
        end
        return false
    end

    repeat
        local pos_x = math.random(config.field.tile_count_x)
        local pos_y = math.random(config.field.tile_count_y)
        self.temp_x = pos_x
        self.temp_y = pos_y
    until not is_food_on_snake(pos_x, pos_y, snake)
    self.pos_x = self.temp_x
    self.pos_y = self.temp_y
end

return Food

local config = require 'config'
local draw = require 'draw'

---@class Food
local Food = {
    pos_x = 4,
    pos_y = 4,
}

function Food:draw()
    draw.draw_box(self.pos_x, self.pos_y, config.colors.red)
end

---@param snake Snake
function Food:regenerate(snake)
    local function is_food_on_snake(pos_x, pos_y, snake)
        if snake.head_x == pos_x and snake.head_y == pos_y then
            print('food on snake')
            return true
        end
        for v in snake.body:iter() do
            if v.value[1] == pos_x and v.value[2] == pos_y then
                print('food on snake')
                return true
            end
        end
        print('ok')
        return false
    end

    repeat
        local pos_x = math.random(config.field.tile_count_x)
        local pos_y = math.random(config.field.tile_count_y)
        self.pos_x = pos_x
        self.pos_y = pos_y
    until not is_food_on_snake(pos_x, pos_y, snake)
end

return Food

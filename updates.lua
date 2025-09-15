local config = require 'config'

local m = {}

--- Check is snake head on tile with food
--- @param snake Snake
--- @param food Food
--- @return boolean
function m.is_snake_eat_food(snake, food)
    if food.pos_x == snake.head_x and food.pos_y == snake.head_y then
        return true
    end
    return false
end

--- Check is snake move into wall
--- @param snake Snake
--- @return boolean
function m.is_snake_move_into_wall(snake)
    if snake.head_x < 1 or snake.head_x > config.field.tile_count_x or snake.head_y < 1 or snake.head_y > config.field.tile_count_y then
        return true
    end
    return false
end

--- Check is snake bite itself
--- @param snake Snake
--- @return boolean
function m.is_snake_bite_itself(snake)
    for v in snake.body:iter() do
        if snake.head_x == v.value[1] and snake.head_y == v.value[2] then
            return true
        end
    end
    return false
end

return m

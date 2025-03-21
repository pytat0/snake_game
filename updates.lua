local m = {}

--- Check is snake head on tile with food
--- @param snake Snake
--- @param food Food
--- @return boolean
function m.is_snake_eat_food(snake, food)
    if food.pox_x == snake.head_x and food.pos_y == snake.head_y then
        return true
    end
    return false
end

return m

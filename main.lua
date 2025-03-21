local snake = require 'snake'
local config = require 'config'
local field = require 'field'
local food = require 'food'
local updates = require 'updates'

function love.load()

end

function love.update(dt)
    if updates.is_snake_eat_food(snake, food) then
        food:regenerate()
        snake:increase_size()
    end
end

function love.draw()
    field:draw()
    snake:draw()
    food:draw()
end

function love.keypressed(key)
    if key == 'up' then
        snake:move(0, -1)
    elseif key == 'down' then
        snake:move(0, 1)
    elseif key == 'left' then
        snake:move(-1, 0)
    elseif key == 'right' then
        snake:move(1, 0)
    end
end

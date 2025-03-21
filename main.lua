local snake = require 'snake'
local config = require 'config'
local field = require 'field'
local food = require 'food'
local updates = require 'updates'
local states = require 'states'
local draw = require 'draw'

function love.load()
    GameState = states.resume
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
    if GameState == states.pause then
        draw.game_paused()
    end
end

function love.keypressed(key)
    if GameState == states.pause then
        if key == 'space' then
            GameState = states.resume
        end
    elseif GameState == states.resume then
        if key == 'up' then
            snake:move(0, -1)
        elseif key == 'down' then
            snake:move(0, 1)
        elseif key == 'left' then
            snake:move(-1, 0)
        elseif key == 'right' then
            snake:move(1, 0)
        elseif key == 'space' then
            GameState = states.pause
        end
    end
end

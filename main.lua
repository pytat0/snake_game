local snake = require 'snake'
local config = require 'config'
local field = require 'field'
local food = require 'food'
local updates = require 'updates'
local states = require 'states'
local draw = require 'draw'
local structs = require 'structs'

-- TODO ADD restart game from pause and after death
-- TODO ADD exit from game

function love.load()
    GameState = states.resume
    Timer = 0
end

function love.update(dt)
    if updates.is_snake_move_into_wall(snake) or updates.is_snake_bite_itself(snake) then
        GameState = states.game_over
    end
    if updates.is_snake_eat_food(snake, food) then
        food:regenerate(snake)
        snake:increase_size()
    end
    if GameState == states.resume then
        Timer = Timer + dt
        if Timer >= 0.4 then
            Timer = 0
            snake:move()
        end
    end
end

function love.draw()
    field:draw()
    snake:draw()
    food:draw()
    if GameState == states.game_over then
        draw.game_over()
    elseif GameState == states.pause then
        draw.game_paused()
    end
end

function love.keypressed(key)
    if GameState == states.pause then
        if key == 'space' then
            GameState = states.resume
        end
    elseif GameState == states.resume then
        if key == 'up' and snake.direction ~= structs.Directions.DOWN then
            snake.direction = structs.Directions.UP
        elseif key == 'down' and snake.direction ~= structs.Directions.UP then
            snake.direction = structs.Directions.DOWN
        elseif key == 'left' and snake.direction ~= structs.Directions.RIGHT then
            snake.direction = structs.Directions.LEFT
        elseif key == 'right' and snake.direction ~= structs.Directions.LEFT then
            snake.direction = structs.Directions.RIGHT
        elseif key == 'space' then
            GameState = states.pause
        end
    end
end

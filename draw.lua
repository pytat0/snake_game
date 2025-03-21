local config = require 'config'

local m = {}

function m.draw_box(x, y, color)
    love.graphics.setColor(color)
    love.graphics.rectangle(
        'fill',
        config.field.x_padding + config.field.tile_size * x - config.field.tile_size,
        config.field.y_padding + config.field.tile_size * y - config.field.tile_size,
        config.field.tile_size,
        config.field.tile_size
    )
end

function m.game_paused()
    -- love.graphics.setColor(config.colors.purple)
    local font = love.graphics.getFont()
    local plainText = love.graphics.newText(font, "Game paused")
    love.graphics.draw(plainText, 40, 40)
end

return m

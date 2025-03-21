local config = require("config")

local Field = {

}

function Field:draw()
    love.graphics.setColor(config.colors.dark_max)
    love.graphics.rectangle(
        'fill',
        config.field.x_padding,
        config.field.y_padding,
        config.field.tile_size * config.field.tile_count_x,
        config.field.tile_size * config.field.tile_count_y
    )
end

return Field

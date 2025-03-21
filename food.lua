local config = require 'config'
local draw = require 'draw'

---@class Food
local Food = {
    pox_x = 4,
    pos_y = 4,
}

function Food:draw()
    draw.draw_box(self.pox_x, self.pos_y, config.colors.red)
end

-- TODO change logic don't spawn on snake's body
function Food:regenerate()
    self.pox_x = math.random(config.field.tile_count_x)
    self.pox_y = math.random(config.field.tile_count_y)
end

return Food

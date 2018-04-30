Object = require "lib/rxi/classic"

Camera = Object:extend()

function Camera:new(x,y)
  self.x = x or 0
  self.y = y or 0
  self.scaleX = 1
  self.rotation = 0
  self.scaleY = 1
end

Object = require "lib/rxi/classic"

Camera = Object:extend()

function Camera:new(x,y)
  self.x = x or 0
  self.y = y or 0
  self.scaleX = 1
  self.rotation = 0
  self.scaleY = 1
end

function Camera:move(dx, dy)
  self.x = self.x + dx
  self.y = self.y + dy
end

function Camera:set()
  love.graphics.push()
  love.graphics.rotate(-self.rotation)
  love.graphics.translate(-self.x, -self.y)
end

function Camera:unset()
  love.graphics.pop()
end

function Camera:move(dx, dy)
  self.x = self.x + dx
  self.y = self.y + dy
end

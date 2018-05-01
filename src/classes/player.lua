Player = Object:extend()

function Player:new(x, y)
  self.x = x or 0
  self.y = y or 0
end

function Player:update(dt, camera)
  local dx = 0
  local dy = 0
  if love.keyboard.isDown("d") then
    dx = dx + 1
  end
  if love.keyboard.isDown("a") then
    dx = dx - 1
  end
  if love.keyboard.isDown("w") then
    dy = dy - 1
  end
  if love.keyboard.isDown("s") then
    dy = dy + 1
  end
  self:move(dx, dy)
  camera:move(dx,dy)
end

function Player:move(dx, dy)
  self.x = self.x + dx
  self.y = self.y + dy
end

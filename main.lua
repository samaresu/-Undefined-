require "src/classes/camera"
require "src/classes/player"

function love.load()
  setConf()
end

function love.draw()
  local c1 = Camera()
  local c2 = Camera(100, 800)
  local j1 = Player()
    love.graphics.scale(0.5, 0.5)
  love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle("fill", c1.x, c1.y, 100, 100)
  love.graphics.setColor(0, 255, 0)
  love.graphics.rectangle("fill", c2.x, 0, 100, j1.y)

end

function love.update(dt)

end

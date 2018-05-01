require "src/classes/camera"
require "src/classes/player"

function love.load()
  setConf()
  j = Player(50,50)
  c = Camera()
end

function love.draw()
  c:set()
  --jogador
  love.graphics.rectangle("fill", j.x, j.y, 100, 100)
  --objetos
  love.graphics.rectangle("fill", 200, 200, 10, 10)
  love.graphics.rectangle("fill", 200, 240, 10, 10)
  love.graphics.rectangle("fill", 220, 210, 10, 10)
  c:unset()
end

function love.update(dt)
  j:update(dt, c)
end

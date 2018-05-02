require "src/classes/camera"
require "src/classes/player"

function love.load()
  setConf()
  j = Player(390,390)
  camera = Camera()
end

function love.draw()
  camera:set()
  --jogador
  j:draw()
  --objetos
  love.graphics.rectangle("fill", 200, 200, 10, 10)
  love.graphics.rectangle("fill", 200, 240, 10, 10)
  love.graphics.rectangle("fill", 220, 210, 10, 10)
  camera:unset()
end

function love.update(dt)
  j:update(dt, camera)
end

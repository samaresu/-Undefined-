anim8 = require("lib/anim8/anim8")

Inimigo = {
    vida = {color, value, maxValue},
    x,
    y,
    scale,
    imagens = {idle, baixo_direita},
    animation,
}

function Inimigo:new()
    self.x, self.y = 0, 0
    self.scale = 4
    vida = {color={255,0,0}, value=100, maxValue=100}
    love.graphics.setDefaultFilter("nearest","nearest")
    self.imagens.idle = love.graphics.newImage("/src/images/inimigo_idle.png")
    
    -- local g = anim8.newGrid(32, 32, self.imagens.idle:getWidth(), self.imagens.idle:getHeight())
    -- self.animation = anim8.newAnimation(g('1',1), 0.2)
    return self
end

function Inimigo:update(dt)
end

function Inimigo:draw()
    love.graphics.draw(self.imagens.idle, self.x, self.y, 0, self.scale)
end
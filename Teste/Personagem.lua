local anim8 = require("lib/anim8/anim8")
local Timer = require("lib/hump/timer")

Personagem = {
    vida,
    scale,
    x, x2, y, y2,
    ativo,
    largura, altura,
    imagens = {idle, baixo_direita},
    animation
}

function Personagem:new()
    self.altura = 80
    self.largura = 80
    self.x = 200
    self.y = 200
    self.x2 = self.x + self.largura
    self.y2 = self.y + self.altura
    self.ativo = true
    self.vida = {color = {0,255,0}, value = 100, maxValue = 100}
    self.scale = 3
    love.graphics.setDefaultFilter("nearest","nearest")
    self.imagens = {
        idle = love.graphics.newImage('/src/images/mordomo_idle.png'),
        baixo_direita = love.graphics.newImage('/src/images/mordomo_baixo_direita.png')}
    
    -- animacao
	local g = anim8.newGrid(32, 32, self.imagens.idle:getWidth(), self.imagens.idle:getHeight())
    self.animation = anim8.newAnimation(g('1-4',1), 0.2)

    return self
end

function Personagem:update(dt, assert2)
    self.animation:update(dt)
    
    if love.keyboard.isDown("d") then
        self.x = self.x + 2
	end
	if love.keyboard.isDown("a") then
		self.x = self.x - 2
	end
	if love.keyboard.isDown("s") then
        self.y = self.y + 2
	end
	if love.keyboard.isDown("w") then
        self.y = self.y - 2
    end
    self:atualizarPos()
end

function Personagem:movimentar(x1, y1)
    self.x = self.x + x1
    self.x2 = self.x + self.largura
    self.y = self.y + y1
    self.y2 = self.y + self.altura
end

function Personagem:draw()
    love.graphics.setColor(255,255,255)
    self.animation:draw(self.imagens.idle, self.x, self.y, 0, self.scale)
    
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("line", self.x, self.y, self.largura, self.altura)

    love.graphics.print(self.x2, 10, 10)
end

function Personagem:atualizarPos()
    self.x2 = self.x + self.largura
    self.y2 = self.y + self.altura 
end
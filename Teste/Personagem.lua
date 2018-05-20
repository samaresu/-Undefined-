anim8 = require("lib/anim8/anim8")

Personagem = {
    vida,
    scale,
    x,
    y,
    imagens = {idle, baixo_direita},
    animation
}

function Personagem:new()
    self.vida = {color = {0,255,0}, value = 100, maxValue = 100}
    self.scale = 1
    self.x = 0
    self.y = 0
    love.graphics.setDefaultFilter("nearest","nearest")
    self.imagens = {
        idle = love.graphics.newImage('/src/images/mordomo_idle.png'),
        baixo_direita = love.graphics.newImage('/src/images/mordomo_baixo_direita.png')}
    
    -- animacao
	local g = anim8.newGrid(32, 32, self.imagens.idle:getWidth(), self.imagens.idle:getHeight())
    self.animation = anim8.newAnimation(g('2-4',1), 0.2)

    return self
end

function Personagem:update(dt)
    self.animation:update(dt)
    
    if love.keyboard.isDown("d") then
		self.x = self.x + 2
		self.vida.value = self.vida.value + 1
	end
	if love.keyboard.isDown("a") then
		self.x = self.x - 2
		self.vida.value = self.vida.value - 1
	end
	if love.keyboard.isDown("s") then
		self.y = self.y + 2
	end
	if love.keyboard.isDown("w") then
		self.y = self.y - 2	
	end
end

function Personagem:draw()
    self.animation:draw(self.imagens.idle, self.x, self.y, 0, self.scale)
end
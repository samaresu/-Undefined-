anim8 = require("lib/anim8/anim8")

Inimigo = {
    vida = {color, value, maxValue},
    x, x2, y, y2,
    largura, altura,
    scale,
    imagens = {idle, baixo_direita},
    animation,
    objToFollow
}

function Inimigo:new()
    self.ativo = true
    self.largura = 110
    self.altura = 120
    self.x = 0
    self.y = 0
    self.x2 = self.x + self.largura
    self.y2 = self.y + self.altura 
    self.scale = 1
    self.vida = {color={255,0,0}, value=100, maxValue=100}
    love.graphics.setDefaultFilter("nearest","nearest")
    self.imagens.idle = love.graphics.newImage("/src/images/inimigo_idle.png")
    
    local g = anim8.newGrid(32, 32, self.imagens.idle:getWidth(), self.imagens.idle:getHeight())
    self.animation = anim8.newAnimation(g('1-4',1), 0.1)
    return self
end

function Inimigo:update(dt)
    self.animation:update(dt)

    self.x = self.x + 0
    self.x2 = self.x + self.largura
    self.y = self.y + 0
    self.y2 = self.y + self.altura

    if self.objToFollow ~= nil then
        self:followObject()
    end
    self:atualizarPos()
end

function Inimigo:draw()
    -- love.graphics.draw(self.imagens.idle, self.x, self.y, 0, self.scale)
    self.animation:draw(self.imagens.idle, self.x, self.y, 0, 4)
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("line", self.x, self.y, self.largura, self.altura)
end

function Inimigo:movimentar(x1, y1)
    self.x = self.x + x1
    self.x2 = self.x + self.largura
    self.y = self.y + y1
    self.y2 = self.y + self.altura
end

function Inimigo:lookForObjects(obj)
    local objCenterPointX = obj.x + (obj.largura / 2)
    local objCenterPointY = obj.y + (obj.altura / 2) 
    local selfCenterPointX = self.x + (self.largura / 2)
    local selfCenterPointY = self.y + (self.altura / 2)
    
    local distX = objCenterPointX - selfCenterPointX
    local distY = objCenterPointY - selfCenterPointY
    
    -- distancia euclidiana a = sqrt(b^2 + c^2)
    local distTotal = math.sqrt(math.abs(distX^2 + distY^2))

    if distTotal < 300 then
        self.objToFollow = obj
    end
end

function Inimigo:followObject() 
    -- esta na esquerda
    if self.x2 > self.objToFollow.x then
        self.x = self.x - 1
    -- esta na direita
    elseif self.x < self.objToFollow.x2 then
        self.x = self.x + 1
    end
    if self.y2 < self.objToFollow.y then
        self.y = self.y + 1
    elseif self.y > self.objToFollow.y2 then
        self.y = self.y - 1
    end
end

function Inimigo:atualizarPos()
    self.x2 = self.x + self.largura
    self.y2 = self.y + self.altura 
end
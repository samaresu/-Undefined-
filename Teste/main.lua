require("Personagem")
require("Inimigo")

Gamestate = require("lib/hump/gamestate")
Timer = require("lib/hump/timer")
Camera = require("lib/hump/camera")
anim8 = require("lib/anim8/anim8")

-- definindo estados
local menu = {}
local game = {}
local gameOver = {}
local pause = {}

local fase
local x = 0
local y = 0
local pers = Personagem:new()
local inimigo = Inimigo:new()

function menu:update()
	if love.keyboard.isDown('c') then
		Gamestate.switch(game)
	end
end

function menu:draw()
	love.graphics.print("pressione 'c' pra começar o jogo", 10, 10)
end

function game:update(dt)

	local dx,dy = pers.x - cam.x, pers.y - cam.y
	
	cam:move(dx, dy)
	
	if love.keyboard.isDown("b") then	
		Timer.tween(0.1, pers, {scale=1.10}, 'linear')
	end
	
	pers:update(dt)
	
	if love.keyboard.isDown("l") then
		scale = scale + 1
	end
	if love.keyboard.isDown("p") then
		Gamestate.switch(pause)
	end

	if pers.vida.value > pers.vida.maxValue then
		pers.vida.value = pers.vida.maxValue
	elseif pers.vida.value < 0 then
		pers.vida.value = 0
	end
	
	Timer.update(dt)
end

function game:draw()
	
	cam:attach()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(fase, 0, 0, 0, 2)
	inimigo:draw()
	pers:draw()
	love.graphics.setColor(255,0,0)
	
	cam:detach()
	
	desenharHUD()
end

function pause:update(dt)
	if love.keyboard.isDown("f") then
		Gamestate.switch(game)
	end
end

function pause:draw()
	game:draw()
	love.graphics.setColor(0,0,0, 0.5)
	love.graphics.rectangle("fill", 0, 0, 800, 600)
	love.graphics.setColor(0,0,0)
	love.graphics.print("Jogo Pausado", 10, 10)
	
end

function love.load()
	cam = Camera(100, 100, 1)
	
	-- definido scale sem perda de qualidade
	love.graphics.setDefaultFilter("nearest","nearest")
	

	local windowFlags = {resizable = true}
	love.window.setMode(800,600, windowFlags)
	fase = love.graphics.newImage("/src/images/fase_teste.png")
	
	-- Definindo gameState e estado inicial
	Gamestate.registerEvents()
	Gamestate.switch(menu)
end

function desenharHUD() 
	
	-- desenhar HUD
	love.graphics.setColor(pers.vida.color)
	love.graphics.rectangle("fill", 25, 25, pers.vida.value, 20)
end
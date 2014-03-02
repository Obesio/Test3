require 'gameplay'
require 'menu'
require 'help'
require 'endGame'
require 'leaderboard'

function love.load()
	love.filesystem.setIdentity("Test3")
	if not love.filesystem.exists('lead.txt') then
		love.filesystem.newFile('lead.txt')
		love.filesystem.write('lead.txt', '')
	end
	highscores = {}
	for line in love.filesystem.lines("lead.txt") do
  		table.insert(highscores, line)
	end
	table.sort(highscores, function(a, b) return a > b end)
	math.randomseed(os.time())
	selection = 1
	options = {'Start Game', 'Leaderboard','Help', 'Exit Game'}
	char = {75, 125, image = love.graphics.newImage('resources/player.png')}
	inv = {}
	time = 20
	score = 0
	obj = {{math.random(25, 750), math.random(100, 550), 2}}
	gameState = menu
	g = love.graphics
	g.setDefaultFilter('nearest', 'nearest')
	hudFont =  g.newFont('resources/hud.ttf', 32)
	menuFont = g.newFont('resources/menu.ttf', 64)
	menuFont2 = g.newFont('resources/menu.ttf', 32)
	love.window.setTitle("Test3")
	defstime = 1
	stime = 1
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
	return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function love.draw()
	gameState.draw()
end

function love.update(dt)
	gameState.update(dt)
end

function love.keypressed(key)
	if gameState == menu and key == 'w' then
		if selection > 1 then
			selection = selection - 1
		else
			selection = #options
		end
	end
	if gameState == menu and key == 's' then
		if selection < #options then
			selection = selection + 1
		else
			selection = 1
		end
	end
	if gameState == menu and key == 'return' then
		if selection == 1 then
			gameState = gameplay
		end
		if selection == 2 then
			gameState = leaderboard
		end
		if selection == 3 then
			gameState = help
		end
		if selection == 4 then
			love.event.quit()
		end
	end
	if gameState == endGame and key == 'return' then
		love.filesystem.append('lead.txt', score..'\r\n')
		highscores = {}
		for line in love.filesystem.lines("lead.txt") do
  			table.insert(highscores, tonumber(line))
		end
		table.sort(highscores, function(a, b) return a > b end)
		gameState = menu
		selection = 1
		char = {char.image, 75, 125}
		inv = {}
		defstime = 1
		stime = 1
		time = 20
		score = 0
		obj = {{math.random(25, 725), math.random(100, 525), 2}}
	end
	if gameState == help and key == 'escape' then
		gameState = menu
	end

	if gameState == leaderboard and key == 'escape' then
		gameState = menu
	end
	if gameState == leaderboard and key == 'delete' then
		love.filesystem.remove('lead.txt')
		highscores = {}
	end
end
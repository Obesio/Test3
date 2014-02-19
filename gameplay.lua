gameplay = {}



function gameplay.draw()
	print(inv, 250, 250)
	g.setFont(hudFont)
	g.setColor(27,27,27)
	g.rectangle('fill', 0,0, 800, 600)
	g.setColor(0,0,0)
	g.rectangle('fill', 25, 100, 750, 475)
	g.setColor(255,255,255)
	g.print('Score: ' .. score, 0,0)
	g.print('Time Left: ' .. math.floor(time), 400, 0)
	g.print('Inventory: ', 0, 64)
	for i, v in ipairs(inv) do
		g.print(v, 150 + i*10, 64)
	end
	g.setColor(255,255,255)
	g.rectangle('line', 50, 125, 65, 33)
	g.setColor(255,255,255)
	g.draw(char.image, char[1], char[2])
	for i,v in ipairs(obj) do
		g.setColor(255,255,255)
		g.rectangle('fill', v[1], v[2], 25, 25)
	end
end

function gameplay.update(dt)
	time = time - dt
	stime = stime - dt
	if time < 15 and time > 10 then defstime = .6 end
	if time < 10 and time > 5 then defstime = .4 end
	if time < 5 then defstime = .2 end

	if stime <= 0 then
		local p = {math.random(25, 750), math.random(100, 550), 2}
		table.insert(obj, p)
		stime = defstime
	end
	for i,v in ipairs(obj) do
		v[3] = v[3] - dt
		if v[3] <= 0 then
			table.remove(obj, i)
		end
	end
	if love.keyboard.isDown('w') and char[2] > 100 then
		char[2] = char[2] - 400*dt
	end
	if love.keyboard.isDown('s') and char[2] < 525 then
		char[2] = char[2] + 400*dt
	end
	if love.keyboard.isDown('a') and char[1] > 25 then
		char[1] = char[1] - 400*dt
	end
	if love.keyboard.isDown('d') and char[1] < 725 then
		char[1] = char[1] + 400*dt
	end
	for i,v in ipairs(obj) do
	if CheckCollision(char[1], char[2]+32, 64, 32, v[1], v[2], 25, 25) then
			table.insert(inv, 1)
			table.remove(obj, i)
		end

	end
	if CheckCollision(char[1], char[2]+32, 32,32, 50, 125, 65, 65) then
		score = score + (50*#inv)
		time = time + (.5*#inv)
		inv = {}
	end

	if time <= 0 then
		gameState = endGame
	end
end

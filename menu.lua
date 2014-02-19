menu = {}

function menu.draw()
	g.setFont(menuFont)
	g.setColor(255,255,255)
	g.printf('Welcome to Test3!', 0, 64, 800, 'center')
	for i, option in ipairs(options) do
		g.setFont(menuFont2)
		if i == selection then
			g.setColor(55,55,255)
			g.printf(option, 0, 125+40*i, 800, 'center')
		else
			g.setColor(255,255,255)
			g.printf(option, 0, 125+40*i, 800, 'center')
		end
	end
end

function menu.update(dt)
end
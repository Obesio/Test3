endGame = {}

function endGame.draw()
g.setFont(menuFont2)
g.print('Congratulations, you scored ' .. score .. ' points!', 25, 25)
g.print('Press Enter to return to the main menu!', 25, 100)


end

function endGame.update(dt)
end
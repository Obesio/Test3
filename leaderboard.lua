leaderboard = {}

function leaderboard.draw()
	for i = 1,10 do
		if highscores[i] then
			g.print(i .. ' - ' .. highscores[i], 25, 25+40*i)
		else
			g.print('No Highscore', 25, 25+40*i)
		end
	end

	g.print('Press Delete to clear your leaderboard!', 150, 25)
end
function leaderboard.update(dt)
	end

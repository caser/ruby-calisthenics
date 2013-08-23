=begin
In a game of rock-paper-scissors, each player chooses to play Rock (R), 
Paper (P), or Scissors (S).  The rules are: Rock beats Scissors, 
Scissors beats Paper, but Paper beats Rock.
A rock-paper-scissors game is encoded as a list, where the elements 
are 2-element lists that encode a player’s name and a player’s strategy.
[ [ "Armando", "P" ], [ "Dave", "S" ] ] 
=> returns the list ["Dave", "S"] wins since S>P

(a)  Write a method rps_game_winner that takes a two-element list and behaves as follows:
- If the number of players is not equal to 2, raise WrongNumberOfPlayersError
- If either player's strategy is something other than 
"R", "P" or "S" (case-insensitive), raise NoSuchStrategyError
- Otherwise, return the name and strategy of the winning player.  
If both players use the same strategy, the first player is the winner.

=end

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	viable_strategies = ["r", "p", "s"]
	strat = [game[0][1].downcase, game[1][1].downcase]
	if !(viable_strategies.include?(strat[0])) or !(viable_strategies.include?(strat[1]))
		raise NoSuchStrategyError
	else
		if strat.include?("r") && strat.include?("s")
			winner = strat.index("r")
		elsif strat.include?("p") && strat.include?("r")
			winner = strat.index("p")
		elsif strat.include?("s") && strat.include?("p")
			winner = strat.index("s")
		else
			winner = 0
		end	
		# puts "#{game[winner][0]} won the game with the #{game[winner][1]} strategy"	
		return [game[winner][0], game[winner][1]]
	end
end

# Test tps_game_winner
=begin
game1 = [ [ "Armando", "P" ], [ "Dave", "S" ] ]  # => Dave
game2 = [ [ "Armando", "p" ], [ "Dave", "P" ] ]  # => tie, so first player, Armando, wins

rps_game_winner(game1)
rps_game_winner(game2)
=end

def rps_tournament_winner(tournament)
	if !(tournament[0][0].is_a?(String))
		player1 = rps_tournament_winner(tournament[0])
		player2 = rps_tournament_winner(tournament[1])
		game = [player1, player2]
		winner = rps_game_winner(game)
	else
		winner = rps_game_winner(tournament)
	end
	# puts "#{winner} won the tournament!"
	return winner
end


tournament =
[
	[
		[ ["Armando", "P"], ["Dave", "S"] ],
		[ ["Richard", "R"],  ["Michael", "S"] ],
 	],
	[ 
   		[ ["Allen", "S"], ["Omer", "P"] ],
   		[ ["David E.", "R"], ["Richard X.", "P"] ]
 	]
]

winner = rps_tournament_winner(tournament)
puts winner

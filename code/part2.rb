class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(s1, s2)
    results = { ['r','r']=>1,
                ['r','p']=>2,
                ['r','s']=>1,
                ['p','r']=>1,
                ['p','p']=>1,
                ['p','s']=>2,
                ['s','r']=>2,
                ['s','p']=>1,
                ['s','s']=>1,
    }
    results[[s1,s2]]
end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length ==2
    s1,s2=game[0][1],game[1][1]
    s1.downcase!
    s2.downcase!
    raise NoSuchStrategyError unless (s1 =~/^[rps]$/ and s2 =~ /^[rps]$/)
    if rps_result(s1,s2) == 1 then return game[0]
    else
        return game[1]
    end
end

def rps_tournament_winner(tournament)
     if tournament[0][0].class == 'a'.class
        rps_game_winner tournament 
     else
        rps_game_winner [(rps_tournament_winner tournament[0]),(rps_tournament_winner tournament[1])]
    end
end

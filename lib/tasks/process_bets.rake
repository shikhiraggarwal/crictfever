desc "Distribute points after match finished"
task process_bets: :environment do
  game = Game.where.not(winner: nil).where(finished: false).first
  if !game.nil?
    if game.team1 == game.winner
      multiplier = winteam1
    elsif game.team2 == game.winner
      multiplier = winteam2
    else
      multiplier = 1.0
    end
    Bets = Bet.where(game: game.id)
    Bets.each do |bet|
      points = bet.points
      player = Player.find(bet.player)
      team = bet.team
      if team == game.winner || game.winner == 0
        player.points = (player.points + (points * multiplier)).to_i
        player.save
      end
      bet.processed = true
      bet.save
    end
    game.finished = true
    game.save
    puts "Bets processed for #{game.id}"
  end
end


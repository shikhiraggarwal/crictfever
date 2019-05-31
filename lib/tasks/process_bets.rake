desc "Distribute points after match finished"
task process_bets: :environment do
  game = Game.where.not(winner: nil).where(finished: false).first
  if !game.nil?
    Bets = Bet.where(game: game.id)
    Bets.each do |bet|
      points = bet.points
      player = Player.find(bet.player)
      team = bet.team
      if team == game.winner
        player.points = (player.points + (points * 1.5)).to_i
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

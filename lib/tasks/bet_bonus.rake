desc "Bonus points for all players who have bet on current match"
task bet_bonus_points: :environment do
  current_games = Game.currentgames
  bonused = JSON.parse($redis.get("games:bonus:processed"))
  current_games.each do |game|
    if !bonused.include?(game.id)
      bonused << game.id
      Bets = Bet.where(game: 2)
      player_ids = Bets.group(:player).count.keys
      player_ids.each do |id|
        player = Player.find(id)
        player.points = player.points + 500
        player.save
      end
    end
  end
  
  $redis.set("games:bonus:processed", bonused.to_s)
  puts "Bonus distributed for #{bonused.to_s}"
end

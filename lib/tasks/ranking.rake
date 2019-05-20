desc "Edit redis cache to update all players rankings"
task rank_update: :environment do
  players = Player.order(points: :desc, updated_at: :desc)
  cachedata = []
  count = 0
  players.each do |player|
    id = player.id
    points = player.points
    rank = count + 1
    name = player.name
    name = name.strip unless name.nil?
    if name.nil? || name == ""
      next
    end
    cachedata[count] = {"id" => id, "points" => points, "rank" => rank, "name" => name}
    count += 1
  end
  data = cachedata.to_json
  $redis.del("players:rankings")
  $redis.set("players:rankings", data)
  puts "Cache Updated"
end

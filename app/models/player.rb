# +------------+--------------+------+-----+---------+----------------+
# | Field      | Type         | Null | Key | Default | Extra          |
# +------------+--------------+------+-----+---------+----------------+
# | id         | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | name       | varchar(255) | YES  | MUL | NULL    |                |
# | email      | varchar(255) | YES  | MUL | NULL    |                |
# | phone      | varchar(255) | YES  | MUL | NULL    |                |
# | points     | int(11)      | YES  | MUL | NULL    |                |
# | pincode    | varchar(255) | YES  | MUL | NULL    |                |
# | password   | varchar(255) | YES  |     | NULL    |                |
# | data       | blob         | YES  |     | NULL    |                |
# | created_at | datetime     | NO   |     | NULL    |                |
# | updated_at | datetime     | NO   |     | NULL    |                |
# | device     | varchar(255) | YES  | MUL | NULL    |                |
# | share_code | varchar(255) | YES  |     | NULL    |                |
# +------------+--------------+------+-----+---------+----------------+

class Player < ApplicationRecord
  has_many :bet
  nilify_blanks
#  before_save :setemailnull, if: self.email == ""
  def get_player_rank
    if self.data.nil? || self.data.empty?
      data = {}
    else
      data = JSON.parse(self.data)
    end
    if data["last_updated"].nil? || data["last_updated"] < Time.now
      user_id = self.id
      rankings = Player.get_rankings
      player_rank = 0
      rankings.each do |rank|
        if !rank.nil?
          if user_id == rank["id"]
            player_rank = rank["rank"]
            break;
          end
        end
      end
      player_page = (player_rank.to_f/20).ceil
      data["rank"] = player_rank.to_s
      data["page"] = player_page.to_s
      data["rankings"] = rankings
      data["last_updated"] = (Time.now + 2.minutes).to_s
      self.data = data.to_json
      self.save
    end
  end

  def self.get_rankings
    JSON.parse($redis.get("players:rankings"))
  end

#  def setemailnull
#    self.email = nil
#  end
end

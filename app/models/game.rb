require 'date'

class Game < ApplicationRecord
  has_many :bet
  @last_match = "2019-07-15 12:00:00 +0530".to_time

  def self.nextgames
    now = Time.now
    tomorrow = Time.now + 86400
    games = Game.where(matchtime: now..tomorrow).sort_by(&:matchtime)
    return games
  end

  def teamsinfo
    game = self
    team1_id = game.team1.to_i
    team2_id = game.team2.to_i
    teams = Team.find([team1_id, team2_id])
    return teams
  end

  def canbet
    game = self
    matchtime = game.matchtime - 1800
    now = Time.now
    start_time = game.matchtime - 86400
    if now < matchtime && now > start_time
      return true
    else
      return false
    end
  end

  def self.nextbettablegames
    nextgames = Game.nextgames
    bettable_games = []
    nextgames.each do |game|
      if game.canbet
        bettable_games << game
      end
    end
    return bettable_games
  end

  def self.currentgames
    yesterday = Time.now - 36000
    now = Time.now
    games = Game.where(matchtime: yesterday..now).sort_by(&:matchtime)
    current_games = []
    games.each do |game|
      if game.finished == 0 || game.finished.nil?
        current_games << game
      end
    end
    return current_games
  end
  
end

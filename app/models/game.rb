require 'date'

class Game < ApplicationRecord
  has_many :bet
  @last_match = "2019-07-15 12:00:00 +0530".to_time

  def self.nextgame
    now = Time.now
    game = Game.where(matchtime: now..@last_match).sort_by(&:matchtime).first
    return game
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

  def self.nextbettablegame
    nextgame = Game.nextgame
    if nextgame.canbet
      return nextgame
    else
      return nil
    end
  end

  def self.currentgame
    time = Time.now - 86400
    game = Game.where(matchtime: now..@last_match).sort_by(&:matchtime).first
    if game.finished == 0
      return game
    else
      return nil
    end
  end
  
end

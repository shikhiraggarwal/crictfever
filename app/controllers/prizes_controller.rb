class PrizesController < ApplicationController
caches_action :index

caches_action :get_bettable_game, expires_in: 3.hour
caches_action :get_current_game

  def index
    prizes = Reward.where(:game => 'wc')
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: prizes }
    end
  end
  def adreward
    id = params[:id]
    player = Player.find(id)
    if !player.nil?
      player.points = player.points + 25;
      player.save
      message = "rewarded"
    else
      message = "failed"
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: {"message" => message} }
    end
  end

  def get_current_game
    currentgames = Game.currentgames
    gameteams = {}
    currentgames.each do |game|
      teams = game.teamsinfo
      gameteams["#{game.team1}"] = teams[0]
      gameteams["#{game.team2}"] = teams[1]
    end
    respond_to do |format|
      format.html
      format.json { render json: {"game" => currentgames, "teams" => gameteams, "bettable" => false}}
    end
  end

  def get_bettable_game
    games = Game.nextbettablegames
    gameteams = {}
    games.each do |game|
      teams = game.teamsinfo
      gameteams["#{game.team1}"] = teams[0]
      gameteams["#{game.team2}"] = teams[1]
    end
    respond_to do |format|
      format.html
      format.json { render json: {"game" => games, "teams" => gameteams, "bettable" => true}}
    end
  end

end

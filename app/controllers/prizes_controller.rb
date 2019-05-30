class PrizesController < ApplicationController
caches_action :index
caches_action :get_bettable_game, expires_in: 3.hour
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

  def get_bettable_game
    game = Game.nextbettablegame
    if game.nil?
      game = Game.nextgame
      bettable = false
    else
      bettable = true
    end
    teams = game.teamsinfo
    respond_to do |format|
      format.html
      format.json { render json: {"game" => game, "teams" => teams, "bettable" => bettable}}
    end
  end

end

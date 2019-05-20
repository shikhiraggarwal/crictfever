class PrizesController < ApplicationController
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
end

class RanksController < ApplicationController
  def index
  	player_id = params[:id].to_i
  	player = (player_id == 0) ? nil : Player.find(player_id)
  	if player.nil?
  	  @rankings = Player.get_rankings
      @rank = 0
      @page = 1
      @points = 0
    else
      player.get_player_rank
      data = JSON.parse(player.data)
      @rankings = Player.get_rankings
      @rank = data["rank"]
      @page = data["page"]
      @points = player.points
  	end
    response = {"rankings" => @rankings, "rank" => @rank, "page" => @page, "points" => @points}
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: response }
    end
  end
end

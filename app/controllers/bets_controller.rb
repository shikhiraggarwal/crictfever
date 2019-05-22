class BetsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:place]
  def index
    id = params[:id].to_i
    if !id.nil?
      bets = Bet.where(:player => id, :processed => false)
    else
      bets = {"error" => "No bets found"}
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: bets }
    end
  end

  def place
    id = params[:id].to_i
    points = params[:points].to_i
    match_id = params[:match_id].to_i
    team_id = params[:team_id].to_i
    player = Player.find(id)
    if points.nil? || points == 0
      response = {"message" => "Enter bet amount"}
    else
      if player.nil? || points > player.points
        response = {"message" => "Insufficient points. Bet not placed"}
      else
        match = Game.find(match_id)
        if match.nil? || !match.canbet
          response = {"message" => "Game not open for betting yet. Bet not placed"}
        else
          if team_id != match.team1 && team_id != match.team2
            response = {"message" => "Team not playing in this match. Bet not placed"}
          else
            player.points = player.points - points
            bet = Bet.new
            bet.player = id
            bet.game = match_id
            bet.team = team_id
            bet.points = points
            bet.processed = false
            begin
              bet.save
              player.save
              response = {"message" => "Bet successfully placed"}
            rescue
              response = {"message" => "Error encountered. Bet not placed"}
            end

          end
        end
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: response }
    end
  end

end

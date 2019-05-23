class PlayersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:update]
  include PlayersHelper
  def profile
    device = params[:device]
    player = Player.where(:device => device).first
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: player }
    end
  end

  def new
    device = params[:device_id]
    players = Player.where(:device => device)
    if !players.empty?
      player = players.first
    elsif players.empty? && !device.nil?
      player = Player.new()
      player.device = device
      player.points = 500
      player.share_code = shareKey()
      player.data = "{}"
      player.save
    else
      player = nil
    end
    has_update = false
    if has_update
      tempplayer = player.to_json
      tempplayer = JSON.parse(tempplayer)
      tempplayer["update"] = "true"
      player = tempplayer
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: player }
    end
  end

  def edit
  end

  def update
    id = params[:id]
    share_code = params[:share]
    player = Player.find(id)
    player.name = params[:name]
    player.email = params[:email] if params[:email] != ''
    player.phone = params[:phone] if params[:phone] != ''
    player.pincode = params[:pincode]
    data = JSON.parse(player.data)
    data["address"] = params[:address]
    data["street"] = params[:street]
    data["state"] = params[:state]
    data["city"] = params[:city]
    begin
      if !share_code.nil? && !share_code.empty? && share_code != player.share_code && (data["share"].nil? || data["share"].empty?) && data["share"] != share_code
        super_player = Player.where(:share_code => share_code).first
        if !super_player.nil?
          player.points = player.points + 100
          super_player.points = super_player.points + 200
          super_player.save
          data["share"] = share_code
        else
          raise "Error in share code"
        end
      end
      player.data = data.to_json
      player.save
    rescue => e
      error_message = e.message
      p error_message
      if error_message.include? "Duplicate"
        player = {"error" => "Email or mobile number already used"}
      elsif error_message.include? "share"
        player = {"error" => "Error in share code"}
      else
        player = {"error" => "Some error in saving information"}
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: player }
    end
  end
end

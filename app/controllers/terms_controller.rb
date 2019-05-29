class TermsController < ApplicationController
caches_action :index
  def index
    terms = Term.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: terms }
    end
  end

  def fixtures
    games = Game.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: games }
    end
  end

  def teams
    teams = Team.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: teams }
    end
  end

  def standings
    teams = Team.order("rank asc")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: teams }
    end
  end

end

class TermsController < ApplicationController
  def index
    terms = Term.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: terms }
    end
  end
end

class RulingsController < ApplicationController
  def index
    @ruling = Ruling.all
  end

  def show
    @ruling = Ruling.find(params[:id])
  end
end

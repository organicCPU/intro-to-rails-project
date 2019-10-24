class RulingsController < ApplicationController
  def index
    @ruling = Ruling.page(params[:page])
  end

  def show
    @ruling = Ruling.find(params[:id])
  end
end

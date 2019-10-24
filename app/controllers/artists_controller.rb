class ArtistsController < ApplicationController
  def index
    @artist = Artist.page(params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
  end
end

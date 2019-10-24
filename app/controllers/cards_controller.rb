# frozen_string_literal: true

class CardsController < ApplicationController
  def index
    @card = Card.page(params[:page])
  end

  def show
    @card = Card.find(params[:id])
  end
end

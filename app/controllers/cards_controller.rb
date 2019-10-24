# frozen_string_literal: true

class CardsController < ApplicationController
  def index
    @card = Card.page(params[:page])
  end

  def show
    @card = Card.find(params[:id])
  end

  # GET /cards/search
  def search
    @query = params[:query]
    @all_cards = Card.where('name LIKE ?', "%#{@query}%")
    @card = @all_cards.page(params[:page])
  end
end

# frozen_string_literal: true

class ColorsController < ApplicationController
  def index
    @color = Color.all
  end

  def show
    @color = Color.find(params[:id])
  end
end

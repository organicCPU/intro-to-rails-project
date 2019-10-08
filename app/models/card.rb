# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :artist
  has_many :color
  has_many :card_rulings
  has_many :ruling, through: :card_rulings
end

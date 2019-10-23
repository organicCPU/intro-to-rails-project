# frozen_string_literal: true

class Ruling < ApplicationRecord
  has_many :card_rulings
  has_many :cards, through: :card_rulings

  validates :description, presence: true
  validates :description, uniqueness: true
end

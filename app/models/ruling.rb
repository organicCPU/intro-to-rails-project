# frozen_string_literal: true

class Ruling < ApplicationRecord
  has_many :card_rulings
  has_many :cards, through: :card_rulings

  validates :title, :description, presence: true
  validates :title, :description, uniqueness: true
end

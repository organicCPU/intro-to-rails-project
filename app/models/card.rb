# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :artist
  belongs_to :color, optional: true

  has_many :card_rulings
  has_many :rulings, through: :card_rulings

  validates :name, :display_type, :power, :toughness, :rarity, presence: true
  validates :name, uniqueness: true
end

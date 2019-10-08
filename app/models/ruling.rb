class Ruling < ApplicationRecord
  has_many :card_rulings
  has_many :cards, through: :card_rulings
end

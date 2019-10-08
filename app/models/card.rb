class Card < ApplicationRecord
  belongs_to :artist
  belongs_to :color
  belongs_to :ruling
end

# frozen_string_literal: true

class Card < ApplicationRecord
  has_many :artist
  has_many :color
  has_many :ruling
end

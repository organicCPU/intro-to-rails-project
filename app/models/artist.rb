# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :cards

  validates :name, uniqueness: true
end

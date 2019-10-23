# frozen_string_literal: true

class Color < ApplicationRecord
  has_many :cards

  validates :name, uniqueness: true
end

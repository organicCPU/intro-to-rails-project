# frozen_string_literal: true

class Color < ApplicationRecord
  belongs_to :cards, optional: true
end

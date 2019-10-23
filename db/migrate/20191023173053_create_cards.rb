# frozen_string_literal: true

class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :artist, null: false, foreign_key: true
      t.text :flavor_text
      t.text :mana_cost
      t.references :color, null: true, foreign_key: true
      t.integer :converted_mana_cost
      t.string :name
      t.text :effect
      t.string :display_type
      t.integer :power
      t.integer :toughness
      t.string :rarity

      t.timestamps
    end
  end
end

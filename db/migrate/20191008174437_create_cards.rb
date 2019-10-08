class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true
      t.string :cost
      t.numeric :convertedCost
      t.string :name
      t.text :effect
      t.string :displayType
      t.numeric :power
      t.numeric :toughness
      t.string :rarity
      t.text :flavorText

      t.timestamps
    end
  end
end

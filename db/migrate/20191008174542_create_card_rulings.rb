class CreateCardRulings < ActiveRecord::Migration[6.0]
  def change
    create_table :card_rulings do |t|
      t.references :card, null: false, foreign_key: true
      t.references :ruling, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateRulings < ActiveRecord::Migration[6.0]
  def change
    create_table :rulings do |t|
      t.text :description

      t.timestamps
    end
  end
end

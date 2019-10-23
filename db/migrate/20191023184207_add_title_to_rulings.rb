class AddTitleToRulings < ActiveRecord::Migration[6.0]
  def change
    add_column :rulings, :title, :string
  end
end

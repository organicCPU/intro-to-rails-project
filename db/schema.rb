# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_23_173440) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "card_rulings", force: :cascade do |t|
    t.integer "card_id", null: false
    t.integer "ruling_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_rulings_on_card_id"
    t.index ["ruling_id"], name: "index_card_rulings_on_ruling_id"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.text "flavor_text"
    t.text "mana_cost"
    t.integer "color_id"
    t.integer "converted_mana_cost"
    t.string "name"
    t.text "effect"
    t.string "display_type"
    t.integer "power"
    t.integer "toughness"
    t.string "rarity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_cards_on_artist_id"
    t.index ["color_id"], name: "index_cards_on_color_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rulings", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "card_rulings", "cards"
  add_foreign_key "card_rulings", "rulings"
  add_foreign_key "cards", "artists"
  add_foreign_key "cards", "colors"
end

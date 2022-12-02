# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_02_200934) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "CEP", null: false
    t.string "street", null: false
    t.string "complement"
    t.string "district", null: false
    t.string "city", null: false
    t.string "UF", null: false
    t.string "IBGE"
    t.bigint "town_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["town_id"], name: "index_addresses_on_town_id"
  end

  create_table "citizens", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "CPF", null: false
    t.string "CNS", null: false
    t.string "email", null: false
    t.date "birth_date", null: false
    t.string "phone", null: false
    t.bigint "town_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["town_id"], name: "index_citizens_on_town_id"
  end

  create_table "towns", force: :cascade do |t|
    t.boolean "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "towns"
  add_foreign_key "citizens", "towns"
end

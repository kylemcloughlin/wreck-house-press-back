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

ActiveRecord::Schema.define(version: 2021_02_25_153017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "subtitles"
    t.string "author"
    t.string "photos", default: [], array: true
    t.string "body"
    t.string "legacy"
    t.string "originalPost"
    t.bigint "categorization_id", null: false
    t.bigint "subcategorization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categorization_id"], name: "index_articles_on_categorization_id"
    t.index ["subcategorization_id"], name: "index_articles_on_subcategorization_id"
  end

  create_table "categorizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subcategorizations", force: :cascade do |t|
    t.string "name"
    t.bigint "categorization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categorization_id"], name: "index_subcategorizations_on_categorization_id"
  end

  add_foreign_key "articles", "categorizations"
  add_foreign_key "articles", "subcategorizations"
  add_foreign_key "subcategorizations", "categorizations"
end

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

ActiveRecord::Schema.define(version: 2021_03_16_163452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "subtitles"
    t.string "author"
    t.string "photos", default: [], array: true
    t.string "body", default: [], array: true
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

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "subcategorizations", force: :cascade do |t|
    t.string "name"
    t.bigint "categorization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categorization_id"], name: "index_subcategorizations_on_categorization_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name"
    t.string "period"
    t.string "dis"
    t.string "validUntil"
    t.string "includes"
    t.string "foot"
    t.integer "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "articles", "categorizations"
  add_foreign_key "articles", "subcategorizations"
  add_foreign_key "subcategorizations", "categorizations"
end

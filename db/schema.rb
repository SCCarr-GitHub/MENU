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

ActiveRecord::Schema[7.0].define(version: 2023_09_25_141648) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "address"
    t.string "phone_number"
    t.string "name"
    t.string "surname"
    t.string "area"
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_customers_on_users_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "category"
    t.string "item_name"
    t.integer "item_price"
    t.bigint "restaurant_menus_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_menus_id"], name: "index_items_on_restaurant_menus_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "item_upvote"
    t.bigint "customers_id", null: false
    t.bigint "items_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customers_id"], name: "index_ratings_on_customers_id"
    t.index ["items_id"], name: "index_ratings_on_items_id"
  end

  create_table "restaurant_menus", force: :cascade do |t|
    t.string "description"
    t.bigint "restaurants_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurants_id"], name: "index_restaurant_menus_on_restaurants_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "address"
    t.string "phone_number"
    t.string "name"
    t.string "category"
    t.time "operating_hours"
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_restaurants_on_users_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.bigint "restaurants_id", null: false
    t.bigint "customers_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customers_id"], name: "index_reviews_on_customers_id"
    t.index ["restaurants_id"], name: "index_reviews_on_restaurants_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "restaurant"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "users", column: "users_id"
  add_foreign_key "items", "restaurant_menus", column: "restaurant_menus_id"
  add_foreign_key "ratings", "customers", column: "customers_id"
  add_foreign_key "ratings", "items", column: "items_id"
  add_foreign_key "restaurant_menus", "restaurants", column: "restaurants_id"
  add_foreign_key "restaurants", "users", column: "users_id"
  add_foreign_key "reviews", "customers", column: "customers_id"
  add_foreign_key "reviews", "restaurants", column: "restaurants_id"
end

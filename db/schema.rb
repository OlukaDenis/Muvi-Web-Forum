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

ActiveRecord::Schema.define(version: 2020_01_09_122837) do

  create_table "answers", force: :cascade do |t|
    t.string "answerer"
    t.text "body"
    t.integer "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "address"
  end

  create_table "customers_products", id: false, force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "product_id", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "part_number"
    t.integer "user_id"
    t.decimal "price", precision: 5, scale: 2
    t.string "supplier_type"
    t.integer "supplier_id"
    t.index ["part_number"], name: "index_products_on_part_number"
    t.index ["supplier_type", "supplier_id"], name: "index_products_on_supplier_type_and_supplier_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "products", "users"
end

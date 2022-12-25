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

ActiveRecord::Schema[7.0].define(version: 2022_12_25_031506) do
  create_table "apples", force: :cascade do |t|
    t.string "variety"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "articles_products", id: false, force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "product_id", null: false
    t.index ["article_id", "product_id"], name: "index_articles_products_on_article_id_and_product_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name", limit: 255
    t.string "part_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_available", null: false
    t.decimal "price", precision: 5, scale: 2
    t.index ["part_number"], name: "index_products_on_part_number"
  end

  add_foreign_key "comments", "articles"
end

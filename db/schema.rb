# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150110230341) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "affiliate_programs", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "brands", ["name"], name: "index_brands_on_name"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  add_index "categories_products", ["product_id"], name: "index_categories_products_on_product_id"

  create_table "exchange_rates", force: :cascade do |t|
    t.string   "from_currency"
    t.string   "to_currency"
    t.float    "rate"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "exchange_rates", ["from_currency", "to_currency"], name: "index_exchange_rates_on_from_currency_and_to_currency"
  add_index "exchange_rates", ["from_currency"], name: "index_exchange_rates_on_from_currency"
  add_index "exchange_rates", ["to_currency"], name: "index_exchange_rates_on_to_currency"

  create_table "merchants", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "merchant_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.text     "notes"
    t.boolean  "active",                          default: true
    t.string   "merchant_id"
    t.integer  "affiliate_program_id"
    t.string   "brand_id"
    t.string   "aw_product_id"
    t.text     "aw_deep_link"
    t.text     "aw_image_url"
    t.text     "aw_thumb_url"
    t.text     "merchant_product_id"
    t.text     "merchant_category"
    t.text     "merchant_deep_link"
    t.text     "merchant_image_url"
    t.string   "product_name"
    t.text     "description"
    t.integer  "parent_product_id"
    t.string   "brand_name"
    t.string   "model_number"
    t.text     "colour"
    t.string   "condition"
    t.text     "keywords"
    t.text     "product_type"
    t.text     "promotional_text"
    t.text     "specifications"
    t.string   "currency",              limit: 3
    t.float    "search_price"
    t.string   "display_price"
    t.float    "rrp_price"
    t.text     "saving"
    t.float    "store_price"
    t.float    "delivery_cost"
    t.text     "delivery_restrictions"
    t.string   "delivery_time"
    t.boolean  "in_stock"
    t.boolean  "is_for_sale"
    t.boolean  "pre_order"
    t.date     "valid_from"
    t.date     "valid_to"
    t.boolean  "web_offer"
    t.text     "average_rating"
    t.text     "reviews"
    t.text     "rating"
    t.datetime "last_updated"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "products", ["affiliate_program_id"], name: "index_products_on_affiliate_program_id"
  add_index "products", ["brand_id"], name: "index_products_on_brand_id"
  add_index "products", ["merchant_id"], name: "index_products_on_merchant_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

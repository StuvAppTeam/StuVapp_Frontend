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

ActiveRecord::Schema.define(version: 20150611122109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "telephone"
    t.string   "email"
    t.string   "contactName"
    t.string   "activity_type"
    t.string   "weekday"
    t.string   "street"
    t.string   "zipcode"
    t.string   "city"
    t.string   "locationName"
    t.string   "locationDescription"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "apartments", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.float    "totalPrize"
    t.string   "street"
    t.string   "city"
    t.string   "zipcode"
    t.integer  "user_id"
    t.float    "size"
    t.float    "rent"
    t.float    "additionalCost"
    t.string   "phase"
    t.float    "deposit"
    t.string   "apartment_type"
    t.datetime "movein"
    t.boolean  "furnished"
    t.boolean  "internet"
    t.string   "parking"
    t.integer  "rooms"
    t.boolean  "smoking"
    t.boolean  "request"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "phone"
  end

  create_table "campus", force: :cascade do |t|
    t.string   "street"
    t.string   "zipcode"
    t.string   "city"
    t.string   "name"
    t.string   "description"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "image_id"
  end

  create_table "dhbw_news", force: :cascade do |t|
    t.string   "feedId"
    t.string   "message"
    t.string   "picture"
    t.string   "link"
    t.datetime "feedDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "stuv"
  end

  create_table "images", force: :cascade do |t|
    t.string   "title"
    t.integer  "offer_blackboard_id"
    t.integer  "campu_id"
    t.string   "photo"
    t.integer  "apartment_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "category_id"
  end

  create_table "mensas", force: :cascade do |t|
    t.string   "timestamp"
    t.string   "category"
    t.string   "title"
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offer_blackboards", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.float    "totalPrice"
    t.integer  "image_id"
    t.string   "street"
    t.string   "city"
    t.integer  "zipcode"
    t.integer  "user_id"
    t.integer  "category_id"
    t.boolean  "condition"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "request"
    t.string   "phone"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "lastName"
    t.string   "firstName"
    t.string   "phone"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "newsletter",             default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

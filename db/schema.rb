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

ActiveRecord::Schema.define(version: 20180323220203) do

  create_table "accounts", force: :cascade do |t|
    t.text     "notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "account_number"
    t.string   "phone"
    t.string   "email"
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "address_type"
    t.string   "care_of"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.integer  "account_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["account_id", "address_type"], name: "index_addresses_on_account_id_and_address_type", unique: true
    t.index ["account_id"], name: "index_addresses_on_account_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.text     "notes"
    t.decimal  "late_fee",     precision: 6, scale: 2
    t.integer  "account_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "status"
    t.date     "invoice_date"
    t.index ["account_id"], name: "index_invoices_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "last_logged_in"
    t.datetime "archived_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end

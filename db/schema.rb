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

ActiveRecord::Schema.define(version: 20140525172836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "addresses", force: true do |t|
    t.string   "line_1"
    t.string   "line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "address_id"
  end

  add_index "contacts", ["address_id"], name: "index_contacts_on_address_id", using: :btree

  create_table "pg_search_documents", force: true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_numbers", force: true do |t|
    t.string   "number"
    t.boolean  "primary",    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_id",                 null: false
  end

  add_index "phone_numbers", ["contact_id"], name: "index_phone_numbers_on_contact_id", using: :btree

  add_foreign_key "contacts", "addresses", name: "contacts_address_id_fk"

  add_foreign_key "phone_numbers", "contacts", name: "phone_numbers_contact_id_fk", dependent: :delete

end

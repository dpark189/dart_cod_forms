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

ActiveRecord::Schema.define(version: 20181105224639) do

  # These are extensions that must be enabled in order to support this database

  create_table "dartaccounts", force: :cascade do |t|
    t.date "ship_date", null: false
    t.string "invoice_number"
    t.string "route_number", null: false
    t.string "customer_id", null: false
    t.string "customer", null: false
    t.float "amount_owed"
    t.float "extra"
    t.float "amount_received"
    t.float "amount_credit"
    t.string "received_as_check_or_cash"
    t.string "logistics_agent_initials"
    t.string "reason_code"
    t.string "reason_detail"
    t.float "credit"
    t.boolean "accounting_completed"
    t.string "location", null: false
    t.boolean "logistics_completed"
    t.datetime "logistics_completed_date"
    t.datetime "accounting_completed_date"
  end

  create_table "cod_users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end

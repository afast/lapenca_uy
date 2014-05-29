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

ActiveRecord::Schema.define(version: 20140528033532) do

  create_table "arenas", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forecasts", force: true do |t|
    t.integer  "match_id"
    t.integer  "team1_score"
    t.integer  "team2_score"
    t.integer  "winner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
  end

  create_table "matches", force: true do |t|
    t.datetime "date"
    t.integer  "team1_id"
    t.string   "team1_description"
    t.integer  "team1_score"
    t.integer  "team2_id"
    t.string   "team2_description"
    t.integer  "team2_score"
    t.integer  "winner_id"
    t.integer  "arena_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group"
  end

  create_table "member_groups", force: true do |t|
    t.string   "group_name"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_subscriptions", force: true do |t|
    t.integer  "member_id"
    t.integer  "member_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "member_subscriptions", ["member_group_id", "member_id"], name: "index_member_subscriptions_on_member_group_id_and_member_id"
  add_index "member_subscriptions", ["member_group_id"], name: "index_member_subscriptions_on_member_group_id"
  add_index "member_subscriptions", ["member_id"], name: "index_member_subscriptions_on_member_id"

  create_table "members", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points"
    t.boolean  "is_admin",               default: false
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "coach"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group"
  end

end

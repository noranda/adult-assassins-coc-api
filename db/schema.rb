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

ActiveRecord::Schema.define(version: 20150221150151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clans", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tag"
  end

  add_index "clans", ["name"], name: "index_clans_on_name", using: :btree
  add_index "clans", ["tag"], name: "index_clans_on_tag", unique: true, using: :btree

  create_table "user_sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "token",       null: false
    t.datetime "accessed_at", null: false
    t.datetime "revoked_at"
    t.string   "ip"
    t.string   "user_agent"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_sessions", ["accessed_at"], name: "index_user_sessions_on_accessed_at", using: :btree
  add_index "user_sessions", ["revoked_at"], name: "index_user_sessions_on_revoked_at", using: :btree
  add_index "user_sessions", ["token"], name: "index_user_sessions_on_token", unique: true, using: :btree
  add_index "user_sessions", ["user_id"], name: "index_user_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "wars", force: :cascade do |t|
    t.datetime "start_date"
    t.integer  "opposing_clan_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "war_size"
  end

  add_index "wars", ["start_date"], name: "index_wars_on_start_date", using: :btree

  add_foreign_key "user_sessions", "users"
  add_foreign_key "wars", "clans", column: "opposing_clan_id"
end

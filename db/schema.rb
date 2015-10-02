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

ActiveRecord::Schema.define(version: 20151002101010) do

  create_table "game_apis", force: :cascade do |t|
    t.integer  "game_id",    limit: 4
    t.text     "end_point",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "name",       limit: 65535
  end

  create_table "games", force: :cascade do |t|
    t.string   "base_url",   limit: 255
    t.text     "name",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "parameters", force: :cascade do |t|
    t.text     "name",        limit: 65535
    t.text     "param",       limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "game_api_id", limit: 4
  end

  create_table "results", force: :cascade do |t|
    t.integer  "parameter_id", limit: 4
    t.string   "send_param",   limit: 255
    t.string   "response",     limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",      limit: 4
    t.integer  "game_id",      limit: 4
    t.integer  "game_api_id",  limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.text     "name",         limit: 65535
    t.text     "profile_text", limit: 65535
    t.text     "token",        limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end

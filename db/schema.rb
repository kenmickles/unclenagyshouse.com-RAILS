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

ActiveRecord::Schema.define(version: 20131012205856) do

  create_table "credits", force: true do |t|
    t.integer  "episode_id",                        null: false
    t.string   "role",                              null: false
    t.string   "category",   limit: 24,             null: false
    t.integer  "weight",                default: 0, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "credits", ["episode_id"], name: "index_credits_on_episode_id", using: :btree

  create_table "credits_players", id: false, force: true do |t|
    t.integer "credit_id"
    t.integer "player_id"
  end

  add_index "credits_players", ["credit_id", "player_id"], name: "index_credits_players_on_credit_id_and_player_id", unique: true, using: :btree
  add_index "credits_players", ["credit_id"], name: "index_credits_players_on_credit_id", using: :btree

  create_table "episodes", force: true do |t|
    t.string   "number",     limit: 24
    t.string   "title",                 null: false
    t.date     "date"
    t.string   "synopsis"
    t.integer  "vimeo_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "file_name"
  end

  create_table "players", force: true do |t|
    t.string   "name",        null: false
    t.string   "facebook_id"
    t.string   "link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end

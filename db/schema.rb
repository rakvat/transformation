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

ActiveRecord::Schema.define(version: 20130802215252) do

  create_table "moves", force: true do |t|
    t.string   "code"
    t.string   "description"
    t.integer  "spread"
    t.integer  "establ"
    t.integer  "build"
    t.integer  "happy"
    t.integer  "time"
    t.integer  "transformers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "moves", ["code"], name: "index_moves_on_code", unique: true

  create_table "states", force: true do |t|
    t.integer  "spread"
    t.integer  "establ"
    t.integer  "build"
    t.integer  "happy"
    t.integer  "time"
    t.integer  "transformers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: true do |t|
    t.string   "code"
    t.string   "description"
    t.string   "start_state"
    t.string   "goal_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_states", force: true do |t|
    t.string   "user_id"
    t.string   "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_steps", force: true do |t|
    t.string   "user_id"
    t.string   "step_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

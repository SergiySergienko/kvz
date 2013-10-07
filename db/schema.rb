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

ActiveRecord::Schema.define(version: 20131007213612) do

  create_table "buildings", force: true do |t|
    t.integer  "user_id"
    t.integer  "planet_id"
    t.string   "building_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "buildings", ["user_id", "planet_id"], name: "index_buildings_on_user_id_and_planet_id", using: :btree

  create_table "planets", force: true do |t|
    t.integer  "user_id"
    t.integer  "left"
    t.integer  "right"
    t.integer  "sonar_system"
    t.string   "planet_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "planets", ["user_id"], name: "index_planets_on_user_id", using: :btree

  create_table "ships", force: true do |t|
    t.integer  "user_id"
    t.string   "ship_type"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "planet_id"
  end

  add_index "ships", ["planet_id"], name: "index_ships_on_planet_id", using: :btree
  add_index "ships", ["ship_type"], name: "index_ships_on_ship_type", using: :btree
  add_index "ships", ["user_id"], name: "index_ships_on_user_id", using: :btree

  create_table "technologies", force: true do |t|
    t.integer  "user_id"
    t.string   "technology_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "technologies", ["user_id"], name: "index_technologies_on_user_id", using: :btree

  create_table "user_base", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_base", ["login", "password"], name: "index_user_base_on_login_and_password", using: :btree

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active"
    t.integer  "level"
  end

  add_index "users", ["is_active"], name: "index_users_on_is_active", using: :btree

end

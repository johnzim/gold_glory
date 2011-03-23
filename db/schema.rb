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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110221205837) do

  create_table "athletes", :force => true do |t|
    t.integer  "user_id"
    t.string   "gender"
    t.integer  "age"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "skill"
    t.integer  "power"
    t.integer  "speed"
    t.integer  "endurance"
    t.integer  "reflex"
    t.integer  "technique"
    t.integer  "mentality"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "tps"
    t.integer  "penalty_tps"
  end

  add_index "athletes", ["user_id"], :name => "index_athletes_on_user_id"

  create_table "spamboxes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spamposts", :force => true do |t|
    t.string   "content"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spamposts", ["user_id"], :name => "index_spamposts_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "creation_mode"
    t.boolean  "admin"
    t.integer  "tp_total"
  end

end
